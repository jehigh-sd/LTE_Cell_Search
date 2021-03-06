-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlChannelEqualizer\LTE_MIB_H_ip_src_ltehdlChannelEqualizer_mod3HDL1.vhd
-- Created: 2022-05-23 17:26:43
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlChannelEqualizer_mod3HDL1
-- Source Path: ltehdlChannelEqualizer/chEst/hEstInterpAndStore/addr_mapper/mod3HDL1
-- Hierarchy Level: 7
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LTE_MIB_H_ip_src_ltehdlChannelEqualizer_ltehdlChannelEqualizer_pac.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlChannelEqualizer_mod3HDL1 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        addr_in                           :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
        quotient                          :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        reminder                          :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
        );
END LTE_MIB_H_ip_src_ltehdlChannelEqualizer_mod3HDL1;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlChannelEqualizer_mod3HDL1 IS

  -- Signals
  SIGNAL addr_in_unsigned                 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay3_out1                      : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay_reg                        : vector_of_unsigned11(0 TO 4);  -- ufix11 [5]
  SIGNAL Delay_out1                       : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay12_out1                     : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Constant_out1                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Product1_cast                    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL Product1_mul_temp                : signed(27 DOWNTO 0);  -- sfix28_En15
  SIGNAL Product1_cast_1                  : signed(26 DOWNTO 0);  -- sfix27_En15
  SIGNAL Product1_out1                    : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay4_reg                       : vector_of_unsigned11(0 TO 1);  -- ufix11 [2]
  SIGNAL Delay4_out1                      : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay5_out1                      : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Constant1_out1                   : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Product2_out1                    : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay6_reg                       : vector_of_unsigned11(0 TO 1);  -- ufix11 [2]
  SIGNAL Delay6_out1                      : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay11_out1                     : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Subtract_out1                    : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay10_out1                     : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Delay2_reg                       : vector_of_unsigned11(0 TO 4);  -- ufix11 [5]
  SIGNAL Delay2_out1                      : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay2_out1_dtc                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant3_out1                   : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay13_reg                      : vector_of_unsigned11(0 TO 2);  -- ufix11 [3]
  SIGNAL Delay13_out1                     : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay1_out1                      : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Add_out1                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay7_out1                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Switch1_out1                     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL Delay10_out1_dtc                 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant4_out1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Switch_out1                      : unsigned(15 DOWNTO 0);  -- uint16

BEGIN
  addr_in_unsigned <= unsigned(addr_in);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_out1 <= addr_in_unsigned;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_reg <= (OTHERS => to_unsigned(16#000#, 11));
      ELSIF enb_1_2_0 = '1' THEN
        Delay_reg(0) <= Delay3_out1;
        Delay_reg(1 TO 4) <= Delay_reg(0 TO 3);
      END IF;
    END IF;
  END PROCESS Delay_process;

  Delay_out1 <= Delay_reg(4);

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb_1_2_0 = '1' THEN
        Delay12_out1 <= Delay_out1;
      END IF;
    END IF;
  END PROCESS Delay12_process;


  Constant_out1 <= to_signed(16#2AAB#, 16);

  Product1_cast <= signed(resize(Delay3_out1, 12));
  Product1_mul_temp <= Product1_cast * Constant_out1;
  Product1_cast_1 <= Product1_mul_temp(26 DOWNTO 0);
  Product1_out1 <= unsigned(Product1_cast_1(25 DOWNTO 15));

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_reg <= (OTHERS => to_unsigned(16#000#, 11));
      ELSIF enb_1_2_0 = '1' THEN
        Delay4_reg(0) <= Product1_out1;
        Delay4_reg(1) <= Delay4_reg(0);
      END IF;
    END IF;
  END PROCESS Delay4_process;

  Delay4_out1 <= Delay4_reg(1);

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb_1_2_0 = '1' THEN
        Delay5_out1 <= Delay4_out1;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  Constant1_out1 <= to_unsigned(16#003#, 11);

  Product2_out1 <= resize(Delay5_out1 * Constant1_out1, 11);

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_reg <= (OTHERS => to_unsigned(16#000#, 11));
      ELSIF enb_1_2_0 = '1' THEN
        Delay6_reg(0) <= Product2_out1;
        Delay6_reg(1) <= Delay6_reg(0);
      END IF;
    END IF;
  END PROCESS Delay6_process;

  Delay6_out1 <= Delay6_reg(1);

  Delay11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay11_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb_1_2_0 = '1' THEN
        Delay11_out1 <= Delay6_out1;
      END IF;
    END IF;
  END PROCESS Delay11_process;


  Subtract_out1 <= Delay12_out1 - Delay11_out1;

  Delay10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay10_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb_1_2_0 = '1' THEN
        Delay10_out1 <= Subtract_out1;
      END IF;
    END IF;
  END PROCESS Delay10_process;


  
  switch_compare_1 <= '1' WHEN Delay10_out1 > to_unsigned(16#002#, 11) ELSE
      '0';

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_reg <= (OTHERS => to_unsigned(16#000#, 11));
      ELSIF enb_1_2_0 = '1' THEN
        Delay2_reg(0) <= Delay4_out1;
        Delay2_reg(1 TO 4) <= Delay2_reg(0 TO 3);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  Delay2_out1 <= Delay2_reg(4);

  Delay2_out1_dtc <= resize(Delay2_out1, 16);

  Constant3_out1 <= to_unsigned(16#001#, 11);

  Delay13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay13_reg <= (OTHERS => to_unsigned(16#000#, 11));
      ELSIF enb_1_2_0 = '1' THEN
        Delay13_reg(0) <= Delay4_out1;
        Delay13_reg(1 TO 2) <= Delay13_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Delay13_process;

  Delay13_out1 <= Delay13_reg(2);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb_1_2_0 = '1' THEN
        Delay1_out1 <= Delay13_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Add_out1 <= resize(resize(Constant3_out1, 12) + resize(Delay1_out1, 12), 16);

  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        Delay7_out1 <= Add_out1;
      END IF;
    END IF;
  END PROCESS Delay7_process;


  
  Switch1_out1 <= Delay2_out1_dtc WHEN switch_compare_1 = '0' ELSE
      Delay7_out1;

  quotient <= std_logic_vector(Switch1_out1);

  
  switch_compare_1_1 <= '1' WHEN Delay10_out1 > to_unsigned(16#002#, 11) ELSE
      '0';

  Delay10_out1_dtc <= resize(Delay10_out1, 16);

  Constant4_out1 <= to_unsigned(16#0000#, 16);

  
  Switch_out1 <= Delay10_out1_dtc WHEN switch_compare_1_1 = '0' ELSE
      Constant4_out1;

  reminder <= std_logic_vector(Switch_out1);

END rtl;

