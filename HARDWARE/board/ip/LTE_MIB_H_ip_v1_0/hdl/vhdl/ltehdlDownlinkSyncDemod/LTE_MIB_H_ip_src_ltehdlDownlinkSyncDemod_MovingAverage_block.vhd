-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage_block.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage_block
-- Source Path: ltehdlDownlinkSyncDemod/Sync Signal Search/PSS Searcher/Correlators/MovingAverage
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlDownlinkSyncDemod;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage_block IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn                            :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En30
        validIn                           :   IN    std_logic;
        dataOut                           :   OUT   std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
        validOut                          :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage_block;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage_block IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Synchronous_Enabled_128_Sample_Delay
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn                          :   IN    std_logic_vector(36 DOWNTO 0);  -- ufix37_En30
          en                              :   IN    std_logic;
          dataOut                         :   OUT   std_logic_vector(36 DOWNTO 0)  -- ufix37_En30
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Synchronous_Enabled_128_Sample_Delay
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Synchronous_Enabled_128_Sample_Delay(rtl);

  -- Signals
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL dataIn_unsigned                  : unsigned(29 DOWNTO 0);  -- ufix30_En30
  SIGNAL Data_Type_Conversion_out1        : unsigned(36 DOWNTO 0);  -- ufix37_En30
  SIGNAL Synchronous_Enabled_128_Sample_Delay_out1 : std_logic_vector(36 DOWNTO 0);  -- ufix37
  SIGNAL Synchronous_Enabled_128_Sample_Delay_out1_unsigned : unsigned(36 DOWNTO 0);  -- ufix37_En30
  SIGNAL Add_out1                         : unsigned(36 DOWNTO 0);  -- ufix37_En30
  SIGNAL Delay12_out1                     : unsigned(36 DOWNTO 0);  -- ufix37_En30
  SIGNAL Synchronous_Enabled_Unit_Delay_out1 : unsigned(36 DOWNTO 0);  -- ufix37_En30
  SIGNAL Add1_out1                        : unsigned(36 DOWNTO 0);  -- ufix37_En30
  SIGNAL Synchronous_Enabled_Unit_Delay_ectrl : unsigned(36 DOWNTO 0);  -- ufix37_En30
  SIGNAL Data_Type_Conversion1_out1       : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL Delay5_out1                      : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL Delay6_out1                      : std_logic;

BEGIN
  -- Sum across a window of 128 samples using a comb filter followed by an integrator.

  u_Synchronous_Enabled_128_Sample_Delay : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Synchronous_Enabled_128_Sample_Delay
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn => std_logic_vector(Data_Type_Conversion_out1),  -- ufix37_En30
              en => validIn,
              dataOut => Synchronous_Enabled_128_Sample_Delay_out1  -- ufix37_En30
              );

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay3_out1 <= validIn;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  dataIn_unsigned <= unsigned(dataIn);

  Data_Type_Conversion_out1 <= resize(dataIn_unsigned, 37);

  Synchronous_Enabled_128_Sample_Delay_out1_unsigned <= unsigned(Synchronous_Enabled_128_Sample_Delay_out1);

  Add_out1 <= Data_Type_Conversion_out1 - Synchronous_Enabled_128_Sample_Delay_out1_unsigned;

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_out1 <= to_unsigned(0, 37);
      ELSIF enb = '1' THEN
        Delay12_out1 <= Add_out1;
      END IF;
    END IF;
  END PROCESS Delay12_process;


  Add1_out1 <= Delay12_out1 + Synchronous_Enabled_Unit_Delay_out1;

  
  Synchronous_Enabled_Unit_Delay_ectrl <= Synchronous_Enabled_Unit_Delay_out1 WHEN Delay3_out1 = '0' ELSE
      Add1_out1;

  Synchronous_Enabled_Unit_Delay_lowered_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Synchronous_Enabled_Unit_Delay_out1 <= to_unsigned(0, 37);
      ELSIF enb = '1' THEN
        Synchronous_Enabled_Unit_Delay_out1 <= Synchronous_Enabled_Unit_Delay_ectrl;
      END IF;
    END IF;
  END PROCESS Synchronous_Enabled_Unit_Delay_lowered_process;


  Data_Type_Conversion1_out1 <= Synchronous_Enabled_Unit_Delay_out1(35 DOWNTO 6);

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1 <= to_unsigned(16#00000000#, 30);
      ELSIF enb = '1' THEN
        Delay5_out1 <= Data_Type_Conversion1_out1;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  dataOut <= std_logic_vector(Delay5_out1);

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay4_out1 <= Delay3_out1;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay6_out1 <= Delay4_out1;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  validOut <= Delay6_out1;

END rtl;

