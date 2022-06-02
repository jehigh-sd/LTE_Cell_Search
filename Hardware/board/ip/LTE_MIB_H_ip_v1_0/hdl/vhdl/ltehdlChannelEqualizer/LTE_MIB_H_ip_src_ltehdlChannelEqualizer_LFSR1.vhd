-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlChannelEqualizer\LTE_MIB_H_ip_src_ltehdlChannelEqualizer_LFSR1.vhd
-- Created: 2022-05-23 17:26:43
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlChannelEqualizer_LFSR1
-- Source Path: ltehdlChannelEqualizer/ cellRefGen/LTE Gold Seq upsampling/Gold Sequence Generator/LFSR1
-- Hierarchy Level: 7
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlChannelEqualizer;

ENTITY LTE_MIB_H_ip_src_ltehdlChannelEqualizer_LFSR1 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        Load                              :   IN    std_logic;
        getDimension                      :   IN    std_logic_vector(30 DOWNTO 0);  -- ufix31
        Enable                            :   IN    std_logic;
        Out1                              :   OUT   std_logic  -- ufix1
        );
END LTE_MIB_H_ip_src_ltehdlChannelEqualizer_LFSR1;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlChannelEqualizer_LFSR1 IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlChannelEqualizer_MATLAB_Function
    PORT( u                               :   IN    std_logic_vector(30 DOWNTO 0);  -- ufix31
          y                               :   OUT   std_logic_vector(30 DOWNTO 0)  -- ufix31
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlChannelEqualizer_MATLAB_Function
    USE ENTITY work_ltehdlChannelEqualizer.LTE_MIB_H_ip_src_ltehdlChannelEqualizer_MATLAB_Function(rtl);

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL y                                : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL y_unsigned                       : unsigned(30 DOWNTO 0);  -- ufix31
  SIGNAL Delay1_out1                      : unsigned(30 DOWNTO 0);  -- ufix31
  SIGNAL Extract_Bits2_out1               : unsigned(29 DOWNTO 0);  -- ufix30
  SIGNAL dtc1                             : std_logic;  -- ufix1
  SIGNAL Extract_Bits_out1                : std_logic;  -- ufix1
  SIGNAL Extract_Bits1_out1               : std_logic;  -- ufix1
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Bit_Concat1_out1                 : unsigned(30 DOWNTO 0);  -- ufix31
  SIGNAL Switch_out1                      : unsigned(30 DOWNTO 0);  -- ufix31
  SIGNAL bitMask_for_Bitwise_Operator     : unsigned(30 DOWNTO 0);  -- ufix31
  SIGNAL Bitwise_Operator_out1            : unsigned(30 DOWNTO 0);  -- ufix31
  SIGNAL Bit_Reduce_out1                  : std_logic;  -- ufix1

BEGIN
  u_MATLAB_Function : LTE_MIB_H_ip_src_ltehdlChannelEqualizer_MATLAB_Function
    PORT MAP( u => getDimension,  -- ufix31
              y => y  -- ufix31
              );

  
  switch_compare_1 <= '1' WHEN Load > '0' ELSE
      '0';

  y_unsigned <= unsigned(y);

  enb_gated <= Enable AND enb;

  Extract_Bits2_out1 <= Delay1_out1(30 DOWNTO 1);

  dtc1 <= Delay1_out1(0);

  Extract_Bits_out1 <= dtc1;

  Extract_Bits1_out1 <= Delay1_out1(3);

  Logical_Operator_out1 <= Extract_Bits1_out1 XOR Extract_Bits_out1;

  Bit_Concat1_out1 <= Logical_Operator_out1 & Extract_Bits2_out1;

  
  Switch_out1 <= Bit_Concat1_out1 WHEN switch_compare_1 = '0' ELSE
      y_unsigned;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= to_unsigned(16#00000000#, 31);
      ELSIF enb_gated = '1' THEN
        Delay1_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  bitMask_for_Bitwise_Operator <= to_unsigned(16#021A127A#, 31);

  Bitwise_Operator_out1 <= Delay1_out1 AND bitMask_for_Bitwise_Operator;

  Bit_Reduce_out1 <= (Bitwise_Operator_out1(30) XOR Bitwise_Operator_out1(29) XOR Bitwise_Operator_out1(28) XOR Bitwise_Operator_out1(27) XOR Bitwise_Operator_out1(26) XOR Bitwise_Operator_out1(25) XOR Bitwise_Operator_out1(24) XOR Bitwise_Operator_out1(23) XOR Bitwise_Operator_out1(22) XOR Bitwise_Operator_out1(21) XOR Bitwise_Operator_out1(20) XOR Bitwise_Operator_out1(19) XOR Bitwise_Operator_out1(18) XOR Bitwise_Operator_out1(17) XOR Bitwise_Operator_out1(16) XOR Bitwise_Operator_out1(15) XOR Bitwise_Operator_out1(14) XOR Bitwise_Operator_out1(13) XOR Bitwise_Operator_out1(12) XOR Bitwise_Operator_out1(11) XOR Bitwise_Operator_out1(10) XOR Bitwise_Operator_out1(9) XOR Bitwise_Operator_out1(8) XOR Bitwise_Operator_out1(7) XOR Bitwise_Operator_out1(6) XOR Bitwise_Operator_out1(5) XOR Bitwise_Operator_out1(4) XOR Bitwise_Operator_out1(3) XOR Bitwise_Operator_out1(2) XOR Bitwise_Operator_out1(1) XOR Bitwise_Operator_out1(0));

  Out1 <= Bit_Reduce_out1;

END rtl;
