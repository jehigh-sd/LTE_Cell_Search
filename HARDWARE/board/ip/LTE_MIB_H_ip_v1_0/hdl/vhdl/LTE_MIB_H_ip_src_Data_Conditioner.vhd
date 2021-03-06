-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\LTE_MIB_H_ip_src_Data_Conditioner.vhd
-- Created: 2022-05-23 17:26:55
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_Data_Conditioner
-- Source Path: zynqRadioHWSWLTEMIBDetectorRFSoC2x2/LTE_MIB_HDL/Preprocessor/Data Conditioner
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LTE_MIB_H_ip_src_LTE_MIB_HDL_pac.ALL;

ENTITY LTE_MIB_H_ip_src_Data_Conditioner IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        enb_1_1_1                         :   IN    std_logic;
        In1_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        In1_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        Out1_re                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        Out1_im                           :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
        );
END LTE_MIB_H_ip_src_Data_Conditioner;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_Data_Conditioner IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_Front_End_FIR_Decimation
    PORT( clk                             :   IN    std_logic;
          enb_1_1_1                       :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          LTE_MIB_H_ip_src_Front_End_FIR_Decimation_in_re :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          LTE_MIB_H_ip_src_Front_End_FIR_Decimation_in_im :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          LTE_MIB_H_ip_src_Front_End_FIR_Decimation_out_re :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          LTE_MIB_H_ip_src_Front_End_FIR_Decimation_out_im :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_Front_End_FIR_Decimation
    USE ENTITY work.LTE_MIB_H_ip_src_Front_End_FIR_Decimation(rtl);

  -- Signals
  SIGNAL In1_re_signed                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL In1_im_signed                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Gain1_cast                       : signed(31 DOWNTO 0);  -- sfix32_En25
  SIGNAL Gain1_out                        : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Gain11_cast                      : signed(31 DOWNTO 0);  -- sfix32_En25
  SIGNAL Gain1_out_1                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay6_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay6_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL delayMatch_reg_re                : vector_of_signed16(0 TO 1);  -- sfix16_En15 [2]
  SIGNAL delayMatch_reg_im                : vector_of_signed16(0 TO 1);  -- sfix16_En15 [2]
  SIGNAL Delay6_out1_re_1                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay6_out1_im_1                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay6_out1_re_2                 : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Delay6_out1_im_2                 : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Front_End_FIR_Decimation_out1_reg_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Front_End_FIR_Decimation_out1_reg_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Front_End_FIR_Decimation_out1_reg_re_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Front_End_FIR_Decimation_out1_reg_im_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Front_End_FIR_Decimation_out1_re : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Front_End_FIR_Decimation_out1_im : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Front_End_FIR_Decimation_out1_re_1 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Front_End_FIR_Decimation_out1_im_1 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Front_End_FIR_Decimation_out1_re_2 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Front_End_FIR_Decimation_out1_im_2 : signed(15 DOWNTO 0);  -- sfix16_En15

BEGIN
  u_LTE_MIB_H_ip_src_Front_End_FIR_Decimation : LTE_MIB_H_ip_src_Front_End_FIR_Decimation
    PORT MAP( clk => clk,
              enb_1_1_1 => enb_1_1_1,
              reset_x => reset_x,
              LTE_MIB_H_ip_src_Front_End_FIR_Decimation_in_re => Delay6_out1_re_2,  -- sfix16_En15
              LTE_MIB_H_ip_src_Front_End_FIR_Decimation_in_im => Delay6_out1_im_2,  -- sfix16_En15
              LTE_MIB_H_ip_src_Front_End_FIR_Decimation_out_re => Front_End_FIR_Decimation_out1_reg_re,  -- sfix16_En15
              LTE_MIB_H_ip_src_Front_End_FIR_Decimation_out_im => Front_End_FIR_Decimation_out1_reg_im  -- sfix16_En15
              );

  In1_re_signed <= signed(In1_re);

  Gain1_cast <= resize(In1_re_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);
  
  Gain1_out <= X"7FFF" WHEN (Gain1_cast(31) = '0') AND (Gain1_cast(30 DOWNTO 25) /= "000000") ELSE
      X"8000" WHEN (Gain1_cast(31) = '1') AND (Gain1_cast(30 DOWNTO 25) /= "111111") ELSE
      Gain1_cast(25 DOWNTO 10);

  In1_im_signed <= signed(In1_im);

  Gain11_cast <= resize(In1_im_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);
  
  Gain1_out_1 <= X"7FFF" WHEN (Gain11_cast(31) = '0') AND (Gain11_cast(30 DOWNTO 25) /= "000000") ELSE
      X"8000" WHEN (Gain11_cast(31) = '1') AND (Gain11_cast(30 DOWNTO 25) /= "111111") ELSE
      Gain11_cast(25 DOWNTO 10);

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_out1_re <= to_signed(16#0000#, 16);
        Delay6_out1_im <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay6_out1_re <= Gain1_out;
        Delay6_out1_im <= Gain1_out_1;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg_re <= (OTHERS => to_signed(16#0000#, 16));
        delayMatch_reg_im <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb = '1' THEN
        delayMatch_reg_im(0) <= Delay6_out1_im;
        delayMatch_reg_im(1) <= delayMatch_reg_im(0);
        delayMatch_reg_re(0) <= Delay6_out1_re;
        delayMatch_reg_re(1) <= delayMatch_reg_re(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  Delay6_out1_re_1 <= delayMatch_reg_re(1);
  Delay6_out1_im_1 <= delayMatch_reg_im(1);

  Delay6_out1_re_2 <= std_logic_vector(Delay6_out1_re_1);

  Delay6_out1_im_2 <= std_logic_vector(Delay6_out1_im_1);

  Front_End_FIR_Decimation_out1_reg_re_signed <= signed(Front_End_FIR_Decimation_out1_reg_re);

  Front_End_FIR_Decimation_out1_reg_im_signed <= signed(Front_End_FIR_Decimation_out1_reg_im);

  Front_End_FIR_Decimation_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Front_End_FIR_Decimation_out1_re <= to_signed(16#0000#, 16);
        Front_End_FIR_Decimation_out1_im <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        Front_End_FIR_Decimation_out1_re <= Front_End_FIR_Decimation_out1_reg_re_signed;
        Front_End_FIR_Decimation_out1_im <= Front_End_FIR_Decimation_out1_reg_im_signed;
      END IF;
    END IF;
  END PROCESS Front_End_FIR_Decimation_reg_process;


  Front_End_FIR_Decimation_out1_re_1 <= Front_End_FIR_Decimation_out1_re;

  Front_End_FIR_Decimation_out1_im_1 <= Front_End_FIR_Decimation_out1_im;

  Front_End_FIR_Decimation_outbuff_out_pipe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Front_End_FIR_Decimation_out1_re_2 <= to_signed(16#0000#, 16);
        Front_End_FIR_Decimation_out1_im_2 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Front_End_FIR_Decimation_out1_re_2 <= Front_End_FIR_Decimation_out1_re_1;
        Front_End_FIR_Decimation_out1_im_2 <= Front_End_FIR_Decimation_out1_im_1;
      END IF;
    END IF;
  END PROCESS Front_End_FIR_Decimation_outbuff_out_pipe_process;


  Out1_re <= std_logic_vector(Front_End_FIR_Decimation_out1_re_2);

  Out1_im <= std_logic_vector(Front_End_FIR_Decimation_out1_im_2);

END rtl;

