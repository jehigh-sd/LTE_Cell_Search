-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\LTE_MIB_H_ip_src_FilterCoef_block4.vhd
-- Created: 2022-05-23 17:26:55
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_FilterCoef_block4
-- Source Path: zynqRadioHWSWLTEMIBDetectorRFSoC2x2/LTE_MIB_HDL/Preprocessor/Vector Decimator/Decimation/FIR Decimation 
-- HDL Optimized1/FilterBank/FilterCoe
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_FilterCoef_block4 IS
  PORT( CoefOut_0                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        CoefOut_1                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        CoefOut_2                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        CoefOut_3                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        CoefOut_4                         :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En16
        );
END LTE_MIB_H_ip_src_FilterCoef_block4;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_FilterCoef_block4 IS

  -- Signals
  SIGNAL CoefData                         : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL CoefData_1                       : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL CoefData_2                       : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL CoefData_3                       : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL CoefData_4                       : signed(15 DOWNTO 0);  -- sfix16_En16

BEGIN
  -- CoefReg_1
  CoefData <= to_signed(16#0056#, 16);

  CoefOut_0 <= std_logic_vector(CoefData);

  -- CoefReg_2
  CoefData_1 <= to_signed(16#0000#, 16);

  CoefOut_1 <= std_logic_vector(CoefData_1);

  -- CoefReg_3
  CoefData_2 <= to_signed(16#5F74#, 16);

  CoefOut_2 <= std_logic_vector(CoefData_2);

  -- CoefReg_4
  CoefData_3 <= to_signed(-16#051A#, 16);

  CoefOut_3 <= std_logic_vector(CoefData_3);

  -- CoefReg_5
  CoefData_4 <= to_signed(16#0069#, 16);

  CoefOut_4 <= std_logic_vector(CoefData_4);

END rtl;

