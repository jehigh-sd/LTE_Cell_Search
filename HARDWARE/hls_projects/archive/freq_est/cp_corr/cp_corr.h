#ifndef CP_CORR_H_
#define CP_CORR_H_
#include <hls_stream.h>
#include "ap_fixed.h"
#include "ap_axi_sdata.h"

#define FEATURE_STREAM

#define NUM_SLOTS 10
#define SIZE_IN  1088*NUM_SLOTS
#define SIZE_OUT 1088
#define SIZE_FFT 128
#define CP_L 8
#define SL_NUM 822
#define NUM_SAMP_IN_SLOT 960
#define NUM_SLOT 20

/*Input data types*/
typedef ap_uint<6> uint_6;

typedef float DTYPE;

typedef hls::axis<DTYPE,0,0,0> data_pkt;


void cp_corr(hls::stream<data_pkt> &IN_R,hls::stream<data_pkt> &IN_I,hls::stream<data_pkt> &OUT);

#endif
