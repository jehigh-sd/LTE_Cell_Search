-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_ThresholdLimiter.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_ThresholdLimiter
-- Source Path: ltehdlDownlinkSyncDemod/Sync Signal Search/PSS Searcher/Correlators/ThresholdLimiter
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_ThresholdLimiter IS
  PORT( x                                 :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30
        y                                 :   OUT   std_logic_vector(29 DOWNTO 0)  -- ufix30_En24
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_ThresholdLimiter;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_ThresholdLimiter IS

  -- Signals
  SIGNAL x_unsigned                       : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL y_tmp                            : unsigned(29 DOWNTO 0);  -- ufix30_En24

BEGIN
  x_unsigned <= unsigned(x);

  -- Apply a lower limit to the threshold.
  -- Threshold is computed by summing across 128 samples.
  -- Set lower limit to be equivalent of all 128 samples
  -- having their LSB set to 1 and all others set to 0. 
  
  y_tmp <= to_unsigned(16#00000080#, 30) WHEN x_unsigned < to_unsigned(16#00000080#, 30) ELSE
      x_unsigned;

  y <= std_logic_vector(y_tmp);

END rtl;
