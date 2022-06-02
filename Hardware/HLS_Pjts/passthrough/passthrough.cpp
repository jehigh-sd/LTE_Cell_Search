#include <hls_math.h>

#include "passthrough.h"

void passthrough_samples(hls::stream<samples_pkt> &IN_R,   hls::stream<samples_pkt> &IN_I,
                         hls::stream<samples_pkt> &OUT_R1, hls::stream<samples_pkt> &OUT_I1,
						 hls::stream<samples_pkt> &OUT_R2, hls::stream<samples_pkt> &OUT_I2,
						 bool &eos)
{
  samples_pkt t_r_in, t_i_in;
  samples_pkt t_r_out, t_i_out;

  /* Read Samples from Input */
  t_r_in = IN_R.read();
  t_i_in = IN_I.read();
  /* Read Samples End */

  /* Copy Samples */
  t_r_out = t_r_in;
  t_i_out = t_i_in;

  /* Write Samples to Output 1 */
  OUT_R1.write(t_r_out);
  OUT_I1.write(t_i_out);
  
  /* Write Samples to Output 2 */
  OUT_R2.write(t_r_out);
  OUT_I2.write(t_i_out);
  /* Write Samples End */

#ifdef SIMULATION
  if (t_r_in.last || t_i_in.last)
  {
     eos = true;
  }
#endif
}

void adcPassThrough(hls::stream<samples_pkt> &IN_R,   hls::stream<samples_pkt> &IN_I,
		            hls::stream<samples_pkt> &OUT_R1, hls::stream<samples_pkt> &OUT_I1,
				    hls::stream<samples_pkt> &OUT_R2, hls::stream<samples_pkt> &OUT_I2)
{
#pragma HLS INTERFACE axis depth=1024 port=OUT_R1
#pragma HLS INTERFACE axis depth=1024 port=OUT_I1
#pragma HLS INTERFACE axis depth=1024 port=OUT_R2
#pragma HLS INTERFACE axis depth=1024 port=OUT_I2
#pragma HLS INTERFACE axis depth=1024 port=IN_R
#pragma HLS INTERFACE axis depth=1024 port=IN_I
#pragma HLS INTERFACE ap_ctrl_none port=return

  bool eos = false;
  adcPassThrough: do
  {
#pragma HLS PIPELINE II=1
	  passthrough_samples(IN_R, IN_I, OUT_R1, OUT_I1, OUT_R2, OUT_I2, eos);
  } while(eos == false);
}
