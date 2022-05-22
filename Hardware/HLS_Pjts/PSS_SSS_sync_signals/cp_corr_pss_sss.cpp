#include "math.h"
#include "cp_corr_pss_sss.h"

void copy_input(hls::stream<data_pkt> &IN_R, DTYPE& IN_R_temp, hls::stream<data_pkt> &IN_I,DTYPE& IN_I_temp, int &run)
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

void amplitudescale(int input[31], int output[31], int constant)
{
	//int temp = sizeof(input);
    //int t1 = sizeof(&input[31]);
	//int t2 = sizeof(int);
	//int a = sizeof(&input[31])/sizeof(int);
	int a = &input[31] - input;
	for (int i=0; i<a; i++)
	{
		output[i] = input[i] * constant;
	}
}

void amplitudeshift(int input[31], int output[31])
{
	//int a = sizeof(input)/sizeof(int);
	int a = &input[31] - input;
	for (int i=0; i<a; i++)
	{
		output[i] = 1-input[i];
	}
}

//multiplyMatrices(s0_m0, c1, tempMatrix_A, 31, 1);
//multiplyMatrices(tempMatrix_A, z1_m1, tempMatrix_B, 31, 1);

// function to multiply two matrices
void multiplyMatrices(int first[31][1],
                      int second[31][1],
                      int result[31][1],
                      int r1, int c1, int r2, int c2)
{

   // Initializing elements of matrix mult to 0.
   for (int i = 0; i < r1; ++i) {
      for (int j = 0; j < c2; ++j) {
         result[i][j] = 0;
      }
   }

   // Multiplying first and second matrices and storing it in result
   for (int i = 0; i < r1; ++i) {
      for (int j = 0; j < c2; ++j) {
         for (int k = 0; k < c1; ++k) {
            result[i][j] += first[i][k] * second[k][j];
         }
      }
   }

}


void swapArrayElements(int input[31], int output[31], int swapNumber)
{
	int temparray[swapNumber];
	//int array_size = sizeof(input[31])/sizeof(int);
	int array_size = &input[31] - input;

	//Storing first number elements defined by "swapNumber" of the input array
	for(int i = 0; i < swapNumber; i++)
	{
		temparray[i] = input[i];
	}

	//Moving array elements defined by "swapNumber" to starting of the array
	for(int i = 0; i < array_size; i++)
	{
		input[i] = input[i+swapNumber];
	}

	//Finally coping the temp array which has the first few elements defined by "swapNumber" to last of the array.
	for(int i = 0; i < swapNumber; i++)
	{
		input[array_size - i] = temparray[i];
	}

	for(int i = 0; i < array_size; i++)
	{
		output[i] = input[i];
	}

}


void sss(DTYPE n_id_1,DTYPE n_id_2,DTYPE slot_num, DTYPE s[62])
{

	DTYPE qp, q, mp, m0, m1;
	int s_td_out[31], c_td_out[31], z_td_out[31], s0_m0[31], s1_m1[31], c0[31], c1[31], z1_m0[31], z1_m1[31];
	int s_td[31] = {0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1};
	int c_td[31] = {0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1};
	int z_td[31] = {0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1};

	if ((slot_num!=0)&&(slot_num==10))
	{
		return;
	}

	qp = floor((n_id_1/30));
	q  = floor((n_id_1+qp*(qp+1)/2)/30);
	mp = n_id_1+q*(q+1)/2;
	m0 = fmod(mp,31);
	m1 = fmod(m0+floor(mp/31)+1,31);


	amplitudescale(s_td, s_td_out, 2);
	amplitudeshift(s_td_out, s_td);

	amplitudescale(c_td, c_td_out, 2);
	amplitudeshift(c_td_out, c_td);

	amplitudescale(z_td, z_td_out, 2);
	amplitudeshift(z_td_out, z_td);


	//s0_m0=s_td[mod(m0:30+m0,31)+1];
	swapArrayElements(s_td, s0_m0, m0);

	//s1_m1=s_td(mod(m1:30+m1,31)+1);
	swapArrayElements(s_td, s1_m1, m1);

	//c0=c_td(mod(n_id_2:30+n_id_2,31)+1);
	int a = fmod(30+n_id_2,31)+1;
	swapArrayElements(c_td, c0, a);

	//c1=c_td(mod(n_id_2+3:30+n_id_2+3,31)+1);
	a = fmod(30+n_id_2+3,31)+1;
	swapArrayElements(c_td, c1, a);

	//z1_m0=z_td(mod((0:30)+mod(m0,8),31)+1);
	a = (fmod((30)+fmod(m0,8),31)+1);
	swapArrayElements(z_td, z1_m0, a);

	//z1_m1=z_td(mod((0:30)+mod(m1,8),31)+1);
	a = (fmod((30)+fmod(m1,8),31)+1);
	swapArrayElements(z_td, z1_m1, a);

	//int tempMatrix_A[31][1];
	//int tempMatrix_B[31][1];
	//int tempMatrix_A[31];
	//int tempMatrix_B[31];

	if (slot_num==0)
	{
		// even indices of s
		for ( int i = 0, j = 1; i < 31; i++)
		{
			//tempMatrix_A[i] = s1_m1[i] * c1[i];
			//s[i][1] = tempMatrix_A[i] * z1_m0[i];

			s[j] = (s1_m1[i] * c1[i]) * z1_m0[i];
			j += 2;
			//tempMatrix_B[i][1] = tempMatrix_A[i] * z1_m0[i];
			//s[i][1] = tempMatrix_B[i][1];
		}

//		//s(2:2:62) = s1_m1.*c1.*z1_m0;
//		multiplyMatrices(s1_m1, c1, tempMatrix_A, 31, 1);
//		multiplyMatrices(tempMatrix_A, z1_m0, tempMatrix_B, 31, 1);
//		// accessing and updating the elements
//		for ( int i = 0; i < 31; i++)
//		{
//		  // variable i traverses the rows
//		  for ( int j = 0; j < 1; j++)
//		  {
//			  s[i][j] = tempMatrix_B[i][j];
//		  }
//		}

		// odd indices of s
		for ( int i = 0, j = 0; i < 31; i++)
		{
			s[j] = s0_m0[i] * c0[i];
			j += 2;
			//tempMatrix_A[i] = s0_m0[i] * c0[i];
			//s[i][1] = tempMatrix_A[i];
		}

//		//s(1:2:62) = s0_m0.*c0;
//		multiplyMatrices(s0_m0, c0, tempMatrix_A, 31, 1);
//		// accessing and updating the elements
//		for ( int i = 0; i < 31; i++)
//		{
//		  // variable i traverses the rows
//		  for ( int j = 0; j < 1; j++)
//		  {
//			  s[i][j] = tempMatrix_A[i][j];
//		  }
//		}

	}

	else if (slot_num==10)
	{
		// even indices of s
		for ( int i = 0, j = 1; i < 31; i++)
		{
			s[j] = (s0_m0[i] * c1[i]) * z1_m1[i];
			j += 2;
		}

//		//s(2:2:62) = s0_m0.*c1.*z1_m1;
//		//TODO: void matmul_partition(int* in1, int* in2, int* out_r, int size, int rep_count);
//		multiplyMatrices(s0_m0, c1, tempMatrix_A, 31, 1);
//		multiplyMatrices(tempMatrix_A, z1_m1, tempMatrix_B, 31, 1);
//		// accessing and updating the elements
//		for ( int i = 0; i < 31; i++)
//		{
//		  // variable i traverses the rows
//		  for ( int j = 0; j < 1; j++)
//		  {
//			  s[i][j] = tempMatrix_B[i][j];
//		  }
//		}


		// odd indices of s
		for ( int i = 0, j = 0; i < 31; i++)
		{
			s[j] = s1_m1[i] * c0[i];
			j += 2;
			//tempMatrix_A[i] = s0_m0[i] * c0[i];
			//s[i][1] = tempMatrix_A[i];
		}

//		//s(1:2:62) = s1_m1.*c0;
//		multiplyMatrices(s1_m1, c0, tempMatrix_A, 31, 1);
//		// accessing and updating the elements
//		for (int i = 0; i < 31; i++)
//		{
//		  // variable i traverses the rows
//		  for (int j = 0; j < 1; j++)
//		  {
//			  s[i][j] = tempMatrix_A[i][j];
//		  }
//		}
	}

	else
	{
		return;
	}

}

//Generate PSS signal Zadoff-Chu Sequences for NID=0

//void generate_PSS_Zadoff_Chu()
//{
//	uint_6 u_shift[3] = {25, 29, 34};
//	uint_6 d_u_0 [61];
//	uint_6 d_u_1 [61];
//	uint_6 d_u_2 [61];
//
//	uint_6 u_0, u_1, u_2;
//	DTYPE d_0, d_1, d_2;
//
//	for(int n = 0; n > 61; n++)
//	{
//		    u_0 = u_shift[1];
//		    u_1 = u_shift[2];
//		    u_2 = u_shift[3];
//
//		    if (n <= 30)
//		    {
//		    	//-j = sqrt(-1)
//		        d_0 = exp(-sqrt(-1)*pi*u_0*n*(n+1)/63);
//		        d_1 = exp(-sqrt(-1)*pi*u_1*n*(n+1)/63);
//		        d_2 = exp(-sqrt(-1)*pi*u_2*n*(n+1)/63);
//		    }
//
//		    else
//		    {
//		        d_0 = exp(-sqrt(-1)*pi*u_0*(n+1)*(n+2)/63);
//		        d_1 = exp(-sqrt(-1)*pi*u_1*(n+1)*(n+2)/63);
//		        d_2 = exp(-sqrt(-1)*pi*u_2*(n+1)*(n+2)/63);
//		    }
//
//		    d_u_0[n] = d_0;
//		    d_u_1[n] = d_1;
//		    d_u_2[n] = d_2;
//	}
//
//}

//Correlation with PSS Sequence-0/1/2


//void pss_correlation(DTYPE downsampled[], DTYPE pss_rslts_0[], DTYPE pss_rslts_1[], DTYPE pss_rslts_2[], int t)
//{
//	for(int i = 0; i < 1088*t; i++)
//	{
//	    A = downsampled(i:i+127);
//	    temp0 = A.'*td_pss_0';
//	    temp1 = A.'*td_pss_1';
//	    temp2 = A.'*td_pss_2';
//	    pss_rslts_0(i) = abs(temp0);
//	    pss_rslts_1(i) = abs(temp1);
//	    pss_rslts_2(i) = abs(temp2);
//	}


//void avg_within_cp(DTYPE IN_R,DTYPE IN_I,DTYPE& OUT_R,DTYPE& OUT_I)

//	  static DTYPE cp_samp_buff_r[CP_L] = {0};
//	  static DTYPE cp_samp_buff_i[CP_L] = {0};
//	  static DTYPE corr_sum_r=0,corr_sum_i=0;
//
//	  DTYPE temp_r,temp_i;
//
//	  temp_r = IN_R - cp_samp_buff_r[CP_L-1];
//	  temp_i = IN_I - cp_samp_buff_i[CP_L-1];
//
//	  for(int i = CP_L-1; i > 0; i--)
//	  {
//	    cp_samp_buff_r[i] = cp_samp_buff_r[i-1];
//		cp_samp_buff_i[i] = cp_samp_buff_i[i-1];
//	  }
//
//	  cp_samp_buff_r[0] = IN_R;
//	  cp_samp_buff_i[0] = IN_I;
//
//	  corr_sum_r = corr_sum_r + temp_r;
//	  corr_sum_i = corr_sum_i + temp_i;
//
//	  OUT_R = 0.125*corr_sum_r;
//	  OUT_I = 0.125*corr_sum_i;

//}

void sss_correlation(const DTYPE RX1_REAL[128], const DTYPE RX1_IMAG[128], const DTYPE RX2_REAL[128], const DTYPE RX2_IMAG[128], hls::stream<cdata_pkt> results_sss_1_PSS_1[168], hls::stream<cdata_pkt> results_sss_1_PSS_2[168], hls::stream<cdata_pkt> results_sss_2_PSS_1[168], hls::stream<cdata_pkt> results_sss_2_PSS_2[168])
{
	DTYPE temp_sss_1[62],temp_sss_2[62];
	DTYPE sec_sync_sig_1_try[128] = {0};
	DTYPE sec_sync_sig_2_try[128] = {0};
	cdata_pkt out_11[168], out_12[168], out_21[168], out_22[168];
	DTYPE acc_temp_11_i,acc_temp_11_r,acc_temp_21_i,acc_temp_21_r,acc_temp_12_i,acc_temp_12_r,acc_temp_22_i,acc_temp_22_r;

	//Input data
	//sss_recv_1 = fftshift(fft(downsampled));
	//sss_recv_2 = fftshift(fft(downsampled));
	//sss_recv_1_imag
	//sss_recv_1_real
	//sss_recv_2_imag
	//sss_recv_2_real


	for(int i = 0; i < 167; i++)
	{
		//parameter n_id_2_est=2;
		sss(i,2,0,temp_sss_1);
		sss(i,2,10,temp_sss_2);

		for (int n = 0; n < 128; n++)
		{
			sec_sync_sig_1_try[n] = 0;
			sec_sync_sig_2_try[n] = 0;
		}

		int m = 33;
		for (int j = 0; j < 31; j++)
		{
			sec_sync_sig_1_try[m] = temp_sss_1[j];
			sec_sync_sig_2_try[m] = temp_sss_2[j];
			m += 1;
		}
		m += 1;
		for (int j = 31; j < 62; j++)
		{
			sec_sync_sig_1_try[m] = temp_sss_1[j];
			sec_sync_sig_2_try[m] = temp_sss_2[j];
			m += 1;
		}

		acc_temp_11_i= 0;
		acc_temp_11_r= 0;
		acc_temp_21_i= 0;
		acc_temp_21_r= 0;
		acc_temp_12_i= 0;
		acc_temp_12_r= 0;
		acc_temp_22_i= 0;
		acc_temp_22_r= 0;

		for (int j = 0; j < 128; j++)
		{
			acc_temp_11_i += sec_sync_sig_1_try[j]*-1*RX1_IMAG[j];
			acc_temp_11_r += sec_sync_sig_1_try[j]*RX1_REAL[j];

			acc_temp_21_i += sec_sync_sig_2_try[j]*-1*RX1_IMAG[j];
			acc_temp_21_r += sec_sync_sig_2_try[j]*RX1_REAL[j];

			acc_temp_12_i += sec_sync_sig_1_try[j]*-1*RX2_IMAG[j];
			acc_temp_12_r += sec_sync_sig_1_try[j]*RX2_REAL[j];

			acc_temp_22_i += sec_sync_sig_2_try[j]*-1*RX2_IMAG[j];
			acc_temp_22_r += sec_sync_sig_2_try[j]*RX2_REAL[j];
		}


//		results_sss_1_PSS_1[i].i = acc_temp_11_i;
//		results_sss_1_PSS_1[i].r = acc_temp_11_r;
//
//		results_sss_2_PSS_1[i].i = acc_temp_21_i;
//		results_sss_2_PSS_1[i].r = acc_temp_21_r;
//
//		results_sss_1_PSS_2[i].i = acc_temp_12_i;
//		results_sss_1_PSS_2[i].r = acc_temp_12_r;
//
//		results_sss_2_PSS_2[i].i = acc_temp_22_i;
//		results_sss_2_PSS_2[i].r = acc_temp_22_r;


		out_11[i].data.i = acc_temp_11_i;
		out_11[i].data.r = acc_temp_11_r;

		out_21[i].data.i = acc_temp_21_i;
		out_21[i].data.r = acc_temp_21_r;

		out_12[i].data.i = acc_temp_12_i;
		out_12[i].data.r = acc_temp_12_r;

		out_22[i].data.i = acc_temp_22_i;
		out_22[i].data.r = acc_temp_22_r;

		results_sss_1_PSS_1[i].write(out_11[i]);
		results_sss_1_PSS_2[i].write(out_12[i]);
		results_sss_2_PSS_1[i].write(out_21[i]);
		results_sss_2_PSS_2[i].write(out_22[i]);

//		  sss_1_try=sss(t,n_id_2_est,0);
//		  sss_2_try=sss(t,n_id_2_est,10);
//
//		  sss_1_try = [zeros(1,33) sss_1_try(1:31) 0 sss_1_try(32:62) zeros(1,32)];
//		  sss_2_try = [zeros(1,33) sss_2_try(1:31) 0 sss_2_try(32:62) zeros(1,32)];
//
//		  temp_sss = sss_1_try*conj(sss_recv_1);
//		  results_sss_1_PSS_1 = [results_sss_1_PSS_1 temp_sss];
//
//		  temp_sss = sss_2_try*conj(sss_recv_1);
//		  results_sss_2_PSS_1 = [results_sss_2_PSS_1 temp_sss];
//
//		  temp_sss = sss_1_try*conj(sss_recv_2);
//		  results_sss_1_PSS_2 = [results_sss_1_PSS_2 temp_sss];
//
//		  temp_sss = sss_2_try*conj(sss_recv_2);
//		  results_sss_2_PSS_2 = [results_sss_2_PSS_2 temp_sss];

	}
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

//void cp_corr_dataflow(hls::stream<data_pkt> &IN_R,hls::stream<data_pkt> &IN_I,hls::stream<data_pkt> &OUT)
//{
//
//}

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


void pss_sync(hls::stream<data_pkt> &IN_R,hls::stream<data_pkt> &IN_I,hls::stream<PSS_RESULTS> &out)
//void cp_corr_pss_sss(hls::stream<data_pkt> &IN_R,hls::stream<data_pkt> &IN_I,hls::stream<PSS_RESULTS> &out)
{
#pragma HLS INTERFACE axis port=IN_R
#pragma HLS INTERFACE axis port=IN_I
#pragma HLS INTERFACE axis port=out
#pragma HLS INTERFACE s_axilite port=return bundle=control

  DTYPE IN_real[128],IN_imag[128],output;
  DTYPE acc_0_r,acc_1_r,acc_2_r,acc_0_i,acc_1_i,acc_2_i;
  PSS_RESULTS write_out;
  int run = 1, valid = 0, k = 0;

  while(run)
  {
	acc_0_r = 0;
	acc_1_r = 0;
	acc_2_r = 0;
	acc_0_i = 0;
	acc_1_i = 0;
	acc_2_i = 0;

#pragma HLS DATAFLOW
	for (int i = 0; i < 128; i++)
	{
		copy_input(IN_R,IN_real[i],IN_I,IN_imag[i],run);
	}
	//do pss calculation with stored sequences
	for (int j = 0; j < 128; j++)
	{
		acc_0_r += IN_real[j] * td_pss_0_real[j];
		acc_1_r += IN_real[j] * td_pss_1_real[j];
		acc_2_r += IN_real[j] * td_pss_2_real[j];

		acc_0_i += IN_imag[j] * td_pss_0_imag[j];
		acc_1_i += IN_imag[j] * td_pss_1_imag[j];
		acc_2_i += IN_imag[j] * td_pss_2_imag[j];
	}

	write_out.pss_rslts_0 = sqrt((acc_0_r*acc_0_r) + (acc_0_i*acc_0_i));
	//write_out.pss_rslts_0_i = acc_0_i;
	write_out.pss_rslts_1 = sqrt((acc_1_r*acc_1_r) + (acc_1_i*acc_1_i));
	//write_out.pss_rslts_1_i = acc_1_i;
	write_out.pss_rslts_2 = sqrt((acc_2_r*acc_2_r) + (acc_2_i*acc_2_i));
	//write_out.pss_rslts_2_i = acc_2_i;
	out.write(write_out);
  }
}


//void sss_sync(hls::stream<data_pkt> &IN_R,hls::stream<data_pkt> &IN_I,hls::stream<cdata_pkt> &sss_1_PSS_1,hls::stream<cdata_pkt> &sss_1_PSS_2,hls::stream<cdata_pkt> &sss_2_PSS_1,hls::stream<cdata_pkt> &sss_2_PSS_2)
void cp_corr_pss_sss(hls::stream<data_pkt> IN_R[128],hls::stream<data_pkt> IN_I[128],hls::stream<cdata_pkt> sss_1_PSS_1[168],hls::stream<cdata_pkt> sss_1_PSS_2[168],hls::stream<cdata_pkt> sss_2_PSS_1[168],hls::stream<cdata_pkt> sss_2_PSS_2[168])
{
#pragma HLS INTERFACE axis port=IN_R
#pragma HLS INTERFACE axis port=IN_I
#pragma HLS INTERFACE axis port=sss_1_PSS_1
#pragma HLS INTERFACE axis port=sss_1_PSS_2
#pragma HLS INTERFACE axis port=sss_2_PSS_1
#pragma HLS INTERFACE axis port=sss_2_PSS_2
#pragma HLS INTERFACE s_axilite port=return bundle=control

  DTYPE IN_real[128],IN_imag[128],output;
  DTYPE avg_r,avg_i, avg_slot_r,avg_slot_i, freq;
  int run = 1, valid = 0, k = 0;
  const int N = 128;
  printf("IN sss_sync\n");
  while(run)
  {
#pragma HLS DATAFLOW
	//enter into shift reg
	for (int i = 0; i < 128; i++)
	{
		copy_input(IN_R[i],IN_real[i],IN_I[i],IN_imag[i],run);
	}
  }
  printf("Got Frame\n");

	//do fft on 128 values, fftshift: IN_real, IN_imag,
	//Perform FFT
	//fft(In_R, In_I, Out_R, Out_I);
	//becomes complex received data: sss_recv_1, sss_recv_2

  //fftshift
  //const int iSHIFT = (N/2);
  //for(int i = 0; i < iSHIFT; i++)
  //{
  //  sss_recv_1_real[i+iSHIFT] = IN_real[i];
  //  sss_recv_1_imag[i+iSHIFT] = IN_imag[i];
  //}
  //for(int n = 0; n < iSHIFT; n++)
  //{
  //  sss_recv_1_real[n] = IN_real[n+iSHIFT];
  //  sss_recv_1_imag[n] = IN_imag[n+iSHIFT];
  //}

  sss_correlation(sss_recv_1_real, sss_recv_1_imag, sss_recv_2_real, sss_recv_2_imag, &sss_1_PSS_1[168], &sss_1_PSS_2[168], &sss_2_PSS_1[168], &sss_2_PSS_2[168]);

	// For simulation
	//k += 1;
	//if(78 == k)
	//{
	//	run = 0;
	//}
}

#if 0
void cp_corr_pss_sss()
{
	void pss_sync(hls::stream<data_pkt> &IN_R,hls::stream<data_pkt> &IN_I,hls::stream<PSS_RESULTS> &out)
	//void sss_sync(hls::stream<data_pkt> &IN_R,hls::stream<data_pkt> &IN_I,hls::stream<cdata_pkt> &sss_1_PSS_1,hls::stream<cdata_pkt> &sss_1_PSS_2,hls::stream<cdata_pkt> &sss_2_PSS_1,hls::stream<cdata_pkt> &sss_2_PSS_2)

}

for(i = N-1; i > 0; --i){

}
shift_reg[0] = x;
#endif
