#ifndef DATA_TYPES_H_
#define DATA_TYPES_H_

#include <ap_fixed.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

typedef ap_fixed<48,4> acc_t;
typedef ap_fixed<48,4> coef_t;
typedef ap_fixed<48,4> data_t;
typedef ap_ufixed<32,32> output_t;
typedef ap_ufixed<128,128> input_t;

typedef hls::axis<output_t,0,0,0> freq_pkt;
typedef hls::axis<input_t,0,0,0> sample_pkt;

#endif /* DATA_TYPES_H_ */
