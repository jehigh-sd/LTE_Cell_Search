#ifndef DATA_TYPES_H_
#define DATA_TYPES_H_

#include <ap_fixed.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

typedef ap_ufixed<128,128> sample_t;
typedef hls::axis<sample_t,0,0,0> sample_pkt;

#endif /* DATA_TYPES_H_ */
