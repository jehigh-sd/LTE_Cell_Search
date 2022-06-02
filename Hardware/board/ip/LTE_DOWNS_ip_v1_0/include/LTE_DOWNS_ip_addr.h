/*
 * File Name:         hdl_prj\ipcore\LTE_DOWNS_ip_v1_0\include\LTE_DOWNS_ip_addr.h
 * Description:       C Header File
 * Created:           2022-05-25 15:55:33
*/

#ifndef LTE_DOWNS_IP_H_
#define LTE_DOWNS_IP_H_

#define  IPCore_Reset_LTE_DOWNS_ip                             0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_LTE_DOWNS_ip                            0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_PacketSize_AXI4_Stream_I_Master_LTE_DOWNS_ip   0x8  //Packet size for AXI4-Stream I Master interface, the default value is 1024. The TLAST output signal of the AXI4-Stream I Master interface is generated based on the packet size.
#define  IPCore_PacketSize_AXI4_Stream_Q_Master_LTE_DOWNS_ip   0xC  //Packet size for AXI4-Stream Q Master interface, the default value is 1024. The TLAST output signal of the AXI4-Stream Q Master interface is generated based on the packet size.
#define  IPCore_Timestamp_LTE_DOWNS_ip                         0x10  //contains unique IP timestamp (yymmddHHMM): 2205251555
#define  extdatasel_in_Data_LTE_DOWNS_ip                       0x100  //data register for Inport extdatasel_in

#endif /* LTE_DOWNS_IP_H_ */
