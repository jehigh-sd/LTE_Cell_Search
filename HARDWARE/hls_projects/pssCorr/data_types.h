#ifndef DATA_TYPES_H_
#define DATA_TYPES_H_

#include <ap_fixed.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

typedef ap_fixed<32,12> data_t;
typedef ap_fixed<40,18> math_t;
typedef ap_fixed<32,16> acc_t;
typedef ap_fixed<32,8> coef_t;

typedef ap_int<16> adc_data_t;

typedef ap_ufixed<16,16> sample_t;
typedef hls::axis<sample_t,0,0,0> sample_pkt;

#endif /* DATA_TYPES_H_ */
