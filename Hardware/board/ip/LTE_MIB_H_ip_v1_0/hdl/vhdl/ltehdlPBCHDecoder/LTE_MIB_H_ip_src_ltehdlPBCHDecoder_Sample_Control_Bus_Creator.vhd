-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlPBCHDecoder\LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Sample_Control_Bus_Creator.vhd
-- Created: 2022-05-23 17:26:45
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Sample_Control_Bus_Creator
-- Source Path: ltehdlPBCHDecoder/BCH Decoder/controlbusGen/Sample Control Bus Creator
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Sample_Control_Bus_Creator IS
  PORT( In1                               :   IN    std_logic;
        In2                               :   IN    std_logic;
        In3                               :   IN    std_logic;
        Out1_start                        :   OUT   std_logic;  -- record {boolean,boolean,boolean}
        Out1_end                          :   OUT   std_logic;  -- record {boolean,boolean,boolean}
        Out1_valid                        :   OUT   std_logic  -- record {boolean,boolean,boolean}
        );
END LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Sample_Control_Bus_Creator;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Sample_Control_Bus_Creator IS

BEGIN
  Out1_start <= In1;

  Out1_end <= In2;

  Out1_valid <= In3;

END rtl;

