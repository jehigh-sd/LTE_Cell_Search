#include "lte_cellsearch.h"
#include "math.h"


//void copy_input(hls::stream<in_data_pkt_uint128> &IN_I, hls::stream<in_data_pkt_uint128> &IN_Q, DTYPE IN_I_temp[SIZE], DTYPE IN_Q_temp[SIZE])
//{
//	in_data_pkt_uint128 t1;
//	in_data_pkt_uint128 t2;
//
//  for(int i = 0; i < SIZE; i++)
//  {
//	t1.data = IN_I.read().data;
//	t2.data = IN_Q.read().data;
//    IN_I_temp[i] = t1.data;
//    IN_Q_temp[i] = t2.data;
//  }
//
//}

//void write_output(in_data_param param_temp,hls::stream<in_data_param> &PARAM)
//{
//	in_data_param t3;
//	t3.data = PARAM.read().data;
//
//	param_temp.data.startIn = t3.data.startIn;
//	param_temp.data.external = t3.data.external;
//	param_temp.data.NCellID = t3.data.NCellID;
//
//	PARAM.write(t3);
//
//}


//void lte_cellsearch(hls::stream<in_data_pkt_uint128> &IN_I, hls::stream<in_data_pkt_uint128> &IN_Q, in_data_param * PARAM_OUT)
//{
//
//#pragma HLS INTERFACE axis port=IN_I
//#pragma HLS INTERFACE axis port=IN_Q
////#pragma HLS INTERFACE axis port=PARAM_OUT
//
////#pragma HLS INTERFACE s_axilite port=PARAM_OUT
//#pragma HLS INTERFACE mode=s_axilite port=PARAM_OUT
//
//#pragma HLS INTERFACE s_axilite port=return bundle=control
//
//	  DTYPE IN_I_temp[SIZE], IN_Q_temp[SIZE];
//	  in_data_param parameters;
//
//	  copy_input(IN_I, IN_Q, IN_I_temp, IN_Q_temp);
//	  parameters.startIn = true;
//	  parameters.external = true;
//	  parameters.NCellID = 100;
//
//	  PARAM_OUT = parameters;
//
//}

void lte_cellsearch(axis_t *ADC0_RE_Slave, axis_t *ADC0_IM_Slave,
		  int NCellID, int FreqEst, int CellDetected)
{
#pragma HLS INTERFACE s_axilite port=NCellID bundle=CTRL
#pragma HLS INTERFACE s_axilite port=FreqEst bundle=CTRL
#pragma HLS INTERFACE s_axilite port=CellDetected bundle=CTRL

#pragma HLS INTERFACE axis depth=50 port=ADC0_RE_Slave
#pragma HLS INTERFACE axis depth=50 port=ADC0_IM_Slave

	for(unsigned int i=0; i<100; i++){
		axis_t cur1 = *ADC0_RE_Slave++;
		axis_t cur2 = *ADC0_IM_Slave++;

		NCellID += cur1.data + cur2.data;
		FreqEst += 1;
		CellDetected += 2;
	}
}



