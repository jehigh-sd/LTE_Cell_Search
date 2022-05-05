#ifndef LTE_CELL_SEARCH_H_
#define LTE_CELL_SEARCH_H_

#include <ap_fixed.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

#define NUM_SLOTS          10
#define SIZE_IN            1088 * NUM_SLOTS
#define SIZE_OUT           1088
#define SIZE_FFT           128
#define CP_L               8
#define SL_NUM             822
#define NUM_SAMP_IN_SLOT   960
#define NUM_SLOT           20
#define SAMPLES_PER_CYCLE  8
#define SCALE_FACTOR       260000.0

#define NUM_INPUT_SAMPLES  96000 /* Make sure is a multiple of SAMPLES_PER_CYCLE */
#define NUM_OUTPUT_SAMPLES 100

/*Input data types*/
typedef ap_uint<6> uint_6;

typedef ap_fixed<48,4> DTYPE;
typedef ap_ufixed<32,32> RTYPE;
typedef ap_ufixed<128,128> ITYPE;

typedef hls::axis<RTYPE,0,0,0> freq_pkt;
typedef hls::axis<ITYPE,0,0,0> sample_pkt;

void lteCellSearch(hls::stream<sample_pkt> &ADC0_IN_REAL, hls::stream<sample_pkt> &ADC0_IN_IMAG,
                   hls::stream<freq_pkt> &OUT);
#endif
