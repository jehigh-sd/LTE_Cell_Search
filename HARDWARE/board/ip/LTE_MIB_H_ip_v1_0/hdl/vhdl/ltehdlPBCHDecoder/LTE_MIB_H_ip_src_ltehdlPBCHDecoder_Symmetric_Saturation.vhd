-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlPBCHDecoder\LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Symmetric_Saturation.vhd
-- Created: 2022-05-23 17:26:45
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Symmetric_Saturation
-- Source Path: ltehdlPBCHDecoder/BCH Decoder/softBitScalingUnit/Symmetric Saturation
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ltehdlPBCHDecoder_pac.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Symmetric_Saturation IS
  PORT( x_0                               :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
        x_1                               :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
        x_2                               :   IN    std_logic_vector(19 DOWNTO 0);  -- ufix20
        y_0                               :   OUT   std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
        y_1                               :   OUT   std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
        y_2                               :   OUT   std_logic_vector(19 DOWNTO 0)  -- sfix20_En17
        );
END LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Symmetric_Saturation;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Symmetric_Saturation IS

  -- Signals
  SIGNAL x                                : vector_of_signed20(0 TO 2);  -- sfix20_En17 [3]
  SIGNAL y                                : vector_of_signed20(0 TO 2);  -- sfix20_En17 [3]

BEGIN
  x(0) <= signed(x_0);
  x(1) <= signed(x_1);
  x(2) <= signed(x_2);

  Symmetric_Saturation_output : PROCESS (x)
    VARIABLE t_0 : signed(19 DOWNTO 0);
  BEGIN
    t_0 := to_signed(16#00000#, 20);
    -- Assume input is signed with numerictype(1,W,F)
    -- Lowest possible input value
    -- Lower limit to saturate to

    FOR k IN 0 TO 2 LOOP
      t_0 := x(k);
      IF x(k) = to_signed(-16#80000#, 20) THEN 
        t_0 := to_signed(-16#7FFFF#, 20);
      END IF;
      y(k) <= t_0;
    END LOOP;

  END PROCESS Symmetric_Saturation_output;


  y_0 <= std_logic_vector(y(0));

  y_1 <= std_logic_vector(y(1));

  y_2 <= std_logic_vector(y(2));

END rtl;

