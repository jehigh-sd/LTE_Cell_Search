#ifndef LTE_CELL_SEARCH_H_
#define LTE_CELL_SEARCH_H_

#include "data_types.h"


#define ADC_SCALE_FACTOR   32768.0
#define SAMPLES_PER_CYCLE  8
#define NUM_INPUT_SAMPLES  96000 * SAMPLES_PER_CYCLE

void adcPassThrough(hls::stream<samples_pkt> &IN_R,   hls::stream<samples_pkt> &IN_I,
		            hls::stream<samples_pkt> &OUT_R1, hls::stream<samples_pkt> &OUT_I1,
				    hls::stream<samples_pkt> &OUT_R2, hls::stream<samples_pkt> &OUT_I2);
#endif
