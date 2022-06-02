-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEDecimatorRFSoC2x2\LTE_DOWNS_ip_src_FilterCoef.vhd
-- Created: 2022-05-25 15:55:22
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_DOWNS_ip_src_FilterCoef
-- Source Path: zynqRadioHWSWLTEDecimatorRFSoC2x2/LTE_DOWNSAMPLE_HDL/DOWNSAMPLE/Vector Decimator/Decimation/FIR Decimation 
-- HDL Optimized1/FilterBank/FilterCoe
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_DOWNS_ip_src_FilterCoef IS
  PORT( CoefOut_0                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        CoefOut_1                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        CoefOut_2                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        CoefOut_3                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        CoefOut_4                         :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En16
        );
END LTE_DOWNS_ip_src_FilterCoef;


ARCHITECTURE rtl OF LTE_DOWNS_ip_src_FilterCoef IS

  -- Signals
  SIGNAL CoefData                         : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL CoefData_1                       : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL CoefData_2                       : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL CoefData_3                       : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL CoefData_4                       : signed(15 DOWNTO 0);  -- sfix16_En16

BEGIN
  -- CoefReg_1
  CoefData <= to_signed(16#01D0#, 16);

  CoefOut_0 <= std_logic_vector(CoefData);

  -- CoefReg_2
  CoefData_1 <= to_signed(16#0000#, 16);

  CoefOut_1 <= std_logic_vector(CoefData_1);

  -- CoefReg_3
  CoefData_2 <= to_signed(16#06E6#, 16);

  CoefOut_2 <= std_logic_vector(CoefData_2);

  -- CoefReg_4
  CoefData_3 <= to_signed(-16#011C#, 16);

  CoefOut_3 <= std_logic_vector(CoefData_3);

  -- CoefReg_5
  CoefData_4 <= to_signed(16#0000#, 16);

  CoefOut_4 <= std_logic_vector(CoefData_4);

END rtl;

