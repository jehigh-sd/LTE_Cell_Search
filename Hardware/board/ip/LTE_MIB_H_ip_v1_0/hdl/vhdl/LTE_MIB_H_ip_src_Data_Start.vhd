-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\LTE_MIB_H_ip_src_Data_Start.vhd
-- Created: 2022-05-23 17:26:55
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_Data_Start
-- Source Path: zynqRadioHWSWLTEMIBDetectorRFSoC2x2/LTE_MIB_HDL/Preprocessor/Data Start
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_Data_Start IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        enb_1_2_1                         :   IN    std_logic;
        pulseIn                           :   IN    std_logic;
        pulseOut                          :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_Data_Start;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_Data_Start IS

  -- Signals
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Downsample_out1                  : std_logic;
  SIGNAL Delay5_out1                      : std_logic;
  SIGNAL Delay2_out1                      : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;

BEGIN
  Logical_Operator_out1 <= Delay1_out1 XOR pulseIn;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay1_out1 <= Logical_Operator_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  -- Downsample by 2 register (Sample offset 0)
  Downsample_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Downsample_out1 <= '0';
      ELSIF enb_1_2_1 = '1' THEN
        Downsample_out1 <= Delay1_out1;
      END IF;
    END IF;
  END PROCESS Downsample_output_process;


  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay5_out1 <= Downsample_out1;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay2_out1 <= Delay5_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Logical_Operator1_out1 <= Delay5_out1 XOR Delay2_out1;

  pulseOut <= Logical_Operator1_out1;

END rtl;

