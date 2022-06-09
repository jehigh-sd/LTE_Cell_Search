#include "math.h"
#include "fft_shift.h"

void copy_input(hls::stream<data_pkt_c> &IN,DTYPE IN_R[SIZE_FFT],DTYPE IN_I[SIZE_FFT])
{
  data_pkt_c t;
  for(int i = 0; i < SIZE_FFT; i++)
  {
	t = IN.read();
    IN_R[i] = t.data.real();
    IN_I[i] = t.data.imag();
  }
}
void fft_sh(DTYPE OUT_temp_R[SIZE_FFT], DTYPE OUT_temp_I[SIZE_FFT], DTYPE OUT_R_s[SIZE_FFT], DTYPE OUT_I_s[SIZE_FFT])
{
  for(int i = 0; i < SIZE_FFT_2; i++)
  {
    OUT_R_s[i] = OUT_temp_R[i + SIZE_FFT_2];
    OUT_I_s[i] = OUT_temp_I[i + SIZE_FFT_2];
  }

  for(int i = 0; i < SIZE_FFT_2; i++)
  {
    OUT_R_s[i + SIZE_FFT_2] = OUT_temp_R[i];
    OUT_I_s[i + SIZE_FFT_2] = OUT_temp_I[i];
  }
}

void copy_output(DTYPE OUT_temp_R[SIZE_FFT], DTYPE OUT_temp_I[SIZE_FFT],hls::stream<data_pkt> &OUT_R,hls::stream<data_pkt> &OUT_I)
{
	data_pkt t_r,t_i;
	t_r.keep = -1;
	t_r.strb = 1;
	t_r.last = 0;

	t_i.keep = -1;
	t_i.strb = 1;
	t_i.last = 0;
  for(int i = 0; i < SIZE_FFT-1; i++)
  {
    t_r.data = OUT_temp_R[i];
    t_i.data = OUT_temp_I[i];
    OUT_R.write(t_r);
    OUT_I.write(t_i);
  }

  t_r.last = 1;
  t_i.last = 1;
  t_r.data = OUT_temp_R[SIZE_FFT-1];
  t_i.data = OUT_temp_I[SIZE_FFT-1];
  OUT_R.write(t_r);
  OUT_I.write(t_i);
}

void fft_shift(hls::stream<data_pkt_c> &IN_R, hls::stream<data_pkt> &OUT_R,hls::stream<data_pkt> &OUT_I)
{
#pragma HLS INTERFACE axis port=IN_R
#pragma HLS INTERFACE axis port=OUT_R
#pragma HLS INTERFACE axis port=OUT_I
#pragma HLS INTERFACE s_axilite port=return bundle=control

  cmpxDataIn in_fft_core[SIZE_FFT];
  DTYPE in_temp_r[SIZE_FFT];
  DTYPE in_temp_i[SIZE_FFT];
  DTYPE out_temp_r[SIZE_FFT];
  DTYPE out_temp_i[SIZE_FFT];

  copy_input(IN_R,in_temp_r,in_temp_i);
  fft_sh(in_temp_r,in_temp_i,out_temp_r,out_temp_i);
  copy_output(out_temp_r,out_temp_i,OUT_R,OUT_I);

}


