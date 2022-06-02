/*
 * File Name:         hdl_prj\ipcore\LTE_MIB_H_ip_v1_0\include\LTE_MIB_H_ip_addr.h
 * Description:       C Header File
 * Created:           2022-05-23 17:29:03
*/

#ifndef LTE_MIB_H_IP_H_
#define LTE_MIB_H_IP_H_

#define  IPCore_Reset_LTE_MIB_H_ip          0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_LTE_MIB_H_ip         0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_LTE_MIB_H_ip      0x8  //contains unique IP timestamp (yymmddHHMM): 2205231728
#define  extdatasel_in_Data_LTE_MIB_H_ip    0x100  //data register for Inport extdatasel_in
#define  start_in_Data_LTE_MIB_H_ip         0x108  //data register for Inport start_in
#define  ncellid_Data_LTE_MIB_H_ip          0x110  //data register for Outport ncellid
#define  tddmode_Data_LTE_MIB_H_ip          0x114  //data register for Outport tddmode
#define  freqest_Data_LTE_MIB_H_ip          0x118  //data register for Outport freqest
#define  celldetected_Data_LTE_MIB_H_ip     0x11C  //data register for Outport celldetected
#define  cellsearchdone_Data_LTE_MIB_H_ip   0x120  //data register for Outport cellsearchdone
#define  NDLRB_Data_LTE_MIB_H_ip            0x124  //data register for Outport NDLRB
#define  PHICH_Data_LTE_MIB_H_ip            0x128  //data register for Outport PHICH
#define  ng_Data_LTE_MIB_H_ip               0x12C  //data register for Outport ng
#define  nframe_Data_LTE_MIB_H_ip           0x130  //data register for Outport nframe
#define  cellrefip_Data_LTE_MIB_H_ip        0x134  //data register for Outport cellrefip
#define  mibdetected_Data_LTE_MIB_H_ip      0x138  //data register for Outport mibdetected
#define  miberror_Data_LTE_MIB_H_ip         0x13C  //data register for Outport miberror

#endif /* LTE_MIB_H_IP_H_ */
