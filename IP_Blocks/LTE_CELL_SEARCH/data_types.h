#ifndef DATA_TYPES_H_
#define DATA_TYPES_H_

#include <ap_fixed.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

typedef ap_fixed<20,4> acc_t;
typedef ap_fixed<16,0> coef_t;
typedef ap_fixed<24,4> data_t;
typedef ap_int<16> adc_data_t;

typedef ap_int<32> freq_t;
typedef ap_ufixed<128,128> sample_t;

typedef hls::axis<freq_t,0,0,0> freq_pkt;
typedef hls::axis<sample_t,0,0,0> sample_pkt;

#endif /* DATA_TYPES_H_ */
