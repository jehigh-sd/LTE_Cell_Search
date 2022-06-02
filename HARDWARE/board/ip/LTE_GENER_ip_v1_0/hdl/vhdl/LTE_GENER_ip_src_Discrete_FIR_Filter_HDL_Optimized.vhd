-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2\LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized.vhd
-- Created: 2022-05-23 17:12:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized
-- Source Path: zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2/LTE_GENERATOR/LTE_Generator/Vector Interpolator/FIR_Vector_Interp/Discrete 
-- FIR Filter HDL Optimize
-- Hierarchy Level: 4
-- 
-- Discrete FIR Filter
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        validIn                           :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        validOut                          :   OUT   std_logic
        );
END LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized;


ARCHITECTURE rtl OF LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized IS

  -- Component Declarations
  COMPONENT LTE_GENER_ip_src_Filter
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          validIn                         :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_GENER_ip_src_Filter
    USE ENTITY work.LTE_GENER_ip_src_Filter(rtl);

  -- Signals
  SIGNAL syncReset                        : std_logic;
  SIGNAL dataOut_re_tmp                   : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dataOut_im_tmp                   : std_logic_vector(15 DOWNTO 0);  -- ufix16

BEGIN
  u_FilterBank : LTE_GENER_ip_src_Filter
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => dataIn_re,  -- int16
              dataIn_im => dataIn_im,  -- int16
              validIn => validIn,
              syncReset => syncReset,
              dataOut_re => dataOut_re_tmp,  -- int16
              dataOut_im => dataOut_im_tmp,  -- int16
              validOut => validOut
              );

  syncReset <= '0';

  dataOut_re <= dataOut_re_tmp;

  dataOut_im <= dataOut_im_tmp;

END rtl;
