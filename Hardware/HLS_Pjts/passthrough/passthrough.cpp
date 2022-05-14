#include <hls_math.h>

#include "passthrough.h"

void passthrough_samples(hls::stream<sample_pkt> &IN_R, hls::stream<sample_pkt> &IN_I,
                         hls::stream<sample_pkt> &OUT_R1, hls::stream<sample_pkt> &OUT_I1,
						 hls::stream<sample_pkt> &OUT_R2, hls::stream<sample_pkt> &OUT_I2,
						 bool &run)
{
  sample_pkt t_r_in, t_i_in;
  sample_pkt t_r_out, t_i_out;

  /* Read Samples Begin */
  t_r_in = IN_R.read();
  t_i_in = IN_I.read();
  /* Read Samples End */

  t_r_out = t_r_in;
  t_i_out = t_i_in;

  /* Write Samples Begin */
  OUT_R1.write(t_r_out);
  OUT_I1.write(t_i_out);
  OUT_R2.write(t_r_out);
  OUT_I2.write(t_i_out);
  /* Write Samples End */

#ifdef SIMULATION
  if (t_r_in.last || t_i_in.last)
  {
     run = false;
  }
#endif
}

void adcPassthrough(hls::stream<sample_pkt> &IN_R,  hls::stream<sample_pkt> &IN_I,
		            hls::stream<sample_pkt> &OUT_R1, hls::stream<sample_pkt> &OUT_I1,
				    hls::stream<sample_pkt> &OUT_R2, hls::stream<sample_pkt> &OUT_I2)
{
#pragma HLS INTERFACE axis depth=1024 port=OUT_R1
#pragma HLS INTERFACE axis depth=1024 port=OUT_I1
#pragma HLS INTERFACE axis depth=1024 port=OUT_R2
#pragma HLS INTERFACE axis depth=1024 port=OUT_I2
#pragma HLS INTERFACE axis depth=1024 port=IN_R
#pragma HLS INTERFACE axis depth=1024 port=IN_I
#pragma HLS INTERFACE ap_ctrl_none port=return

  bool run = true;
  do
  {
#pragma HLS PIPELINE II=1
	  passthrough_samples(IN_R, IN_I, OUT_R1, OUT_I1, OUT_R2, OUT_I2, run);
  } while(run);
}
