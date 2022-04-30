#ifndef LTE_CELLSEARCH_H_
#define LTE_CELLSEARCH_H_

#include <hls_stream.h>
#include "ap_fixed.h"
#include "ap_axi_sdata.h"


typedef float DTYPE;
typedef bool dbool;
typedef int INTTYPE;
typedef ap_uint<6> uint_6;
typedef ap_uint<9> uint_9;
typedef ap_uint<128> uint_128;
struct in_type
{
	float real;
	float imag;
};

struct in_param
{
	bool startIn;
	bool external;
	uint_9 NCellID;
};

typedef hls::axis<DTYPE,0,0,0> data_pkt;
typedef hls::axis<in_type,0,0,0> in_data_pkt;

typedef hls::axis<uint_128,0,0,0> in_data_pkt_uint128;

typedef in_param in_data_param;


struct axis_t {
	int data;
	ap_int<1> last;
};

void lte_cellsearch(axis_t *INPUT1, axis_t *INPUT2, axis_t *OUTPUT, unsigned int length);


#endif
