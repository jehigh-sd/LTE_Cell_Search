#ifndef TX_INTERLEAVER_H_
#define TX_INTERLEAVER_H_

#include "data_types.h"


#define ADC_SCALE_FACTOR   32768.0
#define SAMPLES_PER_CYCLE  8
#define NUM_INPUT_SAMPLES  96000 * SAMPLES_PER_CYCLE

void txInterleaver(hls::stream<samplesXL_pkt> &IN_AC, hls::stream<samplesXL_pkt> &IN_GEN,
                   hls::stream<samplesXL_pkt> &OUT_DAC);
#endif
