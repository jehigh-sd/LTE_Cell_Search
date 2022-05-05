#include <hls_math.h>
#include "lteCellSearch.h"

void copy_input(hls::stream<sample_pkt> &IN_R, DTYPE IN_R_temp[],
                hls::stream<sample_pkt> &IN_I, DTYPE IN_I_temp[],
                int &run, int iter)
{
  sample_pkt t_r, t_i;
  int16_t *temp_r;
  int16_t *temp_i;

  t_r = IN_R.read();
  t_i = IN_I.read();

  temp_r = (int16_t*)&t_r.data;
  temp_i = (int16_t*)&t_i.data;

  for(int j = 0; j < SAMPLES_PER_CYCLE; j++)
  {
    IN_R_temp[j] = DTYPE(ap_fixed<48,20>(temp_r[j])/ap_fixed<48,20>(SCALE_FACTOR));
    IN_I_temp[j] = DTYPE(ap_fixed<48,20>(temp_i[j])/ap_fixed<48,20>(SCALE_FACTOR));
  }

  /* This will break the loop*/
  if(t_r.last == 1 || t_i.last == 1 || iter == NUM_INPUT_SAMPLES/SAMPLES_PER_CYCLE - 1)
  {
    run = 0;
  }
  else
  {
    run = 1;
  }
}

void compute_conjugate(DTYPE IN_R, DTYPE IN_I, DTYPE& OUT_R, DTYPE& OUT_I)
{
  static DTYPE samp_buff_r[SIZE_FFT] = {0}, samp_buff_i[SIZE_FFT] = {0};
#pragma HLS ARRAY_PARTITION variable=samp_buff_r type=block factor=2
#pragma HLS ARRAY_PARTITION variable=samp_buff_i type=block factor=2

  OUT_R = IN_R*samp_buff_r[SIZE_FFT-1] + IN_I*samp_buff_i[SIZE_FFT-1];
  OUT_I = IN_I*samp_buff_r[SIZE_FFT-1] - IN_R*samp_buff_i[SIZE_FFT-1];

  for(int i = SIZE_FFT-1; i > 0; i--)
  {
    samp_buff_r[i] = samp_buff_r[i-1];
    samp_buff_i[i] = samp_buff_i[i-1];
  }

  samp_buff_r[0] = IN_R;
  samp_buff_i[0] = IN_I;
}

void avg_within_cp(DTYPE IN_R, DTYPE IN_I, DTYPE& OUT_R, DTYPE& OUT_I)
{
  static DTYPE corr_sum_r=0,corr_sum_i=0;
  static DTYPE cp_samp_buff_r[CP_L] = {0};
  static DTYPE cp_samp_buff_i[CP_L] = {0};
#pragma HLS ARRAY_PARTITION variable=cp_samp_buff_r type=block factor=2
#pragma HLS ARRAY_PARTITION variable=cp_samp_buff_i type=block factor=2

  DTYPE temp_r,temp_i;

  temp_r = IN_R - cp_samp_buff_r[CP_L-1];
  temp_i = IN_I - cp_samp_buff_i[CP_L-1];

  for(int i = CP_L-1; i > 0; i--)
  {
    cp_samp_buff_r[i] = cp_samp_buff_r[i-1];
    cp_samp_buff_i[i] = cp_samp_buff_i[i-1];
  }

  cp_samp_buff_r[0] = IN_R;
  cp_samp_buff_i[0] = IN_I;

  corr_sum_r = corr_sum_r + temp_r;
  corr_sum_i = corr_sum_i + temp_i;

  OUT_R = DTYPE(0.125)*corr_sum_r;
  OUT_I = DTYPE(0.125)*corr_sum_i;
}

void avg_within_slot(DTYPE IN_R,DTYPE IN_I,DTYPE& OUT_R,DTYPE& OUT_I, int& valid_out)
{
  static DTYPE slot_samp_buff_r[SL_NUM] = {0};
  static DTYPE slot_samp_buff_i[SL_NUM] = {0};
#pragma HLS ARRAY_PARTITION variable=slot_samp_buff_r type=cyclic factor=2
#pragma HLS ARRAY_PARTITION variable=slot_samp_buff_i type=cyclic factor=2

  static DTYPE slot_max_r=0,slot_max_i=0;
  static DTYPE mag = 0, angle = 0;
  static int count = 0;

  DTYPE temp_slot_r,temp_slot_i, temp_mag;

  valid_out = 0;
  count = count + 1;
  temp_slot_r = IN_R + slot_samp_buff_r[821] + slot_samp_buff_r[684] + slot_samp_buff_r[547] + slot_samp_buff_r[410] + slot_samp_buff_r[273] + slot_samp_buff_r[136];
  temp_slot_i = IN_I + slot_samp_buff_i[821] + slot_samp_buff_i[684] + slot_samp_buff_i[547] + slot_samp_buff_i[410] + slot_samp_buff_i[273] + slot_samp_buff_i[136];

  for(int i = SL_NUM-1; i > 0; i--)
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

  if(count == NUM_SAMP_IN_SLOT)
  {
    valid_out = 1;
    count = 0;
    mag = 0;
  }

  OUT_R = slot_max_r;
  OUT_I = slot_max_i;
}

void avg_within_frame(DTYPE IN_R, DTYPE IN_I, DTYPE& freq, int& valid)
{
  static DTYPE angle_buff[NUM_SLOT] = {0};
  static DTYPE curr_ang = 0;
  static DTYPE count = 0;

  DTYPE temp_ang, temp;

  if(valid == 0)
  {
    return;
  }
  count = count+1;

  temp_ang = hls::atanf(ap_fixed<32,0>(IN_I)/ap_fixed<32,0>(IN_R));
  temp = temp_ang - angle_buff[NUM_SLOT-1];

  for(int i = NUM_SLOT-1; i > 0; i--)
  {
    angle_buff[i] = angle_buff[i-1];
  }

  angle_buff[0] = temp_ang;
  curr_ang = curr_ang + temp;

  freq = curr_ang;
}

void write_output(DTYPE IN, hls::stream<freq_pkt> &OUT, int run, int valid, int index)
{
  freq_pkt t;
  int32_t *tmp_out = (int32_t*)&t.data;

  t.keep = -1;
  t.strb = 1;
  t.last = 0;

  *tmp_out = ap_fixed<48,8>(119.3662)*IN*ap_fixed<48,32>(SCALE_FACTOR);

  if(run == 0 && index == SAMPLES_PER_CYCLE-1)
  {
    t.last = 1;
    OUT.write(t);
  }
  else if(valid == 1)
  {
    OUT.write(t);
  }
}

void cellSearchLoop(DTYPE IN_real[], DTYPE IN_imag[], int &run, hls::stream<freq_pkt> &OUT)
{
  for(int index = 0; index < SAMPLES_PER_CYCLE; index++)
  {
#pragma HLS PIPELINE II=1
	int valid;
	DTYPE conj_rslt_r, conj_rslt_i;
	DTYPE avg_r, avg_i, avg_slot_r, avg_slot_i, freq;
	compute_conjugate(IN_real[index], IN_imag[index], conj_rslt_r, conj_rslt_i);
	avg_within_cp(conj_rslt_r, conj_rslt_i, avg_r, avg_i);
	avg_within_slot(avg_r,avg_i, avg_slot_r, avg_slot_i, valid);
	avg_within_frame(avg_slot_r, avg_slot_i, freq, valid);
	write_output(freq, OUT, run, valid, index);
  }
}

void lteCellSearch(hls::stream<sample_pkt> &IN_R, hls::stream<sample_pkt> &IN_I,
                   hls::stream<freq_pkt> &OUT)
{
#pragma HLS INTERFACE axis depth=1024 port=OUT
#pragma HLS INTERFACE axis depth=1024 port=IN_R
#pragma HLS INTERFACE axis depth=1024 port=IN_I
#pragma HLS INTERFACE s_axilite port=return bundle=CTRL

  for(int iter = 0; iter < NUM_INPUT_SAMPLES/SAMPLES_PER_CYCLE; iter++)
  {
#pragma HLS DATAFLOW
	int run;
    DTYPE IN_real[SAMPLES_PER_CYCLE], IN_imag[SAMPLES_PER_CYCLE];
    copy_input(IN_R, IN_real, IN_I, IN_imag, run, iter);
    cellSearchLoop(IN_real, IN_imag, run, OUT);
  }
}
