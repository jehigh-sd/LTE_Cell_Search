-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CIC_Compensation_Decimator.vhd
-- Created: 2022-05-23 17:26:43
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CIC_Compensation_Decimator
-- Source Path: ltehdlDownlinkSyncDemod/Decimation Filters/CIC Compensation Decimator
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlDownlinkSyncDemod;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CIC_Compensation_Decimator IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validIn                           :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validOut                          :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CIC_Compensation_Decimator;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CIC_Compensation_Decimator IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Discrete_FIR_Filter
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Decimator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Discrete_FIR_Filter
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Discrete_FIR_Filter(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Decimator
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Decimator(rtl);

  -- Signals
  SIGNAL Discrete_FIR_Filter_out1_re      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_out1_im      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_out2         : std_logic;
  SIGNAL dataOut_re_1                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dataOut_im_1                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL validOut_1                       : std_logic;
  SIGNAL dataOut_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataOut_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay2_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay2_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay1_out1                      : std_logic;

BEGIN
  -- Note that this subsystem has an overflow warning suppressed programmatically in it's InitFcn callback.

  u_Discrete_FIR_Filter : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Discrete_FIR_Filter
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => dataIn_re,  -- ufix16
              dataIn_im => dataIn_im,  -- ufix16
              validIn => validIn,
              dataOut_re => Discrete_FIR_Filter_out1_re,  -- ufix16
              dataOut_im => Discrete_FIR_Filter_out1_im,  -- ufix16
              validOut => Discrete_FIR_Filter_out2
              );

  u_Decimator : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Decimator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => Discrete_FIR_Filter_out1_re,  -- sfix16_En15
              dataIn_im => Discrete_FIR_Filter_out1_im,  -- sfix16_En15
              validIn => Discrete_FIR_Filter_out2,
              dataOut_re => dataOut_re_1,  -- sfix16_En15
              dataOut_im => dataOut_im_1,  -- sfix16_En15
              validOut => validOut_1
              );

  dataOut_re_signed <= signed(dataOut_re_1);

  dataOut_im_signed <= signed(dataOut_im_1);

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1_re <= to_signed(16#0000#, 16);
        Delay2_out1_im <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay2_out1_re <= dataOut_re_signed;
        Delay2_out1_im <= dataOut_im_signed;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  dataOut_re <= std_logic_vector(Delay2_out1_re);

  dataOut_im <= std_logic_vector(Delay2_out1_im);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay1_out1 <= validOut_1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  validOut <= Delay1_out1;

END rtl;

