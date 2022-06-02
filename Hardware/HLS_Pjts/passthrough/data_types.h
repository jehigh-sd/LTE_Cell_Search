#ifndef DATA_TYPES_H_
#define DATA_TYPES_H_

#include <ap_fixed.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

typedef ap_ufixed<128,128> samples_t;
typedef hls::axis<samples_t,0,0,0> samples_pkt;

#endif /* DATA_TYPES_H_ */
