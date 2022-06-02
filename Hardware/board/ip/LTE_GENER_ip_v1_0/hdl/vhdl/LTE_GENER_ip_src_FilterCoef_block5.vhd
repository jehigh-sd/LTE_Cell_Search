-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2\LTE_GENER_ip_src_FilterCoef_block5.vhd
-- Created: 2022-05-23 17:12:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_GENER_ip_src_FilterCoef_block5
-- Source Path: zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2/LTE_GENERATOR/LTE_Generator/Vector Interpolator/FIR_Vector_Interp/Discrete 
-- FIR Filter HDL Optimized6/Filter/FilterCoe
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_GENER_ip_src_FilterCoef_block5 IS
  PORT( CoefOut_0                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_1                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_2                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_3                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_4                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_5                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_6                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_7                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_8                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_9                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_10                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_11                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_12                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_13                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_14                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_15                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_16                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_17                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_18                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_19                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_20                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_21                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_22                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_23                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_24                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_25                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_26                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_27                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_28                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_29                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_30                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        CoefOut_31                        :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
        );
END LTE_GENER_ip_src_FilterCoef_block5;


ARCHITECTURE rtl OF LTE_GENER_ip_src_FilterCoef_block5 IS

  -- Signals
  SIGNAL CoefData                         : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_1                       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_2                       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_3                       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_4                       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_5                       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_6                       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_7                       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_8                       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_9                       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_10                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_11                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_12                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_13                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_14                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_15                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_16                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_17                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_18                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_19                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_20                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_21                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_22                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_23                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_24                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_25                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_26                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_27                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_28                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_29                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_30                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CoefData_31                      : signed(15 DOWNTO 0);  -- sfix16_En15

BEGIN
  -- CoefReg_1
  CoefData <= to_signed(-16#0004#, 16);

  CoefOut_0 <= std_logic_vector(CoefData);

  -- CoefReg_2
  CoefData_1 <= to_signed(16#000B#, 16);

  CoefOut_1 <= std_logic_vector(CoefData_1);

  -- CoefReg_3
  CoefData_2 <= to_signed(-16#0018#, 16);

  CoefOut_2 <= std_logic_vector(CoefData_2);

  -- CoefReg_4
  CoefData_3 <= to_signed(16#002E#, 16);

  CoefOut_3 <= std_logic_vector(CoefData_3);

  -- CoefReg_5
  CoefData_4 <= to_signed(-16#0051#, 16);

  CoefOut_4 <= std_logic_vector(CoefData_4);

  -- CoefReg_6
  CoefData_5 <= to_signed(16#0085#, 16);

  CoefOut_5 <= std_logic_vector(CoefData_5);

  -- CoefReg_7
  CoefData_6 <= to_signed(-16#00D1#, 16);

  CoefOut_6 <= std_logic_vector(CoefData_6);

  -- CoefReg_8
  CoefData_7 <= to_signed(16#013B#, 16);

  CoefOut_7 <= std_logic_vector(CoefData_7);

  -- CoefReg_9
  CoefData_8 <= to_signed(-16#01CC#, 16);

  CoefOut_8 <= std_logic_vector(CoefData_8);

  -- CoefReg_10
  CoefData_9 <= to_signed(16#0294#, 16);

  CoefOut_9 <= std_logic_vector(CoefData_9);

  -- CoefReg_11
  CoefData_10 <= to_signed(-16#03A9#, 16);

  CoefOut_10 <= std_logic_vector(CoefData_10);

  -- CoefReg_12
  CoefData_11 <= to_signed(16#0536#, 16);

  CoefOut_11 <= std_logic_vector(CoefData_11);

  -- CoefReg_13
  CoefData_12 <= to_signed(-16#079C#, 16);

  CoefOut_12 <= std_logic_vector(CoefData_12);

  -- CoefReg_14
  CoefData_13 <= to_signed(16#0BE8#, 16);

  CoefOut_13 <= std_logic_vector(CoefData_13);

  -- CoefReg_15
  CoefData_14 <= to_signed(-16#1689#, 16);

  CoefOut_14 <= std_logic_vector(CoefData_14);

  -- CoefReg_16
  CoefData_15 <= to_signed(16#7323#, 16);

  CoefOut_15 <= std_logic_vector(CoefData_15);

  -- CoefReg_17
  CoefData_16 <= to_signed(16#261B#, 16);

  CoefOut_16 <= std_logic_vector(CoefData_16);

  -- CoefReg_18
  CoefData_17 <= to_signed(-16#0FC1#, 16);

  CoefOut_17 <= std_logic_vector(CoefData_17);

  -- CoefReg_19
  CoefData_18 <= to_signed(16#0965#, 16);

  CoefOut_18 <= std_logic_vector(CoefData_18);

  -- CoefReg_20
  CoefData_19 <= to_signed(-16#0644#, 16);

  CoefOut_19 <= std_logic_vector(CoefData_19);

  -- CoefReg_21
  CoefData_20 <= to_signed(16#045C#, 16);

  CoefOut_20 <= std_logic_vector(CoefData_20);

  -- CoefReg_22
  CoefData_21 <= to_signed(-16#0313#, 16);

  CoefOut_21 <= std_logic_vector(CoefData_21);

  -- CoefReg_23
  CoefData_22 <= to_signed(16#0228#, 16);

  CoefOut_22 <= std_logic_vector(CoefData_22);

  -- CoefReg_24
  CoefData_23 <= to_signed(-16#017E#, 16);

  CoefOut_23 <= std_logic_vector(CoefData_23);

  -- CoefReg_25
  CoefData_24 <= to_signed(16#0101#, 16);

  CoefOut_24 <= std_logic_vector(CoefData_24);

  -- CoefReg_26
  CoefData_25 <= to_signed(-16#00A8#, 16);

  CoefOut_25 <= std_logic_vector(CoefData_25);

  -- CoefReg_27
  CoefData_26 <= to_signed(16#0069#, 16);

  CoefOut_26 <= std_logic_vector(CoefData_26);

  -- CoefReg_28
  CoefData_27 <= to_signed(-16#003E#, 16);

  CoefOut_27 <= std_logic_vector(CoefData_27);

  -- CoefReg_29
  CoefData_28 <= to_signed(16#0022#, 16);

  CoefOut_28 <= std_logic_vector(CoefData_28);

  -- CoefReg_30
  CoefData_29 <= to_signed(-16#0010#, 16);

  CoefOut_29 <= std_logic_vector(CoefData_29);

  -- CoefReg_31
  CoefData_30 <= to_signed(16#0007#, 16);

  CoefOut_30 <= std_logic_vector(CoefData_30);

  -- CoefReg_32
  CoefData_31 <= to_signed(-16#0002#, 16);

  CoefOut_31 <= std_logic_vector(CoefData_31);

END rtl;

