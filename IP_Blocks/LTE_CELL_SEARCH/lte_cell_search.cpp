#include <hls_math.h>

#include "fir.h"
#include "lte_cell_search.h"

void copy_input(hls::stream<sample_pkt> &IN_R, data_t &IN_R_data,
                hls::stream<sample_pkt> &IN_I, data_t &IN_I_data,
                ap_uint<8> offset, ap_uint<1> &run, ap_uint<32> count)
{
  data_t IN_R_temp1[SAMPLES_PER_CYCLE], IN_I_temp1[SAMPLES_PER_CYCLE];
  data_t IN_R_temp2[SAMPLES_PER_CYCLE], IN_I_temp2[SAMPLES_PER_CYCLE];

  sample_pkt t_r, t_i;
  ap_int<16> *temp_r;
  ap_int<16> *temp_i;

  t_r = IN_R.read();
  t_i = IN_I.read();

  temp_r = (ap_int<16>*)&t_r.data;
  temp_i = (ap_int<16>*)&t_i.data;

  for(ap_uint<16> j = 0; j < SAMPLES_PER_CYCLE; j++)
  {
#pragma HLS PIPELINE II=1
    IN_R_temp1[j] = ap_fixed<48,20>(temp_r[j])/ap_fixed<48,20>(SCALE_FACTOR);
    IN_I_temp1[j] = ap_fixed<48,20>(temp_i[j])/ap_fixed<48,20>(SCALE_FACTOR);
#ifdef FILTER_SAMPLES
    fir_complex(C, IN_R_temp1[j], IN_I_temp1[j], IN_R_temp2[j], IN_I_temp2[j]);
#else
    IN_R_temp2[j] = IN_R_temp1[j] ;
    IN_I_temp2[j] = IN_I_temp1[j] ;
#endif /* FILTER_SAMPLES */
  }

  /* Pick only 1 sample (8x Decimation) */
  IN_R_data = IN_R_temp2[offset];
  IN_I_data = IN_I_temp2[offset];

  /* This will break the loop*/
  if(t_r.last == 1 || t_i.last == 1 ||
     count == NUM_INPUT_SAMPLES/SAMPLES_PER_CYCLE - 1)
  {
    run = 0;
  }
  else
  {
    run = 1;
  }
}

void compute_conjugate(data_t IN_R, data_t IN_I,
                       data_t& OUT_R, data_t& OUT_I)
{
  static data_t samp_buff_r[SIZE_FFT] = {0}, samp_buff_i[SIZE_FFT] = {0};

  OUT_R = IN_R*samp_buff_r[SIZE_FFT-1] + IN_I*samp_buff_i[SIZE_FFT-1];
  OUT_I = IN_I*samp_buff_r[SIZE_FFT-1] - IN_R*samp_buff_i[SIZE_FFT-1];

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
                   data_t& OUT_R, data_t& OUT_I)
{
  static data_t cp_samp_buff_r[CP_L] = {0}, cp_samp_buff_i[CP_L] = {0};
  static data_t corr_sum_r=0,corr_sum_i=0;
  data_t temp_r,temp_i;

  temp_r = IN_R - cp_samp_buff_r[CP_L-1];
  temp_i = IN_I - cp_samp_buff_i[CP_L-1];

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
                     data_t& OUT_R, data_t& OUT_I,
                     ap_uint<1>& valid_out)
{
  static data_t slot_samp_buff_r[SL_NUM] = {0}, slot_samp_buff_i[SL_NUM] = {0};
  static data_t slot_max_r = 0,slot_max_i = 0;
  static data_t mag = 0, angle = 0;
  static ap_uint<16> count = 0;

  data_t temp_slot_r, temp_slot_i, temp_mag;
  temp_slot_r = IN_R + slot_samp_buff_r[821] + slot_samp_buff_r[684] + slot_samp_buff_r[547] + slot_samp_buff_r[410] + slot_samp_buff_r[273] + slot_samp_buff_r[136];
  temp_slot_i = IN_I + slot_samp_buff_i[821] + slot_samp_buff_i[684] + slot_samp_buff_i[547] + slot_samp_buff_i[410] + slot_samp_buff_i[273] + slot_samp_buff_i[136];

  for(ap_uint<16> i = SL_NUM-1; i > 0; i--)
  {
#pragma HLS PIPELINE II=1
    slot_samp_buff_r[i] = slot_samp_buff_r[i-1];
    slot_samp_buff_i[i] = slot_samp_buff_i[i-1];
  }

  slot_samp_buff_r[0] = IN_R;
  slot_samp_buff_i[0] = IN_I;

  temp_mag = temp_slot_r*temp_slot_r + temp_slot_i*temp_slot_i;
  if(mag < temp_mag)
  {
    mag = temp_mag;
    slot_max_r = temp_slot_r;
    slot_max_i = temp_slot_i;
  }

  if(count == NUM_SAMP_IN_SLOT - 1)
  {
    valid_out = 1;
    count = 0;
    mag = 0;
  }
  else
  {
    valid_out = 0;
    count += 1;
  }

  OUT_R = slot_max_r;
  OUT_I = slot_max_i;
}

void avg_within_frame(data_t IN_R, data_t IN_I,
                      ap_int<32> &freq_out,
                      ap_uint<1> valid)
{
  static data_t angle_buff[NUM_SLOT] = {0};
  static data_t curr_ang = 0;
  static data_t count = 0;

  data_t temp_ang, temp;

  if(valid == 0)
  {
    return;
  }
  count = count+1;

  temp_ang = hls::atanf(ap_fixed<32,0>(IN_I)/ap_fixed<32,0>(IN_R));
  temp = temp_ang - angle_buff[NUM_SLOT-1];

  for(ap_uint<16> i = NUM_SLOT-1; i > 0; i--)
  {
#pragma HLS PIPELINE II=1
    angle_buff[i] = angle_buff[i-1];
  }

  angle_buff[0] = temp_ang;
  curr_ang = curr_ang + temp;

  freq_out = ap_fixed<48,8>(119.3662)*curr_ang*ap_fixed<48,32>(SCALE_FACTOR);
}

void copy_output(ap_int<32> freq_out,
                 hls::stream<freq_pkt> &OUT,
                 ap_uint<1> run, ap_uint<1> valid)
{
  freq_pkt t;
  ap_int<32> *tmp_out = (ap_int<32>*)&t.data;

  t.keep = -1;
  t.strb = 1;
  t.last = 0;

  *tmp_out = freq_out;

  if(run == 0)
  {
    t.last = 1;
    OUT.write(t);
  }
  else if(valid == 1)
  {
    OUT.write(t);
  }
}

void lteCellSearch(hls::stream<sample_pkt> &IN_R, hls::stream<sample_pkt> &IN_I,
                   hls::stream<freq_pkt> &OUT)
{
#pragma HLS INTERFACE axis depth=1024 port=OUT
#pragma HLS INTERFACE axis depth=1024 port=IN_R
#pragma HLS INTERFACE axis depth=1024 port=IN_I
#pragma HLS INTERFACE s_axilite port=return bundle=CTRL

  for(ap_uint<32> iter = 0; iter < NUM_INPUT_SAMPLES/SAMPLES_PER_CYCLE; iter ++)
  {
#pragma HLS DATAFLOW
    ap_int<32> freq_out;
    ap_uint<1> run, valid;
    data_t IN_real, IN_imag;
    data_t conj_rslt_r, conj_rslt_i;
    data_t avg_r, avg_i, avg_slot_r, avg_slot_i;

    copy_input(IN_R, IN_real, IN_I, IN_imag, SAMPLE_SELECT, run, iter);
    compute_conjugate(IN_real, IN_imag, conj_rslt_r, conj_rslt_i);
    avg_within_cp(conj_rslt_r, conj_rslt_i, avg_r, avg_i);
    avg_within_slot(avg_r,avg_i, avg_slot_r, avg_slot_i, valid);
    avg_within_frame(avg_slot_r, avg_slot_i, freq_out, valid);
    copy_output(freq_out, OUT, run, valid);
  }
}
