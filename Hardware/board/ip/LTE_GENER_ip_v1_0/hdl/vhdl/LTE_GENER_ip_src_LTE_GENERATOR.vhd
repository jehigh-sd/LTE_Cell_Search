-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2\LTE_GENER_ip_src_LTE_GENERATOR.vhd
-- Created: 2022-05-23 17:12:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1.6276e-08
-- Target subsystem base rate: 1.6276e-08
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1.6276e-08
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- txDataOutI                    ce_out        1.6276e-08
-- txDataOutQ                    ce_out        1.6276e-08
-- txValidOutI                   ce_out        1.6276e-08
-- txValidOutQ                   ce_out        1.6276e-08
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_GENER_ip_src_LTE_GENERATOR
-- Source Path: zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2/LTE_GENERATOR
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_GENER_ip_src_LTE_GENERATOR IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        txready_I                         :   IN    std_logic;
        txready_Q                         :   IN    std_logic;
        testSelect_In                     :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
        ce_out                            :   OUT   std_logic;
        txDataOutI                        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        txDataOutQ                        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        txValidOutI                       :   OUT   std_logic;
        txValidOutQ                       :   OUT   std_logic
        );
END LTE_GENER_ip_src_LTE_GENERATOR;


ARCHITECTURE rtl OF LTE_GENER_ip_src_LTE_GENERATOR IS

  -- Component Declarations
  COMPONENT LTE_GENER_ip_src_LTE_GENERATOR_tc
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          enb                             :   OUT   std_logic;
          enb_1_1_1                       :   OUT   std_logic;
          enb_1_32_0                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_LTE_Generator_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          enb_1_1_1                       :   IN    std_logic;
          testSelect                      :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
          txDataOutI                      :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          txDataOutQ                      :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          txValidOutI                     :   OUT   std_logic;
          txValidOutQ                     :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_GENER_ip_src_LTE_GENERATOR_tc
    USE ENTITY work.LTE_GENER_ip_src_LTE_GENERATOR_tc(rtl);

  FOR ALL : LTE_GENER_ip_src_LTE_Generator_block
    USE ENTITY work.LTE_GENER_ip_src_LTE_Generator_block(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL enb_1_32_0                       : std_logic;
  SIGNAL enb_1_1_1                        : std_logic;
  SIGNAL packed_out                       : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL packed_out_1                     : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL LTE_Generator_out3               : std_logic;
  SIGNAL LTE_Generator_out4               : std_logic;

BEGIN
  u_LTE_GENERATOR_tc : LTE_GENER_ip_src_LTE_GENERATOR_tc
    PORT MAP( clk => clk,
              reset_x => reset_x,
              clk_enable => clk_enable,
              enb => enb,
              enb_1_1_1 => enb_1_1_1,
              enb_1_32_0 => enb_1_32_0
              );

  u_LTE_Generator : LTE_GENER_ip_src_LTE_Generator_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_32_0 => enb_1_32_0,
              enb_1_1_1 => enb_1_1_1,
              testSelect => testSelect_In,  -- int32
              txDataOutI => packed_out,  -- ufix128
              txDataOutQ => packed_out_1,  -- ufix128
              txValidOutI => LTE_Generator_out3,
              txValidOutQ => LTE_Generator_out4
              );

  ce_out <= enb_1_1_1;

  txDataOutI <= packed_out;

  txDataOutQ <= packed_out_1;

  txValidOutI <= LTE_Generator_out3;

  txValidOutQ <= LTE_Generator_out4;

END rtl;

