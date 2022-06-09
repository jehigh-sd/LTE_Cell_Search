#include <hls_math.h>

#include "txinterleaver.h"

void interleave_samples(hls::stream<samplesXL_pkt> &IN_AC, hls::stream<samplesXL_pkt> &IN_GEN,
		                hls::stream<samplesXL_pkt> &OUT_DAC,
		                bool &eos)
{
#pragma HLS PIPELINE II=1
  samplesXL_pkt t_ac_in, t_gen_in, t_dac_out;

  /* Read Samples from Input */
  t_ac_in  = IN_AC.read();
  t_gen_in = IN_GEN.read();
  /* Read Samples End */

  /* Copy Samples */
  t_dac_out = t_ac_in;
  t_dac_out.data = t_gen_in.data;

  /* Write Samples to Output */
  OUT_DAC.write(t_dac_out);
  /* Write Samples End */

#ifdef SIMULATION
  if (t_ac_in.last || t_gen_in.last)
  {
     eos = true;
  }
#endif
}

void txInterleaver(hls::stream<samplesXL_pkt> &IN_AC, hls::stream<samplesXL_pkt> &IN_GEN,
                   hls::stream<samplesXL_pkt> &OUT_DAC)
{
#pragma HLS INTERFACE axis depth=1024 port=IN_AC
#pragma HLS INTERFACE axis depth=1024 port=IN_GEN
#pragma HLS INTERFACE axis depth=1024 port=OUT_DAC
#pragma HLS INTERFACE ap_ctrl_none port=return


  bool eos = false;
  txInterleaver: do
  {
#pragma HLS PIPELINE II=1
	  interleave_samples(IN_AC, IN_GEN, OUT_DAC, eos);
  } while(eos == false);
}
