-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_ltehdlDownlinkSyncDemod_pac.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_ltehdlDownlinkSyncDemod_pac IS
  TYPE vector_of_signed16 IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_signed24 IS ARRAY (NATURAL RANGE <>) OF signed(23 DOWNTO 0);
  TYPE vector_of_unsigned3 IS ARRAY (NATURAL RANGE <>) OF unsigned(2 DOWNTO 0);
  TYPE vector_of_signed18 IS ARRAY (NATURAL RANGE <>) OF signed(17 DOWNTO 0);
  TYPE vector_of_signed20 IS ARRAY (NATURAL RANGE <>) OF signed(19 DOWNTO 0);
  TYPE vector_of_signed22 IS ARRAY (NATURAL RANGE <>) OF signed(21 DOWNTO 0);
  TYPE vector_of_signed26 IS ARRAY (NATURAL RANGE <>) OF signed(25 DOWNTO 0);
  TYPE vector_of_unsigned37 IS ARRAY (NATURAL RANGE <>) OF unsigned(36 DOWNTO 0);
  TYPE vector_of_unsigned30 IS ARRAY (NATURAL RANGE <>) OF unsigned(29 DOWNTO 0);
  TYPE vector_of_signed36 IS ARRAY (NATURAL RANGE <>) OF signed(35 DOWNTO 0);
  TYPE vector_of_unsigned10 IS ARRAY (NATURAL RANGE <>) OF unsigned(9 DOWNTO 0);
  TYPE vector_of_signed2 IS ARRAY (NATURAL RANGE <>) OF signed(1 DOWNTO 0);
  TYPE vector_of_real IS ARRAY (NATURAL RANGE <>) OF real;
  TYPE vector_of_std_logic_vector30 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(29 DOWNTO 0);
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_ltehdlDownlinkSyncDemod_pac;

