-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlResourceGrid\LTE_MIB_H_ip_src_ltehdlResourceGrid_gridBankSelect.vhd
-- Created: 2022-05-23 17:26:46
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlResourceGrid_gridBankSelect
-- Source Path: ltehdlResourceGrid/Grid Memory Bank/gridBankSelect
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlResourceGrid;

ENTITY LTE_MIB_H_ip_src_ltehdlResourceGrid_gridBankSelect IS
  PORT( dataIn_re_0                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_1                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_2                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_3                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_4                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_5                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_6                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_7                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_8                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_9                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_10                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_11                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_12                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_re_13                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_0                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_1                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_2                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_3                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_4                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_5                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_6                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_7                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_8                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_9                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_10                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_11                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_12                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im_13                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        nbank                             :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        valid                             :   IN    std_logic;
        data_re                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        data_im                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        data_valid                        :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlResourceGrid_gridBankSelect;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlResourceGrid_gridBankSelect IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlResourceGrid_MATLAB_Function
    PORT( data_re_0                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_1                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_2                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_3                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_4                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_5                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_6                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_7                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_8                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_9                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_10                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_11                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_12                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_re_13                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_0                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_1                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_2                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_3                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_4                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_5                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_6                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_7                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_8                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_9                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_10                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_11                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_12                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im_13                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          bank_num                        :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          data_sel_re                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_sel_im                     :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlResourceGrid_MATLAB_Function
    USE ENTITY work_ltehdlResourceGrid.LTE_MIB_H_ip_src_ltehdlResourceGrid_MATLAB_Function(rtl);

  -- Signals
  SIGNAL data_sel_re                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL data_sel_im                      : std_logic_vector(15 DOWNTO 0);  -- ufix16

BEGIN
  u_MATLAB_Function : LTE_MIB_H_ip_src_ltehdlResourceGrid_MATLAB_Function
    PORT MAP( data_re_0 => dataIn_re_0,  -- sfix16_En15
              data_re_1 => dataIn_re_1,  -- sfix16_En15
              data_re_2 => dataIn_re_2,  -- sfix16_En15
              data_re_3 => dataIn_re_3,  -- sfix16_En15
              data_re_4 => dataIn_re_4,  -- sfix16_En15
              data_re_5 => dataIn_re_5,  -- sfix16_En15
              data_re_6 => dataIn_re_6,  -- sfix16_En15
              data_re_7 => dataIn_re_7,  -- sfix16_En15
              data_re_8 => dataIn_re_8,  -- sfix16_En15
              data_re_9 => dataIn_re_9,  -- sfix16_En15
              data_re_10 => dataIn_re_10,  -- sfix16_En15
              data_re_11 => dataIn_re_11,  -- sfix16_En15
              data_re_12 => dataIn_re_12,  -- sfix16_En15
              data_re_13 => dataIn_re_13,  -- sfix16_En15
              data_im_0 => dataIn_im_0,  -- sfix16_En15
              data_im_1 => dataIn_im_1,  -- sfix16_En15
              data_im_2 => dataIn_im_2,  -- sfix16_En15
              data_im_3 => dataIn_im_3,  -- sfix16_En15
              data_im_4 => dataIn_im_4,  -- sfix16_En15
              data_im_5 => dataIn_im_5,  -- sfix16_En15
              data_im_6 => dataIn_im_6,  -- sfix16_En15
              data_im_7 => dataIn_im_7,  -- sfix16_En15
              data_im_8 => dataIn_im_8,  -- sfix16_En15
              data_im_9 => dataIn_im_9,  -- sfix16_En15
              data_im_10 => dataIn_im_10,  -- sfix16_En15
              data_im_11 => dataIn_im_11,  -- sfix16_En15
              data_im_12 => dataIn_im_12,  -- sfix16_En15
              data_im_13 => dataIn_im_13,  -- sfix16_En15
              bank_num => nbank,  -- ufix4
              data_sel_re => data_sel_re,  -- sfix16_En15
              data_sel_im => data_sel_im  -- sfix16_En15
              );

  data_re <= data_sel_re;

  data_im <= data_sel_im;

  data_valid <= valid;

END rtl;

