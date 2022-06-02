-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlChannelEqualizer\LTE_MIB_H_ip_src_ltehdlChannelEqualizer_Subsystem2.vhd
-- Created: 2022-05-23 17:26:43
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlChannelEqualizer_Subsystem2
-- Source Path: ltehdlChannelEqualizer/chEst/hEstInterpAndStore/Subsystem2
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlChannelEqualizer_Subsystem2 IS
  PORT( previous_re                       :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En16
        previous_im                       :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En16
        current_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        current_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        doAverage                         :   IN    std_logic;
        average_re                        :   OUT   std_logic_vector(16 DOWNTO 0);  -- sfix17_En16
        average_im                        :   OUT   std_logic_vector(16 DOWNTO 0)  -- sfix17_En16
        );
END LTE_MIB_H_ip_src_ltehdlChannelEqualizer_Subsystem2;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlChannelEqualizer_Subsystem2 IS

  -- Signals
  SIGNAL current_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL current_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL Data_Type_Conversion_out1_re     : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL Data_Type_Conversion_out1_im     : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL previous_re_signed               : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL previous_im_signed               : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL Add2_add_cast                    : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL Add2_add_cast_1                  : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL Add2_out1_re                     : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL Add2_out1_im                     : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL Multiport_Switch1_out1_re        : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL Multiport_Switch1_out1_im        : signed(16 DOWNTO 0);  -- sfix17_En16

BEGIN
  current_re_signed <= signed(current_re);

  current_im_signed <= signed(current_im);

  Data_Type_Conversion_out1_re <= resize(current_re_signed, 17);
  Data_Type_Conversion_out1_im <= resize(current_im_signed, 17);

  previous_re_signed <= signed(previous_re);

  previous_im_signed <= signed(previous_im);

  Add2_add_cast <= resize(current_re_signed, 17);
  Add2_out1_re <= Add2_add_cast + previous_re_signed;
  Add2_add_cast_1 <= resize(current_im_signed, 17);
  Add2_out1_im <= Add2_add_cast_1 + previous_im_signed;

  
  Multiport_Switch1_out1_re <= Data_Type_Conversion_out1_re WHEN doAverage = '0' ELSE
      Add2_out1_re;
  
  Multiport_Switch1_out1_im <= Data_Type_Conversion_out1_im WHEN doAverage = '0' ELSE
      Add2_out1_im;

  average_re <= std_logic_vector(Multiport_Switch1_out1_re);

  average_im <= std_logic_vector(Multiport_Switch1_out1_im);

END rtl;

