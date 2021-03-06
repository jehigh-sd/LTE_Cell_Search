-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlPBCHDecoder\LTE_MIB_H_ip_src_ltehdlPBCHDecoder_controlbusGen.vhd
-- Created: 2022-05-23 17:26:45
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlPBCHDecoder_controlbusGen
-- Source Path: ltehdlPBCHDecoder/BCH Decoder/controlbusGen
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlPBCHDecoder;

ENTITY LTE_MIB_H_ip_src_ltehdlPBCHDecoder_controlbusGen IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        In1                               :   IN    std_logic;
        Out1_start                        :   OUT   std_logic;  -- record {boolean,boolean,boolean}
        Out1_end                          :   OUT   std_logic;  -- record {boolean,boolean,boolean}
        Out1_valid                        :   OUT   std_logic  -- record {boolean,boolean,boolean}
        );
END LTE_MIB_H_ip_src_ltehdlPBCHDecoder_controlbusGen;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlPBCHDecoder_controlbusGen IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Sample_Control_Bus_Creator
    PORT( In1                             :   IN    std_logic;
          In2                             :   IN    std_logic;
          In3                             :   IN    std_logic;
          Out1_start                      :   OUT   std_logic;  -- record {boolean,boolean,boolean}
          Out1_end                        :   OUT   std_logic;  -- record {boolean,boolean,boolean}
          Out1_valid                      :   OUT   std_logic  -- record {boolean,boolean,boolean}
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Sample_Control_Bus_Creator
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Sample_Control_Bus_Creator(rtl);

  -- Signals
  SIGNAL count_step                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_from                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL HDL_Counter2_out1                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count                            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL need_to_wrap                     : std_logic;
  SIGNAL count_value                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_1                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Compare_To_Constant4_out1        : std_logic;
  SIGNAL Logical_Operator5_out1           : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_start : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_end : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_valid : std_logic;

BEGIN
  u_Sample_Control_Bus_Creator : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Sample_Control_Bus_Creator
    PORT MAP( In1 => Logical_Operator1_out1,
              In2 => Logical_Operator5_out1,
              In3 => In1,
              Out1_start => Sample_Control_Bus_Creator_out1_start,  -- record {boolean,boolean,boolean}
              Out1_end => Sample_Control_Bus_Creator_out1_end,  -- record {boolean,boolean,boolean}
              Out1_valid => Sample_Control_Bus_Creator_out1_valid  -- record {boolean,boolean,boolean}
              );

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 39
  count_step <= to_unsigned(16#01#, 8);

  count_from <= to_unsigned(16#00#, 8);

  count <= HDL_Counter2_out1 + count_step;

  
  need_to_wrap <= '1' WHEN HDL_Counter2_out1 = to_unsigned(16#27#, 8) ELSE
      '0';

  
  count_value <= count WHEN need_to_wrap = '0' ELSE
      count_from;

  
  count_1 <= HDL_Counter2_out1 WHEN In1 = '0' ELSE
      count_value;

  HDL_Counter2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HDL_Counter2_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        HDL_Counter2_out1 <= count_1;
      END IF;
    END IF;
  END PROCESS HDL_Counter2_process;


  
  Compare_To_Constant1_out1 <= '1' WHEN HDL_Counter2_out1 = to_unsigned(16#00#, 8) ELSE
      '0';

  Logical_Operator1_out1 <= In1 AND Compare_To_Constant1_out1;

  
  Compare_To_Constant4_out1 <= '1' WHEN HDL_Counter2_out1 = to_unsigned(16#27#, 8) ELSE
      '0';

  Logical_Operator5_out1 <= In1 AND Compare_To_Constant4_out1;

  Out1_start <= Sample_Control_Bus_Creator_out1_start;

  Out1_end <= Sample_Control_Bus_Creator_out1_end;

  Out1_valid <= Sample_Control_Bus_Creator_out1_valid;

END rtl;

