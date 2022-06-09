#ifndef DATA_TYPES_H_
#define DATA_TYPES_H_

#include <ap_fixed.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

typedef ap_int<16> adc_data_t;

typedef ap_ufixed<256,256> samplesXL_t;
typedef hls::axis<samplesXL_t,0,0,0> samplesXL_pkt;

#endif /* DATA_TYPES_H_ */
