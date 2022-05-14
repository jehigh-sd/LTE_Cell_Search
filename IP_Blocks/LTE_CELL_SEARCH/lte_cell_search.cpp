#include <hls_math.h>

#include "fir.h"
#include "lte_cell_search.h"

void passthrough_samples(hls::stream<sample_pkt> &IN_R, hls::stream<sample_pkt> &IN_I,
						 data_t &data_Real, data_t &data_Imag,
						 bool filter, ap_uint<8> offset,
						 bool &run)
{
  data_t tmp_R[SAMPLES_PER_CYCLE], tmp_I[SAMPLES_PER_CYCLE];
  data_t data_R[SAMPLES_PER_CYCLE], data_I[SAMPLES_PER_CYCLE];

  sample_pkt t_r_in, t_i_in;
  adc_data_t *temp_r_in, *temp_i_in;

  /* Read Samples Begin */
  t_r_in = IN_R.read();
  t_i_in = IN_I.read();
  /* Read Samples End */

  /* Extract Samples */
  temp_r_in = (adc_data_t*)&t_r_in.data;
  temp_i_in = (adc_data_t*)&t_i_in.data;

  /* Filter Samples */
  for(ap_uint<16> j = 0; j < SAMPLES_PER_CYCLE; j++)
  {
	tmp_R[j] = ap_fixed<32,16>(temp_r_in[j])/ap_fixed<32,16>(SCALE_FACTOR);
	tmp_I[j] = ap_fixed<32,16>(temp_i_in[j])/ap_fixed<32,16>(SCALE_FACTOR);

	if(filter)
	{
	  fir_complex(C, tmp_R[j], tmp_I[j], data_R[j], data_I[j]);
	}
	else
	{
      data_R[j] = tmp_R[j];
      data_I[j] = tmp_I[j];
    }
  }

  /* Pick only 1 sample (8x Decimation) */
  data_Real = data_R[offset];
  data_Imag = data_I[offset];

#ifdef SIMULATION
  if (t_r_in.last || t_i_in.last)
  {
     run = false;
  }
#endif
}

void compute_conjugate(data_t IN_R, data_t IN_I,
		               data_t &OUT_R, data_t &OUT_I)
{
  static data_t samp_buff_r[SIZE_FFT] = {0}, samp_buff_i[SIZE_FFT] = {0};
#pragma HLS ARRAY_PARTITION variable=samp_buff_r block factor=2
#pragma HLS ARRAY_PARTITION variable=samp_buff_i block factor=2
  OUT_R = IN_R*samp_buff_r[SIZE_FFT-1] + IN_I*samp_buff_i[SIZE_FFT-1];
  OUT_I = IN_I*samp_buff_r[SIZE_FFT-1] - IN_R*samp_buff_i[SIZE_FFT-1];

  for(ap_uint<16> i = SIZE_FFT-1; i > 0; i--)
  {
    samp_buff_r[i] = samp_buff_r[i-1];
    samp_buff_i[i] = samp_buff_i[i-1];
  }

  samp_buff_r[0] = IN_R;
  samp_buff_i[0] = IN_I;
}

void avg_within_cp(data_t IN_R, data_t IN_I,
		           data_t &OUT_R, data_t &OUT_I)
{
  static data_t cp_samp_buff_r[CP_L] = {0}, cp_samp_buff_i[CP_L] = {0};
#pragma HLS ARRAY_PARTITION variable=cp_samp_buff_r block factor=2
#pragma HLS ARRAY_PARTITION variable=cp_samp_buff_i block factor=2
  static data_t corr_sum_r=0,corr_sum_i=0;
  data_t temp_r,temp_i;

  temp_r = IN_R - cp_samp_buff_r[CP_L-1];
  temp_i = IN_I - cp_samp_buff_i[CP_L-1];

  for(ap_uint<16> i = CP_L-1; i > 0; i--)
  {
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
					 bool &valid_out)
{
  static data_t slot_samp_buff_r[SL_NUM] = {0}, slot_samp_buff_i[SL_NUM] = {0};
#pragma HLS ARRAY_PARTITION variable=slot_samp_buff_r complete
#pragma HLS ARRAY_PARTITION variable=slot_samp_buff_i complete
  static data_t slot_max_r = 0,slot_max_i = 0;
  static data_t mag = 0, angle = 0;
  static ap_uint<16> count = 0;

  data_t temp_slot_r, temp_slot_i, temp_mag;
  temp_slot_r = IN_R + slot_samp_buff_r[821] + slot_samp_buff_r[684] + slot_samp_buff_r[547] + slot_samp_buff_r[410] + slot_samp_buff_r[273] + slot_samp_buff_r[136];
  temp_slot_i = IN_I + slot_samp_buff_i[821] + slot_samp_buff_i[684] + slot_samp_buff_i[547] + slot_samp_buff_i[410] + slot_samp_buff_i[273] + slot_samp_buff_i[136];

  for(ap_uint<16> i = SL_NUM-1; i > 0; i--)
  {
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
		              data_t &freqEst,
					  bool valid)
{
  static data_t angle_buff[NUM_SLOT] = {0};
#pragma HLS ARRAY_PARTITION variable=angle_buff block factor=2
  static data_t curr_ang = 0;
  static data_t count = 0;

  data_t temp_ang, temp;

  if(valid == 0)
  {
    return;
  }
  count = count+1;

  temp_ang = hls::atanf(IN_I/IN_R);
  temp = temp_ang - angle_buff[NUM_SLOT-1];

  for(ap_uint<16> i = NUM_SLOT-1; i > 0; i--)
  {
    angle_buff[i] = angle_buff[i-1];
  }

  angle_buff[0] = temp_ang;
  curr_ang = curr_ang + temp;

  freqEst = curr_ang;
}

#ifdef SIMULATION
void copy_output(data_t freqEst, bool valid,
		         hls::stream<freq_pkt> &OUT_F, bool run)
#else
void copy_output(data_t freqEst, bool valid,
		         int *OUT_F, bool run)
#endif
{
#ifdef SIMULATION
  freq_pkt t;
  freq_t *tmp_out = (freq_t*)&t.data;

  t.keep = -1;
  t.strb = 1;
  t.last = 0;

  *tmp_out = ap_fixed<32,16>(119.3662)*freqEst*ap_fixed<32,16>(SCALE_FACTOR);

  if(run == 0)
  {
    t.last = 1;
    OUT_F.write(t);
  }
  else if(valid == 1)
  {
	  OUT_F.write(t);
  }
#else
  if(valid == 1)
  {
	  *OUT_F = ap_fixed<32,16>(119.3662)*freqEst*ap_fixed<32,16>(SCALE_FACTOR);
  }
#endif
}

#ifdef SIMULATION
void lteCellSearch(hls::stream<sample_pkt> &IN_R,  hls::stream<sample_pkt> &IN_I,
				   hls::stream<freq_pkt> &OUT_F)
#else
void lteCellSearch(hls::stream<sample_pkt> &IN_R,  hls::stream<sample_pkt> &IN_I,
				   int *OUT_F)
#endif
{
#pragma HLS INTERFACE s_axilite port=OUT_F bundle=S_AXI_LITE
#pragma HLS INTERFACE axis depth=1024 port=IN_R
#pragma HLS INTERFACE axis depth=1024 port=IN_I
#pragma HLS INTERFACE ap_ctrl_none port=return

  bool valid, run = 1, filter = FILTER_SAMPLES;
  ap_uint<8> offset = SAMPLE_SELECT;
  data_t freqEst[256];
  ap_uint<8> trip = 0;

  data_t IN_real, IN_imag;
  data_t conj_rslt_r, conj_rslt_i;
  data_t avg_r, avg_i, avg_slot_r, avg_slot_i;

  do
  {
#pragma HLS PIPELINE II=1
	passthrough_samples(IN_R, IN_I, IN_real, IN_imag, filter, offset, run);
	compute_conjugate(IN_real, IN_imag, conj_rslt_r, conj_rslt_i);
	avg_within_cp(conj_rslt_r, conj_rslt_i, avg_r, avg_i);
    avg_within_slot(avg_r,avg_i, avg_slot_r, avg_slot_i, valid);
    avg_within_frame(avg_slot_r, avg_slot_i, freqEst[trip], valid);
    copy_output(freqEst[trip], valid, OUT_F, run);
    trip++;
  } while(run);
}
