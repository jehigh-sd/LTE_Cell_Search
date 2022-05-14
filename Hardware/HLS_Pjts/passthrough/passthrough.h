#ifndef LTE_CELL_SEARCH_H_
#define LTE_CELL_SEARCH_H_

#include "data_types.h"


#define SCALE_FACTOR       2048.0
#define SAMPLES_PER_CYCLE  8
#define NUM_INPUT_SAMPLES  96000 * SAMPLES_PER_CYCLE

void adcPassthrough(hls::stream<sample_pkt> &IN_R,  hls::stream<sample_pkt> &IN_I,
		            hls::stream<sample_pkt> &OUT_R1, hls::stream<sample_pkt> &OUT_I1,
				    hls::stream<sample_pkt> &OUT_R2, hls::stream<sample_pkt> &OUT_I2);
#endif
