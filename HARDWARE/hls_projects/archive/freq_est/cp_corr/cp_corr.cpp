#include "math.h"
#include "cp_corr.h"

void copy_input(hls::stream<data_pkt> &IN_R, DTYPE& IN_R_temp, hls::stream<data_pkt> &IN_I,DTYPE& IN_I_temp, int& run)
{
  data_pkt t_r,t_i;

  t_r = IN_R.read();
  t_i = IN_I.read();

  IN_R_temp = t_r.data;
  IN_I_temp = t_i.data;

  /* This will break the loop*/
  if(t_r.last == 1)
  {
    run = 0;
  }
}

void compute_conjugate(DTYPE IN_R, DTYPE IN_I, DTYPE& OUT_R, DTYPE& OUT_I)
{
  static DTYPE samp_buff_r[SIZE_FFT] = {0}, samp_buff_i[SIZE_FFT] = {0};

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

void avg_within_cp(DTYPE IN_R,DTYPE IN_I,DTYPE& OUT_R,DTYPE& OUT_I)
{
  static DTYPE cp_samp_buff_r[CP_L] = {0};
  static DTYPE cp_samp_buff_i[CP_L] = {0};
  static DTYPE corr_sum_r=0,corr_sum_i=0;

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

  OUT_R = 0.125*corr_sum_r;
  OUT_I = 0.125*corr_sum_i;

}

void avg_within_slot(DTYPE IN_R,DTYPE IN_I,DTYPE& OUT_R,DTYPE& OUT_I, int& valid_out)
{
  static DTYPE slot_samp_buff_r[SL_NUM] = {0};
  static DTYPE slot_samp_buff_i[SL_NUM] = {0};
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
    count = 0;
    valid_out = 1;
    mag = 0;
  }

  OUT_R = slot_max_r;
  OUT_I = slot_max_i;
}

void avg_within_frame(DTYPE IN_R,DTYPE IN_I,DTYPE& freq, int& valid)
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

  temp_ang = atan(IN_I/IN_R);


  temp = temp_ang - angle_buff[NUM_SLOT-1];

  for(int i = NUM_SLOT-1; i > 0; i--)
  {
    angle_buff[i] = angle_buff[i-1];
  }

  angle_buff[0] = temp_ang;


  curr_ang = curr_ang + temp;

  freq = 119.3662*curr_ang;
}


void write_output(DTYPE IN,hls::stream<data_pkt> &OUT, int run, int valid)
{
  data_pkt t;
  t.keep = -1;
  t.strb = 1;
  t.last = 0;

  t.data = IN;

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

void cp_corr_dataflow(hls::stream<data_pkt> &IN_R,hls::stream<data_pkt> &IN_I,hls::stream<data_pkt> &OUT)
{

}

void cp_corr(hls::stream<data_pkt> &IN_R,hls::stream<data_pkt> &IN_I,hls::stream<data_pkt> &OUT)
{
#pragma HLS INTERFACE axis port=IN_R
#pragma HLS INTERFACE axis port=IN_I
#pragma HLS INTERFACE axis port=OUT
#pragma HLS INTERFACE s_axilite port=return bundle=control

  DTYPE IN_real,IN_imag,output;
  DTYPE conj_rslt_r,conj_rslt_i;
  DTYPE avg_r,avg_i, avg_slot_r,avg_slot_i, freq;
  int run = 1, valid = 0, k = 0;

  while(run)
  {
#pragma HLS DATAFLOW
    copy_input(IN_R,IN_real,IN_I,IN_imag,run);
    compute_conjugate(IN_real,IN_imag,conj_rslt_r,conj_rslt_i);
    avg_within_cp(conj_rslt_r,conj_rslt_i,avg_r,avg_i);
    avg_within_slot(avg_r,avg_i,avg_slot_r,avg_slot_i,valid);
    avg_within_frame(avg_slot_r,avg_slot_i,freq,valid);
    write_output(freq,OUT,run,valid);
  }
}



