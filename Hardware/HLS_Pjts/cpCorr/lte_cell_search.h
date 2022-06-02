#ifndef LTE_CELL_SEARCH_H_
#define LTE_CELL_SEARCH_H_

#include "data_types.h"

#define NUM_SLOTS           10
#define SIZE_IN             1088 * NUM_SLOTS
#define SIZE_OUT            1088
#define SIZE_FFT            128
#define CP_L                8
#define SL_NUM              822
#define NUM_SAMP_IN_SLOT    960
#define NUM_SLOT            20

// ADC input is 12-bit signed zero padded to 16-bits making it 16-bit signed.
#define ADC_SCALE_M_FACTOR  32768.0           // 2^15
#define ADC_SCALE_D_FACTOR  0.000122070312500 // 2^-15 * 2^2 (with 2-Bit Gain)
// Convert Frequency Output to Signed Int32 with 3 precision points.
#define FREQ_SCALE_M_FACTOR 1000.0
#define FREQ_SCALE_D_FACTOR 0.001
#define ATAN_MAX_P_FACTOR  +1.570796326794896
#define ATAN_MAX_N_FACTOR  -1.570796326794896

#define NUM_OUTPUT_SAMPLES  100
#define NUM_INPUT_SAMPLES   960 * NUM_OUTPUT_SAMPLES
#define NUM_DEBUG_DATA_PTS  1024

void lteCellSearch(hls::stream<sample_pkt> &IN_R, hls::stream<sample_pkt> &IN_I,
                   int *OUT_EST, int *OUT_DBG);

#endif /* LTE_CELL_SEARCH_H_ */
