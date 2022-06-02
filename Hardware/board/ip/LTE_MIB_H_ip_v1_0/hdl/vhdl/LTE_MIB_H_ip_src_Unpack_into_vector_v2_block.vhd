-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\LTE_MIB_H_ip_src_Unpack_into_vector_v2_block.vhd
-- Created: 2022-05-23 17:26:55
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_Unpack_into_vector_v2_block
-- Source Path: zynqRadioHWSWLTEMIBDetectorRFSoC2x2/LTE_MIB_HDL/Preprocessor/Vector Decimator/ADC To Vector Q/Unpack 
-- into vector v
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LTE_MIB_H_ip_src_LTE_MIB_HDL_pac.ALL;

ENTITY LTE_MIB_H_ip_src_Unpack_into_vector_v2_block IS
  PORT( packed_in                         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        vector_out_0                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        vector_out_1                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        vector_out_2                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        vector_out_3                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        vector_out_4                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        vector_out_5                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        vector_out_6                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        vector_out_7                      :   OUT   std_logic_vector(15 DOWNTO 0)  -- int16
        );
END LTE_MIB_H_ip_src_Unpack_into_vector_v2_block;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_Unpack_into_vector_v2_block IS

  -- Signals
  SIGNAL packed_in_unsigned               : unsigned(127 DOWNTO 0);  -- ufix128
  SIGNAL vector_out                       : vector_of_signed16(0 TO 7);  -- int16 [8]

BEGIN
  packed_in_unsigned <= unsigned(packed_in);

  xilinxrfsoclib_c4_Unpack_into_vector_v2_output : PROCESS (packed_in_unsigned)
    VARIABLE unpacked_out : vector_of_signed16(0 TO 7);
    VARIABLE elem : unsigned(15 DOWNTO 0);
    VARIABLE yfi_trivial_scaling : signed(15 DOWNTO 0);
    VARIABLE yfi_trivial_scaling_0 : signed(15 DOWNTO 0);
    VARIABLE yfi_trivial_scaling_1 : signed(15 DOWNTO 0);
    VARIABLE yfi_trivial_scaling_2 : signed(15 DOWNTO 0);
    VARIABLE yfi_trivial_scaling_3 : signed(15 DOWNTO 0);
    VARIABLE yfi_trivial_scaling_4 : signed(15 DOWNTO 0);
    VARIABLE yfi_trivial_scaling_5 : signed(15 DOWNTO 0);
    VARIABLE yfi_trivial_scaling_6 : signed(15 DOWNTO 0);
    VARIABLE elem_0 : unsigned(15 DOWNTO 0);
    VARIABLE elem_1 : unsigned(15 DOWNTO 0);
    VARIABLE elem_2 : unsigned(15 DOWNTO 0);
    VARIABLE elem_3 : unsigned(15 DOWNTO 0);
    VARIABLE elem_4 : unsigned(15 DOWNTO 0);
    VARIABLE elem_5 : unsigned(15 DOWNTO 0);
    VARIABLE elem_6 : unsigned(15 DOWNTO 0);
  BEGIN
    -- Validate arguments
    --
    -- this is standard for RFSoC; should not change
    -- Simulink seems to insist on converting fixdt(0,32,0) to uint32; convert
    -- it back
    -- need to unroll this loop at compile time because bitsliceget requires 
    -- constant inputs 
    elem := packed_in_unsigned(15 DOWNTO 0);
    yfi_trivial_scaling := signed(elem);
    unpacked_out(0) := yfi_trivial_scaling;
    elem_0 := packed_in_unsigned(31 DOWNTO 16);
    yfi_trivial_scaling_0 := signed(elem_0);
    unpacked_out(1) := yfi_trivial_scaling_0;
    elem_1 := packed_in_unsigned(47 DOWNTO 32);
    yfi_trivial_scaling_1 := signed(elem_1);
    unpacked_out(2) := yfi_trivial_scaling_1;
    elem_2 := packed_in_unsigned(63 DOWNTO 48);
    yfi_trivial_scaling_2 := signed(elem_2);
    unpacked_out(3) := yfi_trivial_scaling_2;
    elem_3 := packed_in_unsigned(79 DOWNTO 64);
    yfi_trivial_scaling_3 := signed(elem_3);
    unpacked_out(4) := yfi_trivial_scaling_3;
    elem_4 := packed_in_unsigned(95 DOWNTO 80);
    yfi_trivial_scaling_4 := signed(elem_4);
    unpacked_out(5) := yfi_trivial_scaling_4;
    elem_5 := packed_in_unsigned(111 DOWNTO 96);
    yfi_trivial_scaling_5 := signed(elem_5);
    unpacked_out(6) := yfi_trivial_scaling_5;
    elem_6 := packed_in_unsigned(127 DOWNTO 112);
    yfi_trivial_scaling_6 := signed(elem_6);
    unpacked_out(7) := yfi_trivial_scaling_6;

    FOR t_0 IN 0 TO 7 LOOP
      vector_out(t_0) <= unpacked_out(t_0);
    END LOOP;

  END PROCESS xilinxrfsoclib_c4_Unpack_into_vector_v2_output;


  vector_out_0 <= std_logic_vector(vector_out(0));

  vector_out_1 <= std_logic_vector(vector_out(1));

  vector_out_2 <= std_logic_vector(vector_out(2));

  vector_out_3 <= std_logic_vector(vector_out(3));

  vector_out_4 <= std_logic_vector(vector_out(4));

  vector_out_5 <= std_logic_vector(vector_out(5));

  vector_out_6 <= std_logic_vector(vector_out(6));

  vector_out_7 <= std_logic_vector(vector_out(7));

END rtl;

