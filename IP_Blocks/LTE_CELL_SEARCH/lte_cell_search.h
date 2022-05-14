#ifndef LTE_CELL_SEARCH_H_
#define LTE_CELL_SEARCH_H_

#include "data_types.h"

#define NUM_SLOTS          10
#define SIZE_IN            1088 * NUM_SLOTS
#define SIZE_OUT           1088
#define SIZE_FFT           128
#define CP_L               8
#define SL_NUM             822
#define NUM_SAMP_IN_SLOT   960
#define NUM_SLOT           20

#define SCALE_FACTOR       2048.0
#define SAMPLES_PER_CYCLE  8
#define NUM_INPUT_SAMPLES  96000 * SAMPLES_PER_CYCLE
#define NUM_OUTPUT_SAMPLES 100

#define SAMPLE_SELECT      0
#define FILTER_SAMPLES     0

#ifdef SIMULATION
void lteCellSearch(hls::stream<sample_pkt> &IN_R,  hls::stream<sample_pkt> &IN_I,
				   hls::stream<freq_pkt> &OUT_F);
#else
void lteCellSearch(hls::stream<sample_pkt> &IN_R,  hls::stream<sample_pkt> &IN_I,
				   int *OUT_F);
#endif /* SIMULATION */
#endif /* LTE_CELL_SEARCH_H_ */
