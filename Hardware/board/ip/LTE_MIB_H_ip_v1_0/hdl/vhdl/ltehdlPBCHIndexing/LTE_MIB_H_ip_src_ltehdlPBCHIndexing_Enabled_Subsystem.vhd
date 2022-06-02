-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlPBCHIndexing\LTE_MIB_H_ip_src_ltehdlPBCHIndexing_Enabled_Subsystem.vhd
-- Created: 2022-05-23 17:26:45
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlPBCHIndexing_Enabled_Subsystem
-- Source Path: ltehdlPBCHIndexing/PBCHIndGen/Enabled Subsystem
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlPBCHIndexing_Enabled_Subsystem IS
  PORT( idxdata                           :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        seI                               :   IN    std_logic;
        adjustIdx                         :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
        );
END LTE_MIB_H_ip_src_ltehdlPBCHIndexing_Enabled_Subsystem;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlPBCHIndexing_Enabled_Subsystem IS

  -- Signals
  SIGNAL idxdata_unsigned                 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant4_out1                   : std_logic;
  SIGNAL Add_sub_cast                     : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Add_sub_cast_1                   : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Add_sub_temp                     : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Add_out1                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Multiport_Switch_out1            : unsigned(15 DOWNTO 0);  -- uint16

BEGIN
  idxdata_unsigned <= unsigned(idxdata);

  Constant4_out1 <= '1';

  Add_sub_cast <= signed(resize(idxdata_unsigned, 17));
  Add_sub_cast_1 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & Constant4_out1;
  Add_sub_temp <= Add_sub_cast - Add_sub_cast_1;
  Add_out1 <= unsigned(Add_sub_temp(15 DOWNTO 0));

  
  Multiport_Switch_out1 <= idxdata_unsigned WHEN seI = '0' ELSE
      Add_out1;

  adjustIdx <= std_logic_vector(Multiport_Switch_out1);

END rtl;

