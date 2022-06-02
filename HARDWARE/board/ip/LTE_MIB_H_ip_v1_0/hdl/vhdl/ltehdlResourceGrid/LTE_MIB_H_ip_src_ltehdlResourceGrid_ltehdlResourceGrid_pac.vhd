-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlResourceGrid\LTE_MIB_H_ip_src_ltehdlResourceGrid_ltehdlResourceGrid_pac.vhd
-- Created: 2022-05-23 17:26:46
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE LTE_MIB_H_ip_src_ltehdlResourceGrid_ltehdlResourceGrid_pac IS
  TYPE vector_of_signed16 IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);
  TYPE vector_of_unsigned4 IS ARRAY (NATURAL RANGE <>) OF unsigned(3 DOWNTO 0);
  TYPE vector_of_unsigned9 IS ARRAY (NATURAL RANGE <>) OF unsigned(8 DOWNTO 0);
  TYPE vector_of_unsigned14 IS ARRAY (NATURAL RANGE <>) OF unsigned(13 DOWNTO 0);
  TYPE vector_of_unsigned11 IS ARRAY (NATURAL RANGE <>) OF unsigned(10 DOWNTO 0);
END LTE_MIB_H_ip_src_ltehdlResourceGrid_ltehdlResourceGrid_pac;
