-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage
-- Source Path: ltehdlDownlinkSyncDemod/FrequencyEstimation/CyclicPrefixCorrelator/MovingAverage
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
        dataIn_im                         :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
        validIn                           :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
        dataOut_im                        :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
        validOut                          :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MovingAverage IS

  -- Signals
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL dataIn_re_signed                 : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL dataIn_im_signed                 : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_re                 : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_im                 : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_re                  : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_im                  : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_re_1               : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_im_1               : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_re_1                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_im_1                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_re_2               : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_im_2               : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_re_2                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_im_2                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_re_3               : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_im_3               : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_re_3                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_im_3                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_re_4               : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_im_4               : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_re_4                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_im_4                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_re_5               : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_im_5               : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_re_5                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_im_5                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_re_6               : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_delOut_im_6               : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_re_6                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_im_6                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_out1_re                   : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_out1_im                   : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_re_7                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay1_ectrl_im_7                : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Add_sub_cast                     : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Add_sub_cast_1                   : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Add_sub_cast_2                   : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Add_sub_cast_3                   : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Add_out1_re                      : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Add_out1_im                      : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Delay10_out1_re                  : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Delay10_out1_im                  : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Delay2_out1_re                   : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Delay2_out1_im                   : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Add1_out1_re                     : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Add1_out1_im                     : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Delay2_ectrl_re                  : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Delay2_ectrl_im                  : signed(26 DOWNTO 0);  -- sfix27_En23
  SIGNAL Gain_cast                        : signed(53 DOWNTO 0);  -- sfix54_En51
  SIGNAL Gain_cast_1                      : signed(53 DOWNTO 0);  -- sfix54_En51
  SIGNAL Gain_out1_re                     : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Gain_out1_im                     : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay3_out1_re                   : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay3_out1_im                   : signed(23 DOWNTO 0);  -- sfix24_En23
  SIGNAL Delay5_out1                      : std_logic;

BEGIN
  -- Use a comb filter followed by an integrator
  -- to implement an efficient 8-tap moving average.

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay4_out1 <= validIn;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  dataIn_re_signed <= signed(dataIn_re);

  dataIn_im_signed <= signed(dataIn_im);

  
  Delay1_ectrl_re <= Delay1_delOut_re WHEN validIn = '0' ELSE
      dataIn_re_signed;
  
  Delay1_ectrl_im <= Delay1_delOut_im WHEN validIn = '0' ELSE
      dataIn_im_signed;

  Delay1_lowered_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_delOut_re <= to_signed(16#000000#, 24);
        Delay1_delOut_im <= to_signed(16#000000#, 24);
      ELSIF enb = '1' THEN
        Delay1_delOut_re <= Delay1_ectrl_re;
        Delay1_delOut_im <= Delay1_ectrl_im;
      END IF;
    END IF;
  END PROCESS Delay1_lowered_process;


  
  Delay1_ectrl_re_1 <= Delay1_delOut_re_1 WHEN validIn = '0' ELSE
      Delay1_delOut_re;
  
  Delay1_ectrl_im_1 <= Delay1_delOut_im_1 WHEN validIn = '0' ELSE
      Delay1_delOut_im;

  Delay1_lowered1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_delOut_re_1 <= to_signed(16#000000#, 24);
        Delay1_delOut_im_1 <= to_signed(16#000000#, 24);
      ELSIF enb = '1' THEN
        Delay1_delOut_re_1 <= Delay1_ectrl_re_1;
        Delay1_delOut_im_1 <= Delay1_ectrl_im_1;
      END IF;
    END IF;
  END PROCESS Delay1_lowered1_process;


  
  Delay1_ectrl_re_2 <= Delay1_delOut_re_2 WHEN validIn = '0' ELSE
      Delay1_delOut_re_1;
  
  Delay1_ectrl_im_2 <= Delay1_delOut_im_2 WHEN validIn = '0' ELSE
      Delay1_delOut_im_1;

  Delay1_lowered2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_delOut_re_2 <= to_signed(16#000000#, 24);
        Delay1_delOut_im_2 <= to_signed(16#000000#, 24);
      ELSIF enb = '1' THEN
        Delay1_delOut_re_2 <= Delay1_ectrl_re_2;
        Delay1_delOut_im_2 <= Delay1_ectrl_im_2;
      END IF;
    END IF;
  END PROCESS Delay1_lowered2_process;


  
  Delay1_ectrl_re_3 <= Delay1_delOut_re_3 WHEN validIn = '0' ELSE
      Delay1_delOut_re_2;
  
  Delay1_ectrl_im_3 <= Delay1_delOut_im_3 WHEN validIn = '0' ELSE
      Delay1_delOut_im_2;

  Delay1_lowered3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_delOut_re_3 <= to_signed(16#000000#, 24);
        Delay1_delOut_im_3 <= to_signed(16#000000#, 24);
      ELSIF enb = '1' THEN
        Delay1_delOut_re_3 <= Delay1_ectrl_re_3;
        Delay1_delOut_im_3 <= Delay1_ectrl_im_3;
      END IF;
    END IF;
  END PROCESS Delay1_lowered3_process;


  
  Delay1_ectrl_re_4 <= Delay1_delOut_re_4 WHEN validIn = '0' ELSE
      Delay1_delOut_re_3;
  
  Delay1_ectrl_im_4 <= Delay1_delOut_im_4 WHEN validIn = '0' ELSE
      Delay1_delOut_im_3;

  Delay1_lowered4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_delOut_re_4 <= to_signed(16#000000#, 24);
        Delay1_delOut_im_4 <= to_signed(16#000000#, 24);
      ELSIF enb = '1' THEN
        Delay1_delOut_re_4 <= Delay1_ectrl_re_4;
        Delay1_delOut_im_4 <= Delay1_ectrl_im_4;
      END IF;
    END IF;
  END PROCESS Delay1_lowered4_process;


  
  Delay1_ectrl_re_5 <= Delay1_delOut_re_5 WHEN validIn = '0' ELSE
      Delay1_delOut_re_4;
  
  Delay1_ectrl_im_5 <= Delay1_delOut_im_5 WHEN validIn = '0' ELSE
      Delay1_delOut_im_4;

  Delay1_lowered5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_delOut_re_5 <= to_signed(16#000000#, 24);
        Delay1_delOut_im_5 <= to_signed(16#000000#, 24);
      ELSIF enb = '1' THEN
        Delay1_delOut_re_5 <= Delay1_ectrl_re_5;
        Delay1_delOut_im_5 <= Delay1_ectrl_im_5;
      END IF;
    END IF;
  END PROCESS Delay1_lowered5_process;


  
  Delay1_ectrl_re_6 <= Delay1_delOut_re_6 WHEN validIn = '0' ELSE
      Delay1_delOut_re_5;
  
  Delay1_ectrl_im_6 <= Delay1_delOut_im_6 WHEN validIn = '0' ELSE
      Delay1_delOut_im_5;

  Delay1_lowered6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_delOut_re_6 <= to_signed(16#000000#, 24);
        Delay1_delOut_im_6 <= to_signed(16#000000#, 24);
      ELSIF enb = '1' THEN
        Delay1_delOut_re_6 <= Delay1_ectrl_re_6;
        Delay1_delOut_im_6 <= Delay1_ectrl_im_6;
      END IF;
    END IF;
  END PROCESS Delay1_lowered6_process;


  
  Delay1_ectrl_re_7 <= Delay1_out1_re WHEN validIn = '0' ELSE
      Delay1_delOut_re_6;
  
  Delay1_ectrl_im_7 <= Delay1_out1_im WHEN validIn = '0' ELSE
      Delay1_delOut_im_6;

  Delay1_lowered7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1_re <= to_signed(16#000000#, 24);
        Delay1_out1_im <= to_signed(16#000000#, 24);
      ELSIF enb = '1' THEN
        Delay1_out1_re <= Delay1_ectrl_re_7;
        Delay1_out1_im <= Delay1_ectrl_im_7;
      END IF;
    END IF;
  END PROCESS Delay1_lowered7_process;


  Add_sub_cast <= resize(dataIn_re_signed, 27);
  Add_sub_cast_1 <= resize(Delay1_out1_re, 27);
  Add_out1_re <= Add_sub_cast - Add_sub_cast_1;
  Add_sub_cast_2 <= resize(dataIn_im_signed, 27);
  Add_sub_cast_3 <= resize(Delay1_out1_im, 27);
  Add_out1_im <= Add_sub_cast_2 - Add_sub_cast_3;

  Delay10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay10_out1_re <= to_signed(16#0000000#, 27);
        Delay10_out1_im <= to_signed(16#0000000#, 27);
      ELSIF enb = '1' THEN
        Delay10_out1_re <= Add_out1_re;
        Delay10_out1_im <= Add_out1_im;
      END IF;
    END IF;
  END PROCESS Delay10_process;


  
  Delay2_ectrl_re <= Delay2_out1_re WHEN Delay4_out1 = '0' ELSE
      Add1_out1_re;
  
  Delay2_ectrl_im <= Delay2_out1_im WHEN Delay4_out1 = '0' ELSE
      Add1_out1_im;

  Delay2_lowered_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1_re <= to_signed(16#0000000#, 27);
        Delay2_out1_im <= to_signed(16#0000000#, 27);
      ELSIF enb = '1' THEN
        Delay2_out1_re <= Delay2_ectrl_re;
        Delay2_out1_im <= Delay2_ectrl_im;
      END IF;
    END IF;
  END PROCESS Delay2_lowered_process;


  Add1_out1_re <= Delay2_out1_re + Delay10_out1_re;
  Add1_out1_im <= Delay2_out1_im + Delay10_out1_im;

  Gain_cast <= resize(Add1_out1_re & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 54);
  Gain_out1_re <= Gain_cast(51 DOWNTO 28);
  Gain_cast_1 <= resize(Add1_out1_im & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 54);
  Gain_out1_im <= Gain_cast_1(51 DOWNTO 28);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1_re <= to_signed(16#000000#, 24);
        Delay3_out1_im <= to_signed(16#000000#, 24);
      ELSIF enb = '1' THEN
        Delay3_out1_re <= Gain_out1_re;
        Delay3_out1_im <= Gain_out1_im;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  dataOut_re <= std_logic_vector(Delay3_out1_re);

  dataOut_im <= std_logic_vector(Delay3_out1_im);

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay5_out1 <= Delay4_out1;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  validOut <= Delay5_out1;

END rtl;
