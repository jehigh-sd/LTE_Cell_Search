-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlPBCHIndexing\LTE_MIB_H_ip_src_ltehdlPBCHIndexing_enbGen.vhd
-- Created: 2022-05-23 17:26:45
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlPBCHIndexing_enbGen
-- Source Path: ltehdlPBCHIndexing/PBCHIndGen/enbGen
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlPBCHIndexing_enbGen IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        start                             :   IN    std_logic;
        enb_1                             :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlPBCHIndexing_enbGen;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlPBCHIndexing_enbGen IS

  -- Signals
  SIGNAL count_step                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_from                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_reset                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL HDL_Counter_out1                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL count                            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL need_to_wrap                     : std_logic;
  SIGNAL count_value                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL count_1                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_2                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;

BEGIN
  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 239
  count_step <= to_unsigned(16#01#, 8);

  count_from <= to_unsigned(16#00#, 8);

  count_reset <= to_unsigned(16#00#, 8);

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay_out1 <= start;
      END IF;
    END IF;
  END PROCESS Delay_process;


  
  Compare_To_Constant1_out1 <= '1' WHEN HDL_Counter_out1 < to_unsigned(16#F0#, 8) ELSE
      '0';

  count <= HDL_Counter_out1 + count_step;

  
  need_to_wrap <= '1' WHEN HDL_Counter_out1 = to_unsigned(16#EF#, 8) ELSE
      '0';

  
  count_value <= count WHEN need_to_wrap = '0' ELSE
      count_from;

  
  count_1 <= HDL_Counter_out1 WHEN Logical_Operator_out1 = '0' ELSE
      count_value;

  
  count_2 <= count_1 WHEN start = '0' ELSE
      count_reset;

  HDL_Counter_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HDL_Counter_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0 = '1' THEN
        HDL_Counter_out1 <= count_2;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  
  Compare_To_Constant_out1 <= '1' WHEN HDL_Counter_out1 > to_unsigned(16#00#, 8) ELSE
      '0';

  Logical_Operator1_out1 <= Compare_To_Constant_out1 AND Compare_To_Constant1_out1;

  Logical_Operator_out1 <= Logical_Operator1_out1 OR Delay_out1;

  enb_1 <= Logical_Operator_out1;

END rtl;

