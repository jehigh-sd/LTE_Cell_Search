-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlChannelEqualizer\LTE_MIB_H_ip_src_ltehdlChannelEqualizer_Complex_shift.vhd
-- Created: 2022-05-23 17:26:43
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlChannelEqualizer_Complex_shift
-- Source Path: ltehdlChannelEqualizer/chEst/hEstInterpAndStore/hEstInterpAndStore/InterpCalculation/Complex shift
-- Hierarchy Level: 8
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlChannelEqualizer_Complex_shift IS
  PORT( In1_re_0                          :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        In1_re_1                          :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        In1_im_0                          :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        In1_im_1                          :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        Out1_re_0                         :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        Out1_re_1                         :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        Out1_im_0                         :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        Out1_im_1                         :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En16
        );
END LTE_MIB_H_ip_src_ltehdlChannelEqualizer_Complex_shift;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlChannelEqualizer_Complex_shift IS

  -- Signals
  SIGNAL In1_re_0_signed                  : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Bit_Shift_out1                   : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL In1_re_1_signed                  : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Bit_Shift2_out1                  : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL In1_im_0_signed                  : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Bit_Shift1_out1                  : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL In1_im_1_signed                  : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Bit_Shift3_out1                  : signed(17 DOWNTO 0);  -- sfix18_En16

BEGIN
  In1_re_0_signed <= signed(In1_re_0);

  Bit_Shift_out1 <= In1_re_0_signed sll 1;

  Out1_re_0 <= std_logic_vector(Bit_Shift_out1);

  In1_re_1_signed <= signed(In1_re_1);

  Bit_Shift2_out1 <= In1_re_1_signed sll 1;

  Out1_re_1 <= std_logic_vector(Bit_Shift2_out1);

  In1_im_0_signed <= signed(In1_im_0);

  Bit_Shift1_out1 <= In1_im_0_signed sll 1;

  Out1_im_0 <= std_logic_vector(Bit_Shift1_out1);

  In1_im_1_signed <= signed(In1_im_1);

  Bit_Shift3_out1 <= In1_im_1_signed sll 1;

  Out1_im_1 <= std_logic_vector(Bit_Shift3_out1);

END rtl;
