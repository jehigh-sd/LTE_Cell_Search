-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlChannelEqualizer\LTE_MIB_H_ip_src_ltehdlChannelEqualizer_downsampling_seq2complex.vhd
-- Created: 2022-05-23 17:26:43
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlChannelEqualizer_downsampling_seq2complex
-- Source Path: ltehdlChannelEqualizer/ cellRefGen/downsampling seq2complex
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlChannelEqualizer_downsampling_seq2complex IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2_1                         :   IN    std_logic;
        sequence                          :   IN    std_logic;
        valid                             :   IN    std_logic;
        complex_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        complex_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validOut                          :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlChannelEqualizer_downsampling_seq2complex;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlChannelEqualizer_downsampling_seq2complex IS

  -- Signals
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL Downsample3_bypass_reg           : std_logic;  -- ufix1
  SIGNAL Downsample3_out1                 : std_logic;
  SIGNAL Constant2_out1                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Constant1_out1                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Switch1_out1                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Downsample2_bypass_reg           : std_logic;  -- ufix1
  SIGNAL Downsample2_out1                 : std_logic;
  SIGNAL Constant3_out1                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Constant4_out1                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Switch2_out1                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL Downsample1_bypass_reg           : std_logic;  -- ufix1
  SIGNAL Downsample1_out1                 : std_logic;

BEGIN
  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay3_out1 <= sequence;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay1_out1 <= Delay3_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  -- Downsample3: Downsample by 2, Sample offset 0 
  -- Downsample bypass register
  Downsample3_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Downsample3_bypass_reg <= '0';
      ELSIF enb_1_2_1 = '1' THEN
        Downsample3_bypass_reg <= Delay1_out1;
      END IF;
    END IF;
  END PROCESS Downsample3_bypass_process;

  
  Downsample3_out1 <= Delay1_out1 WHEN enb_1_2_1 = '1' ELSE
      Downsample3_bypass_reg;

  Constant2_out1 <= to_signed(16#5A82#, 16);

  Constant1_out1 <= to_signed(-16#5A82#, 16);

  
  Switch1_out1 <= Constant2_out1 WHEN Downsample3_out1 = '0' ELSE
      Constant1_out1;

  complex_re <= std_logic_vector(Switch1_out1);

  -- Downsample2: Downsample by 2, Sample offset 0 
  -- Downsample bypass register
  Downsample2_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Downsample2_bypass_reg <= '0';
      ELSIF enb_1_2_1 = '1' THEN
        Downsample2_bypass_reg <= Delay3_out1;
      END IF;
    END IF;
  END PROCESS Downsample2_bypass_process;

  
  Downsample2_out1 <= Delay3_out1 WHEN enb_1_2_1 = '1' ELSE
      Downsample2_bypass_reg;

  Constant3_out1 <= to_signed(-16#5A82#, 16);

  Constant4_out1 <= to_signed(16#5A82#, 16);

  
  Switch2_out1 <= Constant3_out1 WHEN Downsample2_out1 = '0' ELSE
      Constant4_out1;

  complex_im <= std_logic_vector(Switch2_out1);

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay4_out1 <= valid;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  -- Downsample1: Downsample by 2, Sample offset 0 
  -- Downsample bypass register
  Downsample1_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Downsample1_bypass_reg <= '0';
      ELSIF enb_1_2_1 = '1' THEN
        Downsample1_bypass_reg <= Delay4_out1;
      END IF;
    END IF;
  END PROCESS Downsample1_bypass_process;

  
  Downsample1_out1 <= Delay4_out1 WHEN enb_1_2_1 = '1' ELSE
      Downsample1_bypass_reg;

  validOut <= Downsample1_out1;

END rtl;

