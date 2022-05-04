#include "math.h"
#include "cp_corr_pss_sss.h"

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


void sss(DTYPE n_id_1,DTYPE n_id_2,DTYPE slot_num)
{

	if ((slot_num!=0)&(slot_num~=10))
	{
		return;
	}

	else if
	{
		qp=floor(n_id_1/30);
		q=floor((n_id_1+qp*(qp+1)/2)/30);
		mp=n_id_1+q*(q+1)/2;
		m0=mod(mp,31);
		m1=mod(m0+floor(mp/31)+1,31);

		%s_td=[0 0 0 0 1];
		%for t=1:26
		%  s_td=[s_td mod(s_td(end-2)+s_td(end-4),2)];
		%end
		s_td=[0 0 0 0 1 0 0 1 0 1 1 0 0 1 1 1 1 1 0 0 0 1 1 0 1 1 1 0 1 0 1];
		s_td=1-2*s_td;

		%c_td=[0 0 0 0 1];
		%for t=1:26
		%  c_td=[c_td mod(c_td(end-1)+c_td(end-4),2)];
		%end
		c_td=[0 0 0 0 1 0 1 0 1 1 1 0 1 1 0 0 0 1 1 1 1 1 0 0 1 1 0 1 0 0 1];
		c_td=1-2*c_td;

		%z_td=[0 0 0 0 1];
		%for t=1:26
		%  z_td=[z_td mod(z_td(end)+z_td(end-2)+z_td(end-3)+z_td(end-4),2)];
		%end
		z_td=[0 0 0 0 1 1 1 0 0 1 1 0 1 1 1 1 1 0 1 0 0 0 1 0 0 1 0 1 0 1 1];
		z_td=1-2*z_td;

		s0_m0=s_td(mod(m0:30+m0,31)+1);
		s1_m1=s_td(mod(m1:30+m1,31)+1);

		c0=c_td(mod(n_id_2:30+n_id_2,31)+1);
		c1=c_td(mod(n_id_2+3:30+n_id_2+3,31)+1);

		z1_m0=z_td(mod((0:30)+mod(m0,8),31)+1);
		z1_m1=z_td(mod((0:30)+mod(m1,8),31)+1);
	}

	else if (slot_num==0)
	{
		s(2:2:62)=s1_m1.*c1.*z1_m0;
		s(1:2:62)=s0_m0.*c0;
	}

	else if (slot_num==10)
	{
		s(2:2:62)=s0_m0.*c1.*z1_m1;
		s(1:2:62)=s1_m1.*c0;
	}

	else
	{
		return;
	}

}

//Generate PSS signal Zadoff-Chu Sequences for NID=0

void generate_PSS_Zadoff_Chu()
{
	u_shift = [25 29 34];
	d_u_0 = [];
	d_u_1 = [];
	d_u_2 = [];

	for(int i = 0; i > 61; i++)
	{
		    u_0 = u_shift(1);
		    u_1 = u_shift(2);
		    u_2 = u_shift(3);
		    for(int i = 0; i <= 61; i++)
		    {
		        d_0 = exp(-j*pi*u_0*n*(n+1)/63);
		        d_1 = exp(-j*pi*u_1*n*(n+1)/63);
		        d_2 = exp(-j*pi*u_2*n*(n+1)/63);
		    }

		    else
		    {
		        d_0 = exp(-j*pi*u_0*(n+1)*(n+2)/63);
		        d_1 = exp(-j*pi*u_1*(n+1)*(n+2)/63);
		        d_2 = exp(-j*pi*u_2*(n+1)*(n+2)/63);
		    }

		    d_u_0 = [d_u_0 d_0];
		    d_u_1 = [d_u_1 d_1];
		    d_u_2 = [d_u_2 d_2];
	}

}

//Correlation with PSS Sequence-0/1/2

void pss_correlation(DTYPE pss_rslts_0[], DTYPE pss_rslts_1[], DTYPE pss_rslts_2[], t)
{
	for(int i = 0; i < 1088*t; i++)
	{
	    A = downsampled(i:i+127);
	    temp0 = A.'*td_pss_0';
	    temp1 = A.'*td_pss_1';
	    temp2 = A.'*td_pss_2';
	    pss_rslts_0(i) = abs(temp0);
	    pss_rslts_1(i) = abs(temp1);
	    pss_rslts_2(i) = abs(temp2);
	}

	//void avg_within_cp(DTYPE IN_R,DTYPE IN_I,DTYPE& OUT_R,DTYPE& OUT_I)

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



