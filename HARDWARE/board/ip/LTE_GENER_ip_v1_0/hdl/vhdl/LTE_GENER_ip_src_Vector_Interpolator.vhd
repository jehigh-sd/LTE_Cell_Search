-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2\LTE_GENER_ip_src_Vector_Interpolator.vhd
-- Created: 2022-05-23 17:12:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_GENER_ip_src_Vector_Interpolator
-- Source Path: zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2/LTE_GENERATOR/LTE_Generator/Vector Interpolator
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_GENER_ip_src_Vector_Interpolator IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        txDataI                           :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        txDataQ                           :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        txValidI                          :   OUT   std_logic;
        txValidQ                          :   OUT   std_logic
        );
END LTE_GENER_ip_src_Vector_Interpolator;


ARCHITECTURE rtl OF LTE_GENER_ip_src_Vector_Interpolator IS

  -- Component Declarations
  COMPONENT LTE_GENER_ip_src_FIR_Vector_Interp
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          DataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          DataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          ValidIn                         :   IN    std_logic;
          DataOut_re_0                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_re_1                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_re_2                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_re_3                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_re_4                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_re_5                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_re_6                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_re_7                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_im_0                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_im_1                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_im_2                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_im_3                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_im_4                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_im_5                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_im_6                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          DataOut_im_7                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          ValidOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_Vector_To_DAC_I
    PORT( In1_0                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_1                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_2                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_3                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_4                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_5                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_6                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_7                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          packed_out                      :   OUT   std_logic_vector(127 DOWNTO 0)  -- ufix128
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_Vector_To_DAC_Q
    PORT( In1_0                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_1                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_2                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_3                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_4                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_5                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_6                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          In1_7                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          packed_out                      :   OUT   std_logic_vector(127 DOWNTO 0)  -- ufix128
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_GENER_ip_src_FIR_Vector_Interp
    USE ENTITY work.LTE_GENER_ip_src_FIR_Vector_Interp(rtl);

  FOR ALL : LTE_GENER_ip_src_Vector_To_DAC_I
    USE ENTITY work.LTE_GENER_ip_src_Vector_To_DAC_I(rtl);

  FOR ALL : LTE_GENER_ip_src_Vector_To_DAC_Q
    USE ENTITY work.LTE_GENER_ip_src_Vector_To_DAC_Q(rtl);

  -- Signals
  SIGNAL dataIn_re_signed                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataIn_im_signed                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Data_Type_Conversion_out1_re     : signed(15 DOWNTO 0);  -- int16
  SIGNAL Data_Type_Conversion_out1_im     : signed(15 DOWNTO 0);  -- int16
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL FIR_Vector_Interp_out1_re_0      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_re_1      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_re_2      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_re_3      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_re_4      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_re_5      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_re_6      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_re_7      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_im_0      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_im_1      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_im_2      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_im_3      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_im_4      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_im_5      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_im_6      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out1_im_7      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL FIR_Vector_Interp_out2           : std_logic;
  SIGNAL packed_out                       : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL packed_out_1                     : std_logic_vector(127 DOWNTO 0);  -- ufix128

BEGIN
  u_FIR_Vector_Interp : LTE_GENER_ip_src_FIR_Vector_Interp
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              DataIn_re => std_logic_vector(Data_Type_Conversion_out1_re),  -- int16
              DataIn_im => std_logic_vector(Data_Type_Conversion_out1_im),  -- int16
              ValidIn => Constant_out1,
              DataOut_re_0 => FIR_Vector_Interp_out1_re_0,  -- int16
              DataOut_re_1 => FIR_Vector_Interp_out1_re_1,  -- int16
              DataOut_re_2 => FIR_Vector_Interp_out1_re_2,  -- int16
              DataOut_re_3 => FIR_Vector_Interp_out1_re_3,  -- int16
              DataOut_re_4 => FIR_Vector_Interp_out1_re_4,  -- int16
              DataOut_re_5 => FIR_Vector_Interp_out1_re_5,  -- int16
              DataOut_re_6 => FIR_Vector_Interp_out1_re_6,  -- int16
              DataOut_re_7 => FIR_Vector_Interp_out1_re_7,  -- int16
              DataOut_im_0 => FIR_Vector_Interp_out1_im_0,  -- int16
              DataOut_im_1 => FIR_Vector_Interp_out1_im_1,  -- int16
              DataOut_im_2 => FIR_Vector_Interp_out1_im_2,  -- int16
              DataOut_im_3 => FIR_Vector_Interp_out1_im_3,  -- int16
              DataOut_im_4 => FIR_Vector_Interp_out1_im_4,  -- int16
              DataOut_im_5 => FIR_Vector_Interp_out1_im_5,  -- int16
              DataOut_im_6 => FIR_Vector_Interp_out1_im_6,  -- int16
              DataOut_im_7 => FIR_Vector_Interp_out1_im_7,  -- int16
              ValidOut => FIR_Vector_Interp_out2
              );

  u_Vector_To_DAC_I : LTE_GENER_ip_src_Vector_To_DAC_I
    PORT MAP( In1_0 => FIR_Vector_Interp_out1_re_0,  -- int16
              In1_1 => FIR_Vector_Interp_out1_re_1,  -- int16
              In1_2 => FIR_Vector_Interp_out1_re_2,  -- int16
              In1_3 => FIR_Vector_Interp_out1_re_3,  -- int16
              In1_4 => FIR_Vector_Interp_out1_re_4,  -- int16
              In1_5 => FIR_Vector_Interp_out1_re_5,  -- int16
              In1_6 => FIR_Vector_Interp_out1_re_6,  -- int16
              In1_7 => FIR_Vector_Interp_out1_re_7,  -- int16
              packed_out => packed_out  -- ufix128
              );

  u_Vector_To_DAC_Q : LTE_GENER_ip_src_Vector_To_DAC_Q
    PORT MAP( In1_0 => FIR_Vector_Interp_out1_im_0,  -- int16
              In1_1 => FIR_Vector_Interp_out1_im_1,  -- int16
              In1_2 => FIR_Vector_Interp_out1_im_2,  -- int16
              In1_3 => FIR_Vector_Interp_out1_im_3,  -- int16
              In1_4 => FIR_Vector_Interp_out1_im_4,  -- int16
              In1_5 => FIR_Vector_Interp_out1_im_5,  -- int16
              In1_6 => FIR_Vector_Interp_out1_im_6,  -- int16
              In1_7 => FIR_Vector_Interp_out1_im_7,  -- int16
              packed_out => packed_out_1  -- ufix128
              );

  dataIn_re_signed <= signed(dataIn_re);

  dataIn_im_signed <= signed(dataIn_im);

  Data_Type_Conversion_out1_re <= dataIn_re_signed;
  Data_Type_Conversion_out1_im <= dataIn_im_signed;

  Constant_out1 <= '1';

  txDataI <= packed_out;

  txDataQ <= packed_out_1;

  txValidI <= FIR_Vector_Interp_out2;

  txValidQ <= FIR_Vector_Interp_out2;

END rtl;

