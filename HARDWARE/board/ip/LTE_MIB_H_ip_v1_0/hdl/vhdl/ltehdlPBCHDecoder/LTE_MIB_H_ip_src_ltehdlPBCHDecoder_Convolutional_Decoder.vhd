-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlPBCHDecoder\LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Convolutional_Decoder.vhd
-- Created: 2022-05-23 17:26:45
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Convolutional_Decoder
-- Source Path: ltehdlPBCHDecoder/BCH Decoder/Convolutional Decoder
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlPBCHDecoder;

ENTITY LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Convolutional_Decoder IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_0                            :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        data_1                            :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        data_2                            :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        ctrl_start                        :   IN    std_logic;
        ctrl_end                          :   IN    std_logic;
        ctrl_valid                        :   IN    std_logic;
        data1                             :   OUT   std_logic;
        ctrl1_start                       :   OUT   std_logic;
        ctrl1_end                         :   OUT   std_logic;
        ctrl1_valid                       :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Convolutional_Decoder;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Convolutional_Decoder IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ConvolutionalDecoderMessageExtender
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          data_0                          :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          data_1                          :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          data_2                          :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          ctrl_start                      :   IN    std_logic;
          ctrl_end                        :   IN    std_logic;
          ctrl_valid                      :   IN    std_logic;
          varargout_1_0                   :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          varargout_1_1                   :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          varargout_1_2                   :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          varargout_2                     :   OUT   std_logic;
          varargout_3                     :   OUT   std_logic;
          varargout_4                     :   OUT   std_logic;
          varargout_5                     :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ConvolutionalDecoderMetricComputer
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          varargout_1_0                   :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          varargout_1_1                   :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          varargout_1_2                   :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          varargout_2                     :   IN    std_logic;
          varargout_3                     :   IN    std_logic;
          varargout_4                     :   IN    std_logic;
          varargout_1_0_1                 :   OUT   std_logic;
          varargout_1_1_1                 :   OUT   std_logic;
          varargout_1_2_1                 :   OUT   std_logic;
          varargout_1_3                   :   OUT   std_logic;
          varargout_1_4                   :   OUT   std_logic;
          varargout_1_5                   :   OUT   std_logic;
          varargout_1_6                   :   OUT   std_logic;
          varargout_1_7                   :   OUT   std_logic;
          varargout_1_8                   :   OUT   std_logic;
          varargout_1_9                   :   OUT   std_logic;
          varargout_1_10                  :   OUT   std_logic;
          varargout_1_11                  :   OUT   std_logic;
          varargout_1_12                  :   OUT   std_logic;
          varargout_1_13                  :   OUT   std_logic;
          varargout_1_14                  :   OUT   std_logic;
          varargout_1_15                  :   OUT   std_logic;
          varargout_1_16                  :   OUT   std_logic;
          varargout_1_17                  :   OUT   std_logic;
          varargout_1_18                  :   OUT   std_logic;
          varargout_1_19                  :   OUT   std_logic;
          varargout_1_20                  :   OUT   std_logic;
          varargout_1_21                  :   OUT   std_logic;
          varargout_1_22                  :   OUT   std_logic;
          varargout_1_23                  :   OUT   std_logic;
          varargout_1_24                  :   OUT   std_logic;
          varargout_1_25                  :   OUT   std_logic;
          varargout_1_26                  :   OUT   std_logic;
          varargout_1_27                  :   OUT   std_logic;
          varargout_1_28                  :   OUT   std_logic;
          varargout_1_29                  :   OUT   std_logic;
          varargout_1_30                  :   OUT   std_logic;
          varargout_1_31                  :   OUT   std_logic;
          varargout_1_32                  :   OUT   std_logic;
          varargout_1_33                  :   OUT   std_logic;
          varargout_1_34                  :   OUT   std_logic;
          varargout_1_35                  :   OUT   std_logic;
          varargout_1_36                  :   OUT   std_logic;
          varargout_1_37                  :   OUT   std_logic;
          varargout_1_38                  :   OUT   std_logic;
          varargout_1_39                  :   OUT   std_logic;
          varargout_1_40                  :   OUT   std_logic;
          varargout_1_41                  :   OUT   std_logic;
          varargout_1_42                  :   OUT   std_logic;
          varargout_1_43                  :   OUT   std_logic;
          varargout_1_44                  :   OUT   std_logic;
          varargout_1_45                  :   OUT   std_logic;
          varargout_1_46                  :   OUT   std_logic;
          varargout_1_47                  :   OUT   std_logic;
          varargout_1_48                  :   OUT   std_logic;
          varargout_1_49                  :   OUT   std_logic;
          varargout_1_50                  :   OUT   std_logic;
          varargout_1_51                  :   OUT   std_logic;
          varargout_1_52                  :   OUT   std_logic;
          varargout_1_53                  :   OUT   std_logic;
          varargout_1_54                  :   OUT   std_logic;
          varargout_1_55                  :   OUT   std_logic;
          varargout_1_56                  :   OUT   std_logic;
          varargout_1_57                  :   OUT   std_logic;
          varargout_1_58                  :   OUT   std_logic;
          varargout_1_59                  :   OUT   std_logic;
          varargout_1_60                  :   OUT   std_logic;
          varargout_1_61                  :   OUT   std_logic;
          varargout_1_62                  :   OUT   std_logic;
          varargout_1_63                  :   OUT   std_logic;
          varargout_2_1                   :   OUT   std_logic;
          varargout_3_1                   :   OUT   std_logic;
          varargout_4_1                   :   OUT   std_logic;
          varargout_5                     :   OUT   std_logic_vector(5 DOWNTO 0);  -- ufix6
          varargout_6                     :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ConvolutionalDecoderTracebackUnit
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          varargout_1_0                   :   IN    std_logic;
          varargout_1_1                   :   IN    std_logic;
          varargout_1_2                   :   IN    std_logic;
          varargout_1_3                   :   IN    std_logic;
          varargout_1_4                   :   IN    std_logic;
          varargout_1_5                   :   IN    std_logic;
          varargout_1_6                   :   IN    std_logic;
          varargout_1_7                   :   IN    std_logic;
          varargout_1_8                   :   IN    std_logic;
          varargout_1_9                   :   IN    std_logic;
          varargout_1_10                  :   IN    std_logic;
          varargout_1_11                  :   IN    std_logic;
          varargout_1_12                  :   IN    std_logic;
          varargout_1_13                  :   IN    std_logic;
          varargout_1_14                  :   IN    std_logic;
          varargout_1_15                  :   IN    std_logic;
          varargout_1_16                  :   IN    std_logic;
          varargout_1_17                  :   IN    std_logic;
          varargout_1_18                  :   IN    std_logic;
          varargout_1_19                  :   IN    std_logic;
          varargout_1_20                  :   IN    std_logic;
          varargout_1_21                  :   IN    std_logic;
          varargout_1_22                  :   IN    std_logic;
          varargout_1_23                  :   IN    std_logic;
          varargout_1_24                  :   IN    std_logic;
          varargout_1_25                  :   IN    std_logic;
          varargout_1_26                  :   IN    std_logic;
          varargout_1_27                  :   IN    std_logic;
          varargout_1_28                  :   IN    std_logic;
          varargout_1_29                  :   IN    std_logic;
          varargout_1_30                  :   IN    std_logic;
          varargout_1_31                  :   IN    std_logic;
          varargout_1_32                  :   IN    std_logic;
          varargout_1_33                  :   IN    std_logic;
          varargout_1_34                  :   IN    std_logic;
          varargout_1_35                  :   IN    std_logic;
          varargout_1_36                  :   IN    std_logic;
          varargout_1_37                  :   IN    std_logic;
          varargout_1_38                  :   IN    std_logic;
          varargout_1_39                  :   IN    std_logic;
          varargout_1_40                  :   IN    std_logic;
          varargout_1_41                  :   IN    std_logic;
          varargout_1_42                  :   IN    std_logic;
          varargout_1_43                  :   IN    std_logic;
          varargout_1_44                  :   IN    std_logic;
          varargout_1_45                  :   IN    std_logic;
          varargout_1_46                  :   IN    std_logic;
          varargout_1_47                  :   IN    std_logic;
          varargout_1_48                  :   IN    std_logic;
          varargout_1_49                  :   IN    std_logic;
          varargout_1_50                  :   IN    std_logic;
          varargout_1_51                  :   IN    std_logic;
          varargout_1_52                  :   IN    std_logic;
          varargout_1_53                  :   IN    std_logic;
          varargout_1_54                  :   IN    std_logic;
          varargout_1_55                  :   IN    std_logic;
          varargout_1_56                  :   IN    std_logic;
          varargout_1_57                  :   IN    std_logic;
          varargout_1_58                  :   IN    std_logic;
          varargout_1_59                  :   IN    std_logic;
          varargout_1_60                  :   IN    std_logic;
          varargout_1_61                  :   IN    std_logic;
          varargout_1_62                  :   IN    std_logic;
          varargout_1_63                  :   IN    std_logic;
          varargout_2                     :   IN    std_logic;
          varargout_3                     :   IN    std_logic;
          varargout_4                     :   IN    std_logic;
          varargout_5                     :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
          varargout_6                     :   IN    std_logic;
          extEndMsgDelayed                :   IN    std_logic;
          varargout_1                     :   OUT   std_logic;
          varargout_2_1                   :   OUT   std_logic;
          varargout_3_1                   :   OUT   std_logic;
          varargout_4_1                   :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ConvolutionalDecoderMessageExtender
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ConvolutionalDecoderMessageExtender(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ConvolutionalDecoderMetricComputer
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ConvolutionalDecoderMetricComputer(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ConvolutionalDecoderTracebackUnit
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ConvolutionalDecoderTracebackUnit(rtl);

  -- Signals
  SIGNAL varargout_1_0                    : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL varargout_1_1                    : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL varargout_1_2                    : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL varargout_2                      : std_logic;
  SIGNAL varargout_3                      : std_logic;
  SIGNAL varargout_4                      : std_logic;
  SIGNAL varargout_5                      : std_logic;
  SIGNAL varargout_1_0_1                  : std_logic;
  SIGNAL varargout_1_1_1                  : std_logic;
  SIGNAL varargout_1_2_1                  : std_logic;
  SIGNAL varargout_1_3                    : std_logic;
  SIGNAL varargout_1_4                    : std_logic;
  SIGNAL varargout_1_5                    : std_logic;
  SIGNAL varargout_1_6                    : std_logic;
  SIGNAL varargout_1_7                    : std_logic;
  SIGNAL varargout_1_8                    : std_logic;
  SIGNAL varargout_1_9                    : std_logic;
  SIGNAL varargout_1_10                   : std_logic;
  SIGNAL varargout_1_11                   : std_logic;
  SIGNAL varargout_1_12                   : std_logic;
  SIGNAL varargout_1_13                   : std_logic;
  SIGNAL varargout_1_14                   : std_logic;
  SIGNAL varargout_1_15                   : std_logic;
  SIGNAL varargout_1_16                   : std_logic;
  SIGNAL varargout_1_17                   : std_logic;
  SIGNAL varargout_1_18                   : std_logic;
  SIGNAL varargout_1_19                   : std_logic;
  SIGNAL varargout_1_20                   : std_logic;
  SIGNAL varargout_1_21                   : std_logic;
  SIGNAL varargout_1_22                   : std_logic;
  SIGNAL varargout_1_23                   : std_logic;
  SIGNAL varargout_1_24                   : std_logic;
  SIGNAL varargout_1_25                   : std_logic;
  SIGNAL varargout_1_26                   : std_logic;
  SIGNAL varargout_1_27                   : std_logic;
  SIGNAL varargout_1_28                   : std_logic;
  SIGNAL varargout_1_29                   : std_logic;
  SIGNAL varargout_1_30                   : std_logic;
  SIGNAL varargout_1_31                   : std_logic;
  SIGNAL varargout_1_32                   : std_logic;
  SIGNAL varargout_1_33                   : std_logic;
  SIGNAL varargout_1_34                   : std_logic;
  SIGNAL varargout_1_35                   : std_logic;
  SIGNAL varargout_1_36                   : std_logic;
  SIGNAL varargout_1_37                   : std_logic;
  SIGNAL varargout_1_38                   : std_logic;
  SIGNAL varargout_1_39                   : std_logic;
  SIGNAL varargout_1_40                   : std_logic;
  SIGNAL varargout_1_41                   : std_logic;
  SIGNAL varargout_1_42                   : std_logic;
  SIGNAL varargout_1_43                   : std_logic;
  SIGNAL varargout_1_44                   : std_logic;
  SIGNAL varargout_1_45                   : std_logic;
  SIGNAL varargout_1_46                   : std_logic;
  SIGNAL varargout_1_47                   : std_logic;
  SIGNAL varargout_1_48                   : std_logic;
  SIGNAL varargout_1_49                   : std_logic;
  SIGNAL varargout_1_50                   : std_logic;
  SIGNAL varargout_1_51                   : std_logic;
  SIGNAL varargout_1_52                   : std_logic;
  SIGNAL varargout_1_53                   : std_logic;
  SIGNAL varargout_1_54                   : std_logic;
  SIGNAL varargout_1_55                   : std_logic;
  SIGNAL varargout_1_56                   : std_logic;
  SIGNAL varargout_1_57                   : std_logic;
  SIGNAL varargout_1_58                   : std_logic;
  SIGNAL varargout_1_59                   : std_logic;
  SIGNAL varargout_1_60                   : std_logic;
  SIGNAL varargout_1_61                   : std_logic;
  SIGNAL varargout_1_62                   : std_logic;
  SIGNAL varargout_1_63                   : std_logic;
  SIGNAL varargout_2_1                    : std_logic;
  SIGNAL varargout_3_1                    : std_logic;
  SIGNAL varargout_4_1                    : std_logic;
  SIGNAL varargout_5_1                    : std_logic_vector(5 DOWNTO 0);  -- ufix6
  SIGNAL varargout_6                      : std_logic;
  SIGNAL dsp_Delay_reg                    : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL extEndMsgDelayed                 : std_logic;
  SIGNAL varargout_1                      : std_logic;
  SIGNAL varargout_2_2                    : std_logic;
  SIGNAL varargout_3_2                    : std_logic;
  SIGNAL varargout_4_2                    : std_logic;
  SIGNAL obj_dataOut                      : std_logic;
  SIGNAL tmp                              : std_logic;
  SIGNAL obj_dataOut_1                    : std_logic;
  SIGNAL obj_ctrlOut_start                : std_logic;
  SIGNAL obj_ctrlOut_end                  : std_logic;
  SIGNAL obj_ctrlOut_valid                : std_logic;

BEGIN
  u_ConvolutionalDecoderMessageExtender : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ConvolutionalDecoderMessageExtender
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data_0 => data_0,  -- ufix4
              data_1 => data_1,  -- ufix4
              data_2 => data_2,  -- ufix4
              ctrl_start => ctrl_start,
              ctrl_end => ctrl_end,
              ctrl_valid => ctrl_valid,
              varargout_1_0 => varargout_1_0,  -- ufix4
              varargout_1_1 => varargout_1_1,  -- ufix4
              varargout_1_2 => varargout_1_2,  -- ufix4
              varargout_2 => varargout_2,
              varargout_3 => varargout_3,
              varargout_4 => varargout_4,
              varargout_5 => varargout_5
              );

  u_ConvolutionalDecoderMetricComputer : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ConvolutionalDecoderMetricComputer
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              varargout_1_0 => varargout_1_0,  -- ufix4
              varargout_1_1 => varargout_1_1,  -- ufix4
              varargout_1_2 => varargout_1_2,  -- ufix4
              varargout_2 => varargout_2,
              varargout_3 => varargout_3,
              varargout_4 => varargout_4,
              varargout_1_0_1 => varargout_1_0_1,
              varargout_1_1_1 => varargout_1_1_1,
              varargout_1_2_1 => varargout_1_2_1,
              varargout_1_3 => varargout_1_3,
              varargout_1_4 => varargout_1_4,
              varargout_1_5 => varargout_1_5,
              varargout_1_6 => varargout_1_6,
              varargout_1_7 => varargout_1_7,
              varargout_1_8 => varargout_1_8,
              varargout_1_9 => varargout_1_9,
              varargout_1_10 => varargout_1_10,
              varargout_1_11 => varargout_1_11,
              varargout_1_12 => varargout_1_12,
              varargout_1_13 => varargout_1_13,
              varargout_1_14 => varargout_1_14,
              varargout_1_15 => varargout_1_15,
              varargout_1_16 => varargout_1_16,
              varargout_1_17 => varargout_1_17,
              varargout_1_18 => varargout_1_18,
              varargout_1_19 => varargout_1_19,
              varargout_1_20 => varargout_1_20,
              varargout_1_21 => varargout_1_21,
              varargout_1_22 => varargout_1_22,
              varargout_1_23 => varargout_1_23,
              varargout_1_24 => varargout_1_24,
              varargout_1_25 => varargout_1_25,
              varargout_1_26 => varargout_1_26,
              varargout_1_27 => varargout_1_27,
              varargout_1_28 => varargout_1_28,
              varargout_1_29 => varargout_1_29,
              varargout_1_30 => varargout_1_30,
              varargout_1_31 => varargout_1_31,
              varargout_1_32 => varargout_1_32,
              varargout_1_33 => varargout_1_33,
              varargout_1_34 => varargout_1_34,
              varargout_1_35 => varargout_1_35,
              varargout_1_36 => varargout_1_36,
              varargout_1_37 => varargout_1_37,
              varargout_1_38 => varargout_1_38,
              varargout_1_39 => varargout_1_39,
              varargout_1_40 => varargout_1_40,
              varargout_1_41 => varargout_1_41,
              varargout_1_42 => varargout_1_42,
              varargout_1_43 => varargout_1_43,
              varargout_1_44 => varargout_1_44,
              varargout_1_45 => varargout_1_45,
              varargout_1_46 => varargout_1_46,
              varargout_1_47 => varargout_1_47,
              varargout_1_48 => varargout_1_48,
              varargout_1_49 => varargout_1_49,
              varargout_1_50 => varargout_1_50,
              varargout_1_51 => varargout_1_51,
              varargout_1_52 => varargout_1_52,
              varargout_1_53 => varargout_1_53,
              varargout_1_54 => varargout_1_54,
              varargout_1_55 => varargout_1_55,
              varargout_1_56 => varargout_1_56,
              varargout_1_57 => varargout_1_57,
              varargout_1_58 => varargout_1_58,
              varargout_1_59 => varargout_1_59,
              varargout_1_60 => varargout_1_60,
              varargout_1_61 => varargout_1_61,
              varargout_1_62 => varargout_1_62,
              varargout_1_63 => varargout_1_63,
              varargout_2_1 => varargout_2_1,
              varargout_3_1 => varargout_3_1,
              varargout_4_1 => varargout_4_1,
              varargout_5 => varargout_5_1,  -- ufix6
              varargout_6 => varargout_6
              );

  -- HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp8
  u_ConvolutionalDecoderTracebackUnit : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ConvolutionalDecoderTracebackUnit
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              varargout_1_0 => varargout_1_0_1,
              varargout_1_1 => varargout_1_1_1,
              varargout_1_2 => varargout_1_2_1,
              varargout_1_3 => varargout_1_3,
              varargout_1_4 => varargout_1_4,
              varargout_1_5 => varargout_1_5,
              varargout_1_6 => varargout_1_6,
              varargout_1_7 => varargout_1_7,
              varargout_1_8 => varargout_1_8,
              varargout_1_9 => varargout_1_9,
              varargout_1_10 => varargout_1_10,
              varargout_1_11 => varargout_1_11,
              varargout_1_12 => varargout_1_12,
              varargout_1_13 => varargout_1_13,
              varargout_1_14 => varargout_1_14,
              varargout_1_15 => varargout_1_15,
              varargout_1_16 => varargout_1_16,
              varargout_1_17 => varargout_1_17,
              varargout_1_18 => varargout_1_18,
              varargout_1_19 => varargout_1_19,
              varargout_1_20 => varargout_1_20,
              varargout_1_21 => varargout_1_21,
              varargout_1_22 => varargout_1_22,
              varargout_1_23 => varargout_1_23,
              varargout_1_24 => varargout_1_24,
              varargout_1_25 => varargout_1_25,
              varargout_1_26 => varargout_1_26,
              varargout_1_27 => varargout_1_27,
              varargout_1_28 => varargout_1_28,
              varargout_1_29 => varargout_1_29,
              varargout_1_30 => varargout_1_30,
              varargout_1_31 => varargout_1_31,
              varargout_1_32 => varargout_1_32,
              varargout_1_33 => varargout_1_33,
              varargout_1_34 => varargout_1_34,
              varargout_1_35 => varargout_1_35,
              varargout_1_36 => varargout_1_36,
              varargout_1_37 => varargout_1_37,
              varargout_1_38 => varargout_1_38,
              varargout_1_39 => varargout_1_39,
              varargout_1_40 => varargout_1_40,
              varargout_1_41 => varargout_1_41,
              varargout_1_42 => varargout_1_42,
              varargout_1_43 => varargout_1_43,
              varargout_1_44 => varargout_1_44,
              varargout_1_45 => varargout_1_45,
              varargout_1_46 => varargout_1_46,
              varargout_1_47 => varargout_1_47,
              varargout_1_48 => varargout_1_48,
              varargout_1_49 => varargout_1_49,
              varargout_1_50 => varargout_1_50,
              varargout_1_51 => varargout_1_51,
              varargout_1_52 => varargout_1_52,
              varargout_1_53 => varargout_1_53,
              varargout_1_54 => varargout_1_54,
              varargout_1_55 => varargout_1_55,
              varargout_1_56 => varargout_1_56,
              varargout_1_57 => varargout_1_57,
              varargout_1_58 => varargout_1_58,
              varargout_1_59 => varargout_1_59,
              varargout_1_60 => varargout_1_60,
              varargout_1_61 => varargout_1_61,
              varargout_1_62 => varargout_1_62,
              varargout_1_63 => varargout_1_63,
              varargout_2 => varargout_2_1,
              varargout_3 => varargout_3_1,
              varargout_4 => varargout_4_1,
              varargout_5 => varargout_5_1,  -- ufix6
              varargout_6 => varargout_6,
              extEndMsgDelayed => extEndMsgDelayed,
              varargout_1 => varargout_1,
              varargout_2_1 => varargout_2_2,
              varargout_3_1 => varargout_3_2,
              varargout_4_1 => varargout_4_2
              );

  dsp_Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dsp_Delay_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        dsp_Delay_reg(0) <= varargout_5;
        dsp_Delay_reg(1 TO 2) <= dsp_Delay_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS dsp_Delay_process;

  extEndMsgDelayed <= dsp_Delay_reg(2);

  -- HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp8
  obj_dataOut <= '0';

  
  tmp <= obj_dataOut WHEN varargout_4_2 = '0' ELSE
      varargout_1;

  obj_dataOut_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_dataOut_1 <= '0';
      ELSIF enb = '1' THEN
        obj_dataOut_1 <= tmp;
      END IF;
    END IF;
  END PROCESS obj_dataOut_reg_process;


  obj_ctrlOut_start_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_ctrlOut_start <= '0';
      ELSIF enb = '1' THEN
        obj_ctrlOut_start <= varargout_2_2;
      END IF;
    END IF;
  END PROCESS obj_ctrlOut_start_reg_process;


  obj_ctrlOut_end_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_ctrlOut_end <= '0';
      ELSIF enb = '1' THEN
        obj_ctrlOut_end <= varargout_3_2;
      END IF;
    END IF;
  END PROCESS obj_ctrlOut_end_reg_process;


  obj_ctrlOut_valid_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_ctrlOut_valid <= '0';
      ELSIF enb = '1' THEN
        obj_ctrlOut_valid <= varargout_4_2;
      END IF;
    END IF;
  END PROCESS obj_ctrlOut_valid_reg_process;


  -- HDL code generation from MATLAB function: SystemCore_stepImpl
  data1 <= obj_dataOut_1;

  ctrl1_start <= obj_ctrlOut_start;

  ctrl1_end <= obj_ctrlOut_end;

  ctrl1_valid <= obj_ctrlOut_valid;

END rtl;

