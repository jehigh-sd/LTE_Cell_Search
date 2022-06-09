#include <hls_math.h>
#include "lte_cell_search.h"

void copy_input(hls::stream<sample_pkt> &IN_R, hls::stream<sample_pkt> &IN_I,
                data_t IN_R_temp[], data_t IN_I_temp[])
{
  sample_pkt t_r_in, t_i_in;
  adc_data_t *temp_r_in, *temp_i_in;

  copy_input:
  for(ap_uint<32> i = 0; i < NUM_INPUT_SAMPLES; i++)
  {
#pragma HLS PIPELINE II=1
    /* Read Samples from Input */
    t_r_in = IN_R.read();
    t_i_in = IN_I.read();

    /* Get Input samples handle */
    temp_r_in = (adc_data_t*)&t_r_in.data;
    temp_i_in = (adc_data_t*)&t_i_in.data;

    /* Copy Input Samples */
    IN_R_temp[i] = math_t(*temp_r_in) * math_t(ADC_SCALE_D_FACTOR);
    IN_I_temp[i] = math_t(*temp_i_in) * math_t(ADC_SCALE_D_FACTOR);
  }
}

void compute_threshold(data_t IN_R, data_t IN_I,
		               data_t &OUT,
                       bool run)
{
  static data_t sum_mag = 0;
  static data_t mag_buff[SIZE_FFT] = {0};
#pragma HLS ARRAY_PARTITION variable=mag_buff block factor=2

  data_t IN_R_pre, IN_I_pre, IN_abs_pre, IN_mag_temp;

  if(false == run)
  {
    sum_mag = 0;
    for(ap_uint<16> i = 0; i < SIZE_FFT; i++)
    {
#pragma HLS PIPELINE II=1
      mag_buff[i] = 0;
    }
  }

  /*Pre scale the input*/
  IN_R_pre = data_t(PSS_THRESH) * data_t(IN_R);
  IN_I_pre = data_t(PSS_THRESH) * data_t(IN_I);

  IN_abs_pre = IN_R_pre * IN_R_pre + IN_I_pre * IN_I_pre;
  IN_mag_temp = IN_abs_pre - mag_buff[SIZE_FFT - 1];

  for(ap_uint<16> i = SIZE_FFT-1; i > 0; i--)
  {
#pragma HLS PIPELINE II=1
    mag_buff[i] = mag_buff[i-1];
  }
  mag_buff[0] = IN_abs_pre;

  sum_mag = sum_mag + IN_mag_temp;

  /* Apply lower limit */
  if(sum_mag < data_t(LOW_THRESH))
  {
    OUT = data_t(sum_mag);
  }
  else
  {
    OUT = data_t(LOW_THRESH);
  }
}

void compute_pss(data_t IN_R, data_t IN_I,
		         data_t &pss_rslt_0, data_t &pss_rslt_1, data_t &pss_rslt_2,
				 bool run)
{
  static coef_t IN_R_buff[SIZE_FFT] = {0}, IN_I_buff[SIZE_FFT] = {0};
#pragma HLS ARRAY_PARTITION variable=IN_R_buff block factor=2
#pragma HLS ARRAY_PARTITION variable=IN_I_buff block factor=2

  acc_t acc_r_0 = 0, acc_i_0 = 0;
  acc_t acc_r_1 = 0, acc_i_1 = 0;
  acc_t acc_r_2 = 0, acc_i_2 = 0;

  if(false == run)
  {
	for(ap_uint<16> i = 0; i < SIZE_FFT; i++)
	{
#pragma HLS PIPELINE II=1
	  IN_R_buff[i] = 0;
	  IN_I_buff[i] = 0;
	}
  }

  for(ap_uint<16> i = 0; i < SIZE_FFT - 1; i++)
  {
#pragma HLS PIPELINE II=1
    IN_R_buff[i] = IN_R_buff[i+1];
	IN_I_buff[i] = IN_I_buff[i+1];
  }

  IN_R_buff[SIZE_FFT - 1] = IN_R * data_t(1000.0);
  IN_I_buff[SIZE_FFT - 1] = IN_I * data_t(1000.0);

  for(ap_uint<16> i = 0; i < SIZE_FFT; i++)
  {
#pragma HLS PIPELINE II=1
	coef_t ac_0, bd_0, temp_0;
	coef_t ac_1, bd_1, temp_1;
	coef_t ac_2, bd_2, temp_2;

    ac_0 = IN_R_buff[i] * td_pss_real[0][i];
    bd_0 = IN_I_buff[i] * td_pss_imag[0][i];
    acc_r_0 += (ac_0 + bd_0);

    temp_0 = (IN_R_buff[i] + IN_I_buff[i]) * (td_pss_real[0][i] - td_pss_imag[0][i]);
    acc_i_0 += (temp_0 - ac_0 + bd_0);

    ac_1 = IN_R_buff[i] * td_pss_real[1][i];
    bd_1 = IN_I_buff[i] * td_pss_imag[1][i];
    acc_r_1 += (ac_1 + bd_1);

    temp_1 = (IN_R_buff[i] + IN_I_buff[i]) * (td_pss_real[1][i] - td_pss_imag[1][i]);
    acc_i_1 += (temp_1 - ac_1 + bd_1);

    ac_2 = IN_R_buff[i] * td_pss_real[2][i];
    bd_2 = IN_I_buff[i] * td_pss_imag[2][i];
    acc_r_2 += (ac_2 + bd_2);

    temp_2 = (IN_R_buff[i] + IN_I_buff[i]) * (td_pss_real[2][i] - td_pss_imag[2][i]);
    acc_i_2 += (temp_2 - ac_2 + bd_2);
  }

  pss_rslt_0 = hls::sqrt(math_t(acc_r_0 * acc_r_0 + acc_i_0 * acc_i_0)) * math_t(0.001);
  pss_rslt_1 = hls::sqrt(math_t(acc_r_1 * acc_r_1 + acc_i_1 * acc_i_1)) * math_t(0.001);
  pss_rslt_2 = hls::sqrt(math_t(acc_r_2 * acc_r_2 + acc_i_2 * acc_i_2)) * math_t(0.001);
}

void track_pss_peak(data_t pss_rslt_0, data_t pss_rslt_1, data_t pss_rslt_2, data_t thresh,
                    int &pss_id, int &index, ap_uint<32> sample, int pss_rslt_temp[][NUM_INPUT_SAMPLES],
					bool run)
{
  static data_t curr_max = 0;
  bool is_valid_0 = false, is_valid_1 = false, is_valid_2 = false;

  if(false == run)
  {
	  curr_max = 0;
  }

  if(pss_rslt_0 > thresh)
  {
    is_valid_0 = true;
  }

  if(pss_rslt_1 > thresh)
  {
    is_valid_1 = true;
  }

  if(pss_rslt_2 > thresh)
  {
    is_valid_2 = true;
  }


  if((is_valid_0)&&(pss_rslt_0 > curr_max))
  {
    curr_max = pss_rslt_0;
    pss_id = 0;
    index = sample;
  }

  if((is_valid_1)&&(pss_rslt_1 > curr_max))
  {
    curr_max = pss_rslt_1;
    pss_id = 1;
    index = sample;
  }

  if((is_valid_2)&&(pss_rslt_2 > curr_max))
  {
    curr_max = pss_rslt_2;
    pss_id = 2;
    index = sample;
  }

  pss_rslt_temp[0][sample] = math_t(pss_rslt_0) * math_t(PSS_SCALE_D_FACTOR) * math_t(INT32_SCALE_FACTOR);
  pss_rslt_temp[1][sample] = math_t(pss_rslt_1) * math_t(PSS_SCALE_D_FACTOR) * math_t(INT32_SCALE_FACTOR);
  pss_rslt_temp[2][sample] = math_t(pss_rslt_2) * math_t(PSS_SCALE_D_FACTOR) * math_t(INT32_SCALE_FACTOR);
}

void copy_output(int pss_rslt_temp[][NUM_INPUT_SAMPLES],
		         int pss_id_temp, int peak_id_temp,
                 int *pss_id, int *peak_index, int *OUT_RSLT)
{
  copy_output:
  for(ap_uint<32> i = 0; i < NUM_INPUT_SAMPLES; i++)
  {
#pragma HLS PIPELINE II=1
	OUT_RSLT[i] = pss_rslt_temp[pss_id_temp][i];
  }

  *pss_id = pss_id_temp;
  *peak_index = peak_id_temp;
}

void write_buffer_fft(data_t IN_real[NUM_INPUT_SAMPLES],data_t IN_imag[NUM_INPUT_SAMPLES],hls::stream<data_pkt_c> &OUT_FFT, int index, int pss_id,hls::stream<pss_pkt> &PSS)
{
	data_pkt_c temp;
	temp.last = 0;
	temp.keep = -1;
	temp.strb = 1;
  for(int i = index-264; i < index-137; i++)
  {
    temp.data.real((float)IN_real[i]);
    temp.data.imag((float)IN_imag[i]);
    OUT_FFT.write(temp);
  }

  temp.last = 1;

  temp.data.real(IN_real[index-137]);
  temp.data.imag(IN_real[index-137]);
  OUT_FFT.write(temp);

  pss_pkt t;
  t.last = 1;
  t.keep = -1;
  t.strb = 1;
  t.data = pss_id;
  PSS.write(t);
}
void lteCellSearch(hls::stream<sample_pkt> &IN_R, hls::stream<sample_pkt> &IN_I, hls::stream<data_pkt_c> &OUT_FFT,hls::stream<pss_pkt> &pss_id,
                   int *OUT_PSS_ID, int *OUT_PEAK_INDEX, int *OUT_RSLT)
{
#pragma HLS INTERFACE axis depth=1024 port=IN_R
#pragma HLS INTERFACE axis depth=1024 port=IN_I
#pragma HLS INTERFACE axis depth=1024 port=OUT_FFT
#pragma HLS INTERFACE axis depth=1024 port=pss_id
#pragma HLS INTERFACE m_axi depth=96000 port=OUT_RSLT offset=slave

#pragma HLS INTERFACE s_axilite port=return
#pragma HLS INTERFACE s_axilite port=OUT_PSS_ID
#pragma HLS INTERFACE s_axilite port=OUT_PEAK_INDEX

  int pss_id_temp = 0, peak_id_temp = 0;
  int pss_rslt_temp[3][NUM_INPUT_SAMPLES] = {0};
  data_t IN_real[NUM_INPUT_SAMPLES] = {}, IN_imag[NUM_INPUT_SAMPLES] = {};

  copy_input(IN_R, IN_I, IN_real, IN_imag);

  lteCellSearch:
  for(ap_uint<32> sample = 0; sample < NUM_INPUT_SAMPLES; sample++)
  {
#pragma HLS DATAFLOW
    data_t thresh, pss_rslt_0, pss_rslt_1, pss_rslt_2;
    bool run = bool(sample);

    compute_threshold(IN_real[sample], IN_imag[sample], thresh, run);
    compute_pss(IN_real[sample], IN_imag[sample], pss_rslt_0, pss_rslt_1, pss_rslt_2, run);
    track_pss_peak(pss_rslt_0, pss_rslt_1, pss_rslt_2, thresh, pss_id_temp, peak_id_temp, sample, pss_rslt_temp, run);
  }

  write_buffer_fft(IN_real,IN_imag,OUT_FFT,peak_id_temp,pss_id_temp,pss_id);
  copy_output(pss_rslt_temp, pss_id_temp, peak_id_temp, OUT_PSS_ID, OUT_PEAK_INDEX, OUT_RSLT);
}
