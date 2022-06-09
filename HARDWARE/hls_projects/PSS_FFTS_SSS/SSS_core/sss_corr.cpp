#include "math.h"
#include "sss_corr.h"

void copy_input(hls::stream<data_pkt> &IN_R, DTYPE IN_R_temp[SIZE_FFT], hls::stream<data_pkt> &IN_I,DTYPE IN_I_temp[SIZE_FFT],hls::stream<pss_pkt> &pss_id, int &pss )
{
  data_pkt t_r,t_i;
  pss_pkt temp;

  temp = pss_id.read();
  pss = temp.data;
  printf("%d\n", pss);

  for(int i = 0; i < SIZE_FFT; i++)
  {
    t_r = IN_R.read();
    t_i = IN_I.read();

    IN_R_temp[i] = t_r.data;
    IN_I_temp[i] = t_i.data;
  }
}

void compute_threshold(DTYPE IN_R[SIZE_FFT], DTYPE IN_I[SIZE_FFT], DTYPE &OUT)
{

  DTYPE IN_R_pre, IN_I_pre, IN_abs_pre, IN_mag_temp;

  /*Pre scale the input*/
  //IN_R_pre = SSS_THRESH*IN_R;
  //IN_I_pre = SSS_THRESH*IN_I;

  OUT = 0;
  for(int i = 0; i < SIZE_FFT; i++)
  {
    OUT = OUT + IN_R[i]*IN_R[i] + IN_I[i]*IN_I[i];
  }


  /*Apply lower limit*/
  if(OUT < LOW_THRESH)
  {
    OUT = LOW_THRESH;
  }
}

void compute_sss_1_0(DTYPE IN_R[SIZE_FFT], DTYPE IN_I[SIZE_FFT], DTYPE OUT[NUM_SSS] )
{
  DTYPE temp_r = 0, temp_i = 0;
  for(int i = 0; i < NUM_SSS; i++)
  {
    for(int j = 0; j < SIZE_FFT; j++)
    {
      temp_r += ss_1_0[i][j]*IN_R[j];
      temp_i -= ss_1_0[i][j]*IN_I[j];
    }
    OUT[i] = sqrt(temp_r*temp_r + temp_i*temp_i);
    temp_r = 0;
    temp_i = 0;
  }
}

void compute_sss_2_0(DTYPE IN_R[SIZE_FFT], DTYPE IN_I[SIZE_FFT], DTYPE OUT[NUM_SSS] )
{
  DTYPE temp_r = 0, temp_i = 0;
  for(int i = 0; i < NUM_SSS; i++)
  {
    for(int j = 0; j < SIZE_FFT; j++)
    {
      temp_r += ss_2_0[i][j]*IN_R[j];
      temp_i -= ss_2_0[i][j]*IN_I[j];
    }
    OUT[i] = sqrt(temp_r*temp_r + temp_i*temp_i);
    temp_r = 0;
    temp_i = 0;
  }
}

void compute_sss_1_1(DTYPE IN_R[SIZE_FFT], DTYPE IN_I[SIZE_FFT], DTYPE OUT[NUM_SSS] )
{
  DTYPE temp_r = 0, temp_i = 0;
  for(int i = 0; i < NUM_SSS; i++)
  {
    for(int j = 0; j < SIZE_FFT; j++)
    {
      temp_r += ss_1_1[i][j]*IN_R[j];
      temp_i -= ss_1_1[i][j]*IN_I[j];
    }
    OUT[i] = sqrt(temp_r*temp_r + temp_i*temp_i);
    temp_r = 0;
    temp_i = 0;
  }
}

void compute_sss_2_1(DTYPE IN_R[SIZE_FFT], DTYPE IN_I[SIZE_FFT], DTYPE OUT[NUM_SSS] )
{
  DTYPE temp_r = 0, temp_i = 0;
  for(int i = 0; i < NUM_SSS; i++)
  {
    for(int j = 0; j < SIZE_FFT; j++)
    {
      temp_r += ss_2_1[i][j]*IN_R[j];
      temp_i -= ss_2_1[i][j]*IN_I[j];
    }
    OUT[i] = sqrt(temp_r*temp_r + temp_i*temp_i);
    temp_r = 0;
    temp_i = 0;
  }
}

void compute_sss_1_2(DTYPE IN_R[SIZE_FFT], DTYPE IN_I[SIZE_FFT], DTYPE OUT[NUM_SSS] )
{
  DTYPE temp_r = 0, temp_i = 0;
  for(int i = 0; i < NUM_SSS; i++)
  {
    for(int j = 0; j < SIZE_FFT; j++)
    {
      temp_r += ss_1_2[i][j]*IN_R[j];
      temp_i -= ss_1_2[i][j]*IN_I[j];
    }
    OUT[i] = sqrt(temp_r*temp_r + temp_i*temp_i);
    temp_r = 0;
    temp_i = 0;
  }
}

void compute_sss_2_2(DTYPE IN_R[SIZE_FFT], DTYPE IN_I[SIZE_FFT], DTYPE OUT[NUM_SSS] )
{
  DTYPE temp_r = 0, temp_i = 0;
  for(int i = 0; i < NUM_SSS; i++)
  {
    for(int j = 0; j < SIZE_FFT; j++)
    {
      temp_r += ss_2_2[i][j]*IN_R[j];
      temp_i -= ss_2_2[i][j]*IN_I[j];
    }
    OUT[i] = sqrt(temp_r*temp_r + temp_i*temp_i);
    temp_r = 0;
    temp_i = 0;
  }
}

void get_sss_id(DTYPE IN_R[SIZE_FFT],DTYPE IN_I[SIZE_FFT],int pss_id,DTYPE OUT_1[NUM_SSS],DTYPE OUT_2[NUM_SSS])
{

	if(pss_id == 0)
	{
	  compute_sss_1_0(IN_R,IN_I,OUT_1);
	  compute_sss_2_0(IN_R,IN_I,OUT_2);
	}
	else if(pss_id == 1)
	{
	  compute_sss_1_1(IN_R,IN_I,OUT_1);
	  compute_sss_2_1(IN_R,IN_I,OUT_2);
	}
	else if(pss_id == 2)
	{
	  compute_sss_1_2(IN_R,IN_I,OUT_1);
      compute_sss_2_2(IN_R,IN_I,OUT_2);
	}
}
void write_output(DTYPE OUT_1[NUM_SSS], DTYPE OUT_2[NUM_SSS],float *OUT1,float *OUT2)//,int &pss_id, int &peak_index, int pss_id_temp, int peak_id_temp)
{

  for(int i = 0; i < NUM_SSS; i++)
  {
    OUT1[i] = OUT_1[i];
    OUT2[i] = OUT_2[i];
  }
}

void sss_corr(hls::stream<data_pkt> &IN_R,hls::stream<data_pkt> &IN_I,float *OUT1,float *OUT2, hls::stream<pss_pkt> &pss_id)
{
#pragma HLS INTERFACE axis port=IN_R
#pragma HLS INTERFACE axis port=IN_I
//#pragma HLS INTERFACE axis port=OUT1
//#pragma HLS INTERFACE axis port=OUT2
#pragma HLS INTERFACE axis port=pss_id
#pragma HLS INTERFACE m_axi depth=168 port=OUT1 offset=slave
#pragma HLS INTERFACE m_axi depth=168 port=OUT2 offset=slave
#pragma HLS INTERFACE s_axilite port=return bundle=control

  DTYPE IN_real[SIZE_FFT],IN_imag[SIZE_FFT],thresh = LOW_THRESH;
  DTYPE sss_1_rslts[NUM_SSS],sss_2_rslts[NUM_SSS];
  DTYPE OUT_1[NUM_SSS] = {0}, OUT_2[NUM_SSS] = {0};
  int pss = 3;
//#pragma HLS DATAFLOW

    copy_input(IN_R,IN_real,IN_I,IN_imag, pss_id, pss);
   // compute_threshold(IN_real,IN_imag,thresh);
    get_sss_id(IN_real,IN_imag,pss,OUT_1,OUT_2);
    write_output(OUT_1,OUT_2,OUT1,OUT2);
}


