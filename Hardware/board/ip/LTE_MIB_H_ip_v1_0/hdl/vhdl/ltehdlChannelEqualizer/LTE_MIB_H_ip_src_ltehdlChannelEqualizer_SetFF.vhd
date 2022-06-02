-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlChannelEqualizer\LTE_MIB_H_ip_src_ltehdlChannelEqualizer_SetFF.vhd
-- Created: 2022-05-23 17:26:43
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlChannelEqualizer_SetFF
-- Source Path: ltehdlChannelEqualizer/ cellRefGen/LTE Gold Seq upsampling/Gold Sequence Generator/SetFF
-- Hierarchy Level: 7
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlChannelEqualizer_SetFF IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        D                                 :   IN    std_logic;
        Q                                 :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlChannelEqualizer_SetFF;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlChannelEqualizer_SetFF IS

  -- Signals
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(0 TO 41);  -- ufix1 [42]
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL enb_gated                        : std_logic;
  SIGNAL Logical_Operator6_out1           : std_logic;
  SIGNAL Delay5_out1                      : std_logic;

BEGIN
  stateControl_1 <= '1';

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch_reg(0) <= stateControl_1;
        delayMatch_reg(1 TO 41) <= delayMatch_reg(0 TO 40);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  stateControl_2 <= delayMatch_reg(41);

  enb_gated <= stateControl_2 AND enb;

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1 <= '0';
      ELSIF enb_gated = '1' THEN
        Delay5_out1 <= Logical_Operator6_out1;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  Logical_Operator6_out1 <= D OR Delay5_out1;

  Q <= Logical_Operator6_out1;

END rtl;

