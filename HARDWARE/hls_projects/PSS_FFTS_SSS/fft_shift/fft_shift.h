#ifndef CP_CORR_H_
#define CP_CORR_H_
#include <hls_stream.h>
#include "ap_fixed.h"
#include "ap_axi_sdata.h"
#include <complex>
#include "hls_fft.h"

//#define FEATURE_STREAM

#define NUM_SLOTS 10
#define SIZE_IN  1088*NUM_SLOTS
#define SIZE_OUT 1088
#define SIZE_FFT 128
#define SIZE_FFT_2 64
#define CP_L 8
#define SL_NUM 822
#define NUM_SAMP_IN_SLOT 960
#define NUM_SLOT 20

#define PSS_THRESH 0.4786
#define LOW_THRESH 0.01

#define NUM_SSS 168

/*Input data types*/
typedef ap_fixed<16,15> uint_fix;

typedef float DTYPE;

typedef hls::axis<DTYPE,0,0,0> data_pkt;


typedef hls::axis<DTYPE,0,0,0> out_data_pkt;


typedef std::complex<DTYPE> cmpxDataIn;
typedef std::complex<DTYPE> cmpxDataOut;
typedef hls::axis<cmpxDataOut,0,0,0> data_pkt_c;

void fft_shift(hls::stream<data_pkt_c> &IN_R, hls::stream<data_pkt> &OUT_R,hls::stream<data_pkt> &OUT_I);

#endif
