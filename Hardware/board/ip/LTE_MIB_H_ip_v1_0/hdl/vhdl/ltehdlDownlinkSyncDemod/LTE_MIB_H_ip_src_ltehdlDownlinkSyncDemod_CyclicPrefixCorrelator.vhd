-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CyclicPrefixCorrelator.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CyclicPrefixCorrelator
-- Source Path: ltehdlDownlinkSyncDemod/FrequencyEstimation/CyclicPrefixCorrelator
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlDownlinkSyncDemod;
USE work.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_ltehdlDownlinkSyncDemod_pac.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CyclicPrefixCorrelator IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validIn                           :   IN    std_logic;
        corrOut_re                        :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
        corrOut_im                        :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
        validOut                          :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CyclicPrefixCorrelator;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CyclicPrefixCorrelator IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          dataIn_im                       :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          dataOut_im                      :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SlotAverage
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          dataIn_im                       :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          dataOut_im                      :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SlotAverage
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SlotAverage(rtl);

  -- Signals
  SIGNAL dataIn_re_signed                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataIn_im_signed                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay1_reg_re                    : vector_of_signed16(0 TO 1);  -- sfix16_En15 [2]
  SIGNAL Delay1_reg_im                    : vector_of_signed16(0 TO 1);  -- sfix16_En15 [2]
  SIGNAL Delay1_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay1_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay2_reg_re                    : vector_of_signed16(0 TO 127) := (OTHERS => to_signed(16#0000#, 16));  -- sfix16_En15 [128]
  SIGNAL Delay2_reg_im                    : vector_of_signed16(0 TO 127) := (OTHERS => to_signed(16#0000#, 16));  -- sfix16_En15 [128]
  SIGNAL Delay2_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay2_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL conj_cast                        : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL conj_cast_1                      : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL complexConj_out1_re              : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL complexConj_out1_im              : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay3_reg_re                    : vector_of_signed16(0 TO 1);  -- sfix16_En15 [2]
  SIGNAL Delay3_reg_im                    : vector_of_signed16(0 TO 1);  -- sfix16_En15 [2]
  SIGNAL Delay3_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay3_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Product_mul_temp                 : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Product_mul_temp_1               : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Product_mul_temp_2               : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Product_mul_temp_3               : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Product_out1_re                  : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Product_out1_im                  : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Delay7_reg_re                    : vector_of_signed32(0 TO 1);  -- sfix32_En30 [2]
  SIGNAL Delay7_reg_im                    : vector_of_signed32(0 TO 1);  -- sfix32_En30 [2]
  SIGNAL Delay7_out1_re                   : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Delay7_out1_im                   : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL DT_Conversion_out1_re            : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL DT_Conversion_out1_im            : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay5_out1_re                   : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay5_out1_im                   : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay4_reg                       : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL Delay8_reg                       : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Delay8_out1                      : std_logic;
  SIGNAL Delay6_out1                      : std_logic;
  SIGNAL MovingAverage_out1_re            : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL MovingAverage_out1_im            : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL MovingAverage_out2               : std_logic;
  SIGNAL SlotAverage_out1_re              : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL SlotAverage_out1_im              : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL SlotAverage_out2                 : std_logic;

BEGIN
  -- Correlate the signal with itself delayed by the FFT length (128 samples).
  -- 
  -- Integrate across part of the CP length, which is 9 samples. However we use 8 samples here to optimize for HDL implementation.
  -- 
  -- Finally average across 7 OFDM symbols, i.e. the number in
  -- each slot.

  u_MovingAverage : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => std_logic_vector(Delay5_out1_re),  -- sfix24_En23
              dataIn_im => std_logic_vector(Delay5_out1_im),  -- sfix24_En23
              validIn => Delay6_out1,
              dataOut_re => MovingAverage_out1_re,  -- sfix24_En23
              dataOut_im => MovingAverage_out1_im,  -- sfix24_En23
              validOut => MovingAverage_out2
              );

  u_SlotAverage : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SlotAverage
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => MovingAverage_out1_re,  -- sfix24_En23
              dataIn_im => MovingAverage_out1_im,  -- sfix24_En23
              validIn => MovingAverage_out2,
              dataOut_re => SlotAverage_out1_re,  -- sfix24_En23
              dataOut_im => SlotAverage_out1_im,  -- sfix24_En23
              validOut => SlotAverage_out2
              );

  dataIn_re_signed <= signed(dataIn_re);

  dataIn_im_signed <= signed(dataIn_im);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_reg_re <= (OTHERS => to_signed(16#0000#, 16));
        Delay1_reg_im <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb = '1' THEN
        Delay1_reg_im(0) <= dataIn_im_signed;
        Delay1_reg_im(1) <= Delay1_reg_im(0);
        Delay1_reg_re(0) <= dataIn_re_signed;
        Delay1_reg_re(1) <= Delay1_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  Delay1_out1_re <= Delay1_reg_re(1);
  Delay1_out1_im <= Delay1_reg_im(1);

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND validIn = '1' THEN
        Delay2_reg_im(0) <= dataIn_im_signed;
        Delay2_reg_im(1 TO 127) <= Delay2_reg_im(0 TO 126);
        Delay2_reg_re(0) <= dataIn_re_signed;
        Delay2_reg_re(1 TO 127) <= Delay2_reg_re(0 TO 126);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  Delay2_out1_re <= Delay2_reg_re(127);
  Delay2_out1_im <= Delay2_reg_im(127);

  complexConj_out1_re <= Delay2_out1_re;
  conj_cast <= resize(Delay2_out1_im, 17);
  conj_cast_1 <=  - (conj_cast);
  
  complexConj_out1_im <= X"7FFF" WHEN (conj_cast_1(16) = '0') AND (conj_cast_1(15) /= '0') ELSE
      X"8000" WHEN (conj_cast_1(16) = '1') AND (conj_cast_1(15) /= '1') ELSE
      conj_cast_1(15 DOWNTO 0);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_reg_re <= (OTHERS => to_signed(16#0000#, 16));
        Delay3_reg_im <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb = '1' THEN
        Delay3_reg_im(0) <= complexConj_out1_im;
        Delay3_reg_im(1) <= Delay3_reg_im(0);
        Delay3_reg_re(0) <= complexConj_out1_re;
        Delay3_reg_re(1) <= Delay3_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay3_process;

  Delay3_out1_re <= Delay3_reg_re(1);
  Delay3_out1_im <= Delay3_reg_im(1);

  Product_mul_temp <= Delay1_out1_re * Delay3_out1_re;
  Product_mul_temp_1 <= Delay1_out1_im * Delay3_out1_im;
  Product_out1_re <= Product_mul_temp - Product_mul_temp_1;
  Product_mul_temp_2 <= Delay1_out1_im * Delay3_out1_re;
  Product_mul_temp_3 <= Delay1_out1_re * Delay3_out1_im;
  Product_out1_im <= Product_mul_temp_2 + Product_mul_temp_3;

  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_reg_re <= (OTHERS => to_signed(0, 32));
        Delay7_reg_im <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        Delay7_reg_im(0) <= Product_out1_im;
        Delay7_reg_im(1) <= Delay7_reg_im(0);
        Delay7_reg_re(0) <= Product_out1_re;
        Delay7_reg_re(1) <= Delay7_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay7_process;

  Delay7_out1_re <= Delay7_reg_re(1);
  Delay7_out1_im <= Delay7_reg_im(1);

  DT_Conversion_out1_re <= Delay7_out1_re(30 DOWNTO 7) + ('0' & (Delay7_out1_re(6) AND (( NOT Delay7_out1_re(31)) OR (Delay7_out1_re(5) OR Delay7_out1_re(4) OR Delay7_out1_re(3) OR Delay7_out1_re(2) OR Delay7_out1_re(1) OR Delay7_out1_re(0)))));
  DT_Conversion_out1_im <= Delay7_out1_im(30 DOWNTO 7) + ('0' & (Delay7_out1_im(6) AND (( NOT Delay7_out1_im(31)) OR (Delay7_out1_im(5) OR Delay7_out1_im(4) OR Delay7_out1_im(3) OR Delay7_out1_im(2) OR Delay7_out1_im(1) OR Delay7_out1_im(0)))));

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1_re <= to_signed(16#000000#, 24);
        Delay5_out1_im <= to_signed(16#000000#, 24);
      ELSIF enb = '1' THEN
        Delay5_out1_re <= DT_Conversion_out1_re;
        Delay5_out1_im <= DT_Conversion_out1_im;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Delay4_reg(0) <= validIn;
        Delay4_reg(1) <= Delay4_reg(0);
      END IF;
    END IF;
  END PROCESS Delay4_process;

  Delay4_out1 <= Delay4_reg(1);

  Delay8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Delay8_reg(0) <= Delay4_out1;
        Delay8_reg(1) <= Delay8_reg(0);
      END IF;
    END IF;
  END PROCESS Delay8_process;

  Delay8_out1 <= Delay8_reg(1);

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay6_out1 <= Delay8_out1;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  corrOut_re <= SlotAverage_out1_re;

  corrOut_im <= SlotAverage_out1_im;

  validOut <= SlotAverage_out2;

END rtl;
