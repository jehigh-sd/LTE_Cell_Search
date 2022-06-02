#include <hls_math.h>
#include "lte_cell_search.h"

void copy_input(hls::stream<sample_pkt> &IN_R, hls::stream<sample_pkt> &IN_I,
                data_t &OUT_R, data_t &OUT_I, bool &eos)
{
#pragma HLS PIPELINE II=1
  sample_pkt t_r_in, t_i_in;
  adc_data_t *temp_r_in, *temp_i_in;

  /* Read Samples from Input */
  t_r_in = IN_R.read();
  t_i_in = IN_I.read();

  /* Get Input samples handle */
  temp_r_in = (adc_data_t*)&t_r_in.data;
  temp_i_in = (adc_data_t*)&t_i_in.data;

  /* Copy Input Samples */
  OUT_R = math_t(*temp_r_in) * math_t(ADC_SCALE_D_FACTOR);
  OUT_I = math_t(*temp_i_in) * math_t(ADC_SCALE_D_FACTOR);

#ifdef SIMULATION
  if (t_r_in.last || t_i_in.last)
  {
    eos = true;
  }
#endif
}

void compute_conjugate(data_t IN_R, data_t IN_I,
                       data_t &OUT_R, data_t &OUT_I,
                       bool run)
{
#pragma HLS PIPELINE II=1
  static data_t samp_buff_r[SIZE_FFT] = {0}, samp_buff_i[SIZE_FFT] = {0};
#pragma HLS ARRAY_PARTITION variable=samp_buff_r block factor=2
#pragma HLS ARRAY_PARTITION variable=samp_buff_i block factor=2

  if(false == run)
  {
    for(ap_uint<16> i = 0; i < SIZE_FFT; i++)
    {
#pragma HLS PIPELINE II=1
      samp_buff_r[i] = 0;
      samp_buff_i[i] = 0;
    }
  }

  OUT_R = IN_R * samp_buff_r[SIZE_FFT-1] + IN_I * samp_buff_i[SIZE_FFT-1];
  OUT_I = IN_I * samp_buff_r[SIZE_FFT-1] - IN_R * samp_buff_i[SIZE_FFT-1];

  compute_conjugate:
  for(ap_uint<16> i = SIZE_FFT-1; i > 0; i--)
  {
#pragma HLS PIPELINE II=1
    samp_buff_r[i] = samp_buff_r[i-1];
    samp_buff_i[i] = samp_buff_i[i-1];
  }

  samp_buff_r[0] = IN_R;
  samp_buff_i[0] = IN_I;
}

void avg_within_cp(data_t IN_R, data_t IN_I,
                   data_t &OUT_R, data_t &OUT_I,
                   bool run)
{
#pragma HLS PIPELINE II=1
  static data_t cp_samp_buff_r[CP_L] = {0}, cp_samp_buff_i[CP_L] = {0};
#pragma HLS ARRAY_PARTITION variable=cp_samp_buff_r block factor=2
#pragma HLS ARRAY_PARTITION variable=cp_samp_buff_i block factor=2

  static data_t corr_sum_r = 0, corr_sum_i = 0;
  data_t temp_r, temp_i;

  if(false == run)
  {
    corr_sum_r = 0;
    corr_sum_i = 0;
    for(ap_uint<16> i = 0; i < CP_L; i++)
    {
#pragma HLS PIPELINE II=1
      cp_samp_buff_r[i] = 0;
      cp_samp_buff_i[i] = 0;
    }
  }

  temp_r = IN_R - cp_samp_buff_r[CP_L-1];
  temp_i = IN_I - cp_samp_buff_i[CP_L-1];

  avg_within_cp:
  for(ap_uint<16> i = CP_L-1; i > 0; i--)
  {
#pragma HLS PIPELINE II=1
    cp_samp_buff_r[i] = cp_samp_buff_r[i-1];
    cp_samp_buff_i[i] = cp_samp_buff_i[i-1];
  }

  cp_samp_buff_r[0] = IN_R;
  cp_samp_buff_i[0] = IN_I;

  corr_sum_r = corr_sum_r + temp_r;
  corr_sum_i = corr_sum_i + temp_i;

  OUT_R = data_t(0.125)*corr_sum_r;
  OUT_I = data_t(0.125)*corr_sum_i;
}

void avg_within_slot(data_t IN_R, data_t IN_I,
                     data_t &OUT_R, data_t &OUT_I,
                     bool &valid_out, bool run)
{
#pragma HLS PIPELINE II=1
  static data_t slot_samp_buff_r[SL_NUM] = {0}, slot_samp_buff_i[SL_NUM] = {0};
#pragma HLS ARRAY_PARTITION variable=slot_samp_buff_r complete
#pragma HLS ARRAY_PARTITION variable=slot_samp_buff_i complete

  static data_t slot_max_r = 0, slot_max_i = 0, mag = 0;
  static ap_uint<16> count = 0;

  data_t temp_slot_r, temp_slot_i, temp_mag;

  if(false == run)
  {
    slot_max_r = 0;
    slot_max_i = 0;
    count = 0;
    mag = 0;
    for(ap_uint<16> i = 0; i < SL_NUM; i++)
    {
#pragma HLS PIPELINE II=1
      slot_samp_buff_r[i] = 0;
      slot_samp_buff_i[i] = 0;
    }
  }

  temp_slot_r = IN_R + slot_samp_buff_r[821] + slot_samp_buff_r[684] + slot_samp_buff_r[547] + slot_samp_buff_r[410] + slot_samp_buff_r[273] + slot_samp_buff_r[136];
  temp_slot_i = IN_I + slot_samp_buff_i[821] + slot_samp_buff_i[684] + slot_samp_buff_i[547] + slot_samp_buff_i[410] + slot_samp_buff_i[273] + slot_samp_buff_i[136];

  avg_within_slot:
  for(ap_uint<16> i = SL_NUM-1; i > 0; i--)
  {
#pragma HLS PIPELINE II=1
    slot_samp_buff_r[i] = slot_samp_buff_r[i-1];
    slot_samp_buff_i[i] = slot_samp_buff_i[i-1];
  }

  slot_samp_buff_r[0] = IN_R;
  slot_samp_buff_i[0] = IN_I;

  temp_mag = temp_slot_r * temp_slot_r + temp_slot_i * temp_slot_i;
  if(mag < temp_mag)
  {
    mag = temp_mag;
    slot_max_r = temp_slot_r;
    slot_max_i = temp_slot_i;
  }

  OUT_R = slot_max_r;
  OUT_I = slot_max_i;

  if(count == NUM_SAMP_IN_SLOT - 1)
  {
    valid_out = true;
    count = 0;
    mag = 0;
  }
  else
  {
    valid_out = false;
    count += 1;
  }
}

void avg_within_frame(data_t IN_R, data_t IN_I,
                      data_t &OUT_F,
                      bool valid_in, bool run)
{
#pragma HLS PIPELINE II=1
  static data_t angle_buff[NUM_SLOT] = {0};
#pragma HLS ARRAY_PARTITION variable=angle_buff block factor=2

  static data_t curr_ang = 0;
  data_t temp, temp_ang;

  if(false == run)
  {
    curr_ang = 0;
    for(ap_uint<16> i = 0; i < NUM_SLOT; i++)
    {
#pragma HLS PIPELINE II=1
      angle_buff[i] = 0;
    }
  }

  if(false == valid_in)
  {
    return;
  }

  if(IN_R != 0) /* Avoid divide by zero */
  {
    temp_ang = hls::atanf(IN_I/IN_R);
  }
  else if(IN_I != 0)
  {
    temp_ang = (IN_I > 0) ? ATAN_MAX_P_FACTOR : ATAN_MAX_N_FACTOR;
  }
  else
  {
    temp_ang = 0;
  }

  temp = temp_ang - angle_buff[NUM_SLOT-1];

  avg_within_frame:
  for(ap_uint<16> i = NUM_SLOT-1; i > 0; i--)
  {
#pragma HLS PIPELINE II=1
    angle_buff[i] = angle_buff[i-1];
  }

  angle_buff[0] = temp_ang;
  curr_ang = curr_ang + temp;

  OUT_F = curr_ang;
}

void copy_output(data_t IN_F, bool valid_in, bool eos,
                 bool run, int *OUT_EST, int *OUT_DBG)
{
#pragma HLS PIPELINE II=1
  static ap_uint<16> temp_runs = 0;
  int tmp_out;

  if(false == run)
  {
    temp_runs = 0;
  }

  tmp_out = freq_t(119.3662)*freq_t(IN_F)*freq_t(FREQ_SCALE_M_FACTOR);
  if(true == eos || true == valid_in)
  {
    OUT_DBG[temp_runs] = *OUT_EST = tmp_out;
    temp_runs++;
  }
}

void lteCellSearch(hls::stream<sample_pkt> &IN_R, hls::stream<sample_pkt> &IN_I,
                   int *OUT_EST, int *OUT_DBG)
{
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS INTERFACE s_axilite port=OUT_EST
#pragma HLS INTERFACE axis depth=1024 port=IN_R
#pragma HLS INTERFACE axis depth=1024 port=IN_I
#pragma HLS INTERFACE m_axi depth=1024 port=OUT_DBG offset=slave

  lteCellSearch:
  for (ap_uint<32> sample = 0; sample < NUM_INPUT_SAMPLES; sample++)
  {
#pragma HLS PIPELINE II=1
    bool eos = false, ready = false, run = bool(sample);
    data_t conj_rslt_r = 0, conj_rslt_i = 0,
           freqEst = 0, data_real = 0, data_imag = 0,
           avg_r = 0, avg_i = 0, avg_slot_r = 0, avg_slot_i = 0;

    copy_input(IN_R, IN_I, data_real, data_imag, eos);
    compute_conjugate(data_real, data_imag, conj_rslt_r, conj_rslt_i, run);
    avg_within_cp(conj_rslt_r, conj_rslt_i, avg_r, avg_i, run);
    avg_within_slot(avg_r,avg_i, avg_slot_r, avg_slot_i, ready, run);
    avg_within_frame(avg_slot_r, avg_slot_i, freqEst, ready, run);
    copy_output(freqEst, ready, eos, run, OUT_EST, OUT_DBG);
  }
}
