-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2\LTE_GENER_ip_src_Filter_block5.vhd
-- Created: 2022-05-23 17:12:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_GENER_ip_src_Filter_block5
-- Source Path: zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2/LTE_GENERATOR/LTE_Generator/Vector Interpolator/FIR_Vector_Interp/Discrete 
-- FIR Filter HDL Optimized6/Filte
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_GENER_ip_src_Filter_block5 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        validIn                           :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        validOut                          :   OUT   std_logic
        );
END LTE_GENER_ip_src_Filter_block5;


ARCHITECTURE rtl OF LTE_GENER_ip_src_Filter_block5 IS

  -- Component Declarations
  COMPONENT LTE_GENER_ip_src_FilterCoef_block5
    PORT( CoefOut_0                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_1                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_2                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_3                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_4                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_5                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_6                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_7                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_8                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_9                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_10                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_11                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_12                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_13                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_14                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_15                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_16                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_17                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_18                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_19                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_20                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_21                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_22                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_23                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_24                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_25                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_26                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_27                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_28                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_29                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_30                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          CoefOut_31                      :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_subFilter_block5
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dinReg2_0_re                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16
          coefIn_0                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_1                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_2                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_3                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_4                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_5                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_6                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_7                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_8                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_9                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_10                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_11                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_12                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_13                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_14                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_15                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_16                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_17                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_18                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_19                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_20                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_21                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_22                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_23                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_24                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_25                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_26                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_27                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_28                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_29                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_30                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_31                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dinRegVld                       :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          dout_1_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16
          doutVld                         :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_GENER_ip_src_FilterCoef_block5
    USE ENTITY work.LTE_GENER_ip_src_FilterCoef_block5(rtl);

  FOR ALL : LTE_GENER_ip_src_subFilter_block5
    USE ENTITY work.LTE_GENER_ip_src_subFilter_block5(rtl);

  -- Signals
  SIGNAL dinRegVld                        : std_logic;
  SIGNAL dataIn_re_signed                 : signed(15 DOWNTO 0);  -- int16
  SIGNAL dataIn_im_signed                 : signed(15 DOWNTO 0);  -- int16
  SIGNAL din_cast_re                      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL din_cast_im                      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL dinReg_0_re                      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL dinReg2_0_re                     : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL CoefOut_0                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_1                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_2                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_3                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_4                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_5                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_6                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_7                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_8                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_9                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_10                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_11                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_12                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_13                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_14                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_15                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_16                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_17                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_18                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_19                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_20                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_21                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_22                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_23                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_24                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_25                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_26                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_27                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_28                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_29                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_30                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL CoefOut_31                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dinReg2Vld                       : std_logic;
  SIGNAL dout_1_re                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL doutVld                          : std_logic;
  SIGNAL dinReg_0_im                      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL dinReg2_0_im                     : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL dout_1_im                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL doutVlddeadOut                   : std_logic;

BEGIN
  u_CoefTable_1 : LTE_GENER_ip_src_FilterCoef_block5
    PORT MAP( CoefOut_0 => CoefOut_0,  -- sfix16_En15
              CoefOut_1 => CoefOut_1,  -- sfix16_En15
              CoefOut_2 => CoefOut_2,  -- sfix16_En15
              CoefOut_3 => CoefOut_3,  -- sfix16_En15
              CoefOut_4 => CoefOut_4,  -- sfix16_En15
              CoefOut_5 => CoefOut_5,  -- sfix16_En15
              CoefOut_6 => CoefOut_6,  -- sfix16_En15
              CoefOut_7 => CoefOut_7,  -- sfix16_En15
              CoefOut_8 => CoefOut_8,  -- sfix16_En15
              CoefOut_9 => CoefOut_9,  -- sfix16_En15
              CoefOut_10 => CoefOut_10,  -- sfix16_En15
              CoefOut_11 => CoefOut_11,  -- sfix16_En15
              CoefOut_12 => CoefOut_12,  -- sfix16_En15
              CoefOut_13 => CoefOut_13,  -- sfix16_En15
              CoefOut_14 => CoefOut_14,  -- sfix16_En15
              CoefOut_15 => CoefOut_15,  -- sfix16_En15
              CoefOut_16 => CoefOut_16,  -- sfix16_En15
              CoefOut_17 => CoefOut_17,  -- sfix16_En15
              CoefOut_18 => CoefOut_18,  -- sfix16_En15
              CoefOut_19 => CoefOut_19,  -- sfix16_En15
              CoefOut_20 => CoefOut_20,  -- sfix16_En15
              CoefOut_21 => CoefOut_21,  -- sfix16_En15
              CoefOut_22 => CoefOut_22,  -- sfix16_En15
              CoefOut_23 => CoefOut_23,  -- sfix16_En15
              CoefOut_24 => CoefOut_24,  -- sfix16_En15
              CoefOut_25 => CoefOut_25,  -- sfix16_En15
              CoefOut_26 => CoefOut_26,  -- sfix16_En15
              CoefOut_27 => CoefOut_27,  -- sfix16_En15
              CoefOut_28 => CoefOut_28,  -- sfix16_En15
              CoefOut_29 => CoefOut_29,  -- sfix16_En15
              CoefOut_30 => CoefOut_30,  -- sfix16_En15
              CoefOut_31 => CoefOut_31  -- sfix16_En15
              );

  u_subFilter_1_re : LTE_GENER_ip_src_subFilter_block5
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dinReg2_0_re => std_logic_vector(dinReg2_0_re),  -- sfix16
              coefIn_0 => CoefOut_0,  -- sfix16_En15
              coefIn_1 => CoefOut_1,  -- sfix16_En15
              coefIn_2 => CoefOut_2,  -- sfix16_En15
              coefIn_3 => CoefOut_3,  -- sfix16_En15
              coefIn_4 => CoefOut_4,  -- sfix16_En15
              coefIn_5 => CoefOut_5,  -- sfix16_En15
              coefIn_6 => CoefOut_6,  -- sfix16_En15
              coefIn_7 => CoefOut_7,  -- sfix16_En15
              coefIn_8 => CoefOut_8,  -- sfix16_En15
              coefIn_9 => CoefOut_9,  -- sfix16_En15
              coefIn_10 => CoefOut_10,  -- sfix16_En15
              coefIn_11 => CoefOut_11,  -- sfix16_En15
              coefIn_12 => CoefOut_12,  -- sfix16_En15
              coefIn_13 => CoefOut_13,  -- sfix16_En15
              coefIn_14 => CoefOut_14,  -- sfix16_En15
              coefIn_15 => CoefOut_15,  -- sfix16_En15
              coefIn_16 => CoefOut_16,  -- sfix16_En15
              coefIn_17 => CoefOut_17,  -- sfix16_En15
              coefIn_18 => CoefOut_18,  -- sfix16_En15
              coefIn_19 => CoefOut_19,  -- sfix16_En15
              coefIn_20 => CoefOut_20,  -- sfix16_En15
              coefIn_21 => CoefOut_21,  -- sfix16_En15
              coefIn_22 => CoefOut_22,  -- sfix16_En15
              coefIn_23 => CoefOut_23,  -- sfix16_En15
              coefIn_24 => CoefOut_24,  -- sfix16_En15
              coefIn_25 => CoefOut_25,  -- sfix16_En15
              coefIn_26 => CoefOut_26,  -- sfix16_En15
              coefIn_27 => CoefOut_27,  -- sfix16_En15
              coefIn_28 => CoefOut_28,  -- sfix16_En15
              coefIn_29 => CoefOut_29,  -- sfix16_En15
              coefIn_30 => CoefOut_30,  -- sfix16_En15
              coefIn_31 => CoefOut_31,  -- sfix16_En15
              dinRegVld => dinReg2Vld,
              syncReset => syncReset,
              dout_1_re => dout_1_re,  -- sfix16
              doutVld => doutVld
              );

  u_subFilter_1_im : LTE_GENER_ip_src_subFilter_block5
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dinReg2_0_re => std_logic_vector(dinReg2_0_im),  -- sfix16
              coefIn_0 => CoefOut_0,  -- sfix16_En15
              coefIn_1 => CoefOut_1,  -- sfix16_En15
              coefIn_2 => CoefOut_2,  -- sfix16_En15
              coefIn_3 => CoefOut_3,  -- sfix16_En15
              coefIn_4 => CoefOut_4,  -- sfix16_En15
              coefIn_5 => CoefOut_5,  -- sfix16_En15
              coefIn_6 => CoefOut_6,  -- sfix16_En15
              coefIn_7 => CoefOut_7,  -- sfix16_En15
              coefIn_8 => CoefOut_8,  -- sfix16_En15
              coefIn_9 => CoefOut_9,  -- sfix16_En15
              coefIn_10 => CoefOut_10,  -- sfix16_En15
              coefIn_11 => CoefOut_11,  -- sfix16_En15
              coefIn_12 => CoefOut_12,  -- sfix16_En15
              coefIn_13 => CoefOut_13,  -- sfix16_En15
              coefIn_14 => CoefOut_14,  -- sfix16_En15
              coefIn_15 => CoefOut_15,  -- sfix16_En15
              coefIn_16 => CoefOut_16,  -- sfix16_En15
              coefIn_17 => CoefOut_17,  -- sfix16_En15
              coefIn_18 => CoefOut_18,  -- sfix16_En15
              coefIn_19 => CoefOut_19,  -- sfix16_En15
              coefIn_20 => CoefOut_20,  -- sfix16_En15
              coefIn_21 => CoefOut_21,  -- sfix16_En15
              coefIn_22 => CoefOut_22,  -- sfix16_En15
              coefIn_23 => CoefOut_23,  -- sfix16_En15
              coefIn_24 => CoefOut_24,  -- sfix16_En15
              coefIn_25 => CoefOut_25,  -- sfix16_En15
              coefIn_26 => CoefOut_26,  -- sfix16_En15
              coefIn_27 => CoefOut_27,  -- sfix16_En15
              coefIn_28 => CoefOut_28,  -- sfix16_En15
              coefIn_29 => CoefOut_29,  -- sfix16_En15
              coefIn_30 => CoefOut_30,  -- sfix16_En15
              coefIn_31 => CoefOut_31,  -- sfix16_En15
              dinRegVld => dinReg2Vld,
              syncReset => syncReset,
              dout_1_re => dout_1_im,  -- sfix16
              doutVld => doutVlddeadOut
              );

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dinRegVld <= '0';
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          dinRegVld <= '0';
        ELSE 
          dinRegVld <= validIn;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  dataIn_re_signed <= signed(dataIn_re);

  dataIn_im_signed <= signed(dataIn_im);

  din_cast_re <= dataIn_re_signed;
  din_cast_im <= dataIn_im_signed;

  intdelay_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dinReg_0_re <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          dinReg_0_re <= to_signed(16#0000#, 16);
        ELSIF validIn = '1' THEN
          dinReg_0_re <= din_cast_re;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  intdelay_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dinReg2_0_re <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          dinReg2_0_re <= to_signed(16#0000#, 16);
        ELSIF dinRegVld = '1' THEN
          dinReg2_0_re <= dinReg_0_re;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  intdelay_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dinReg2Vld <= '0';
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          dinReg2Vld <= '0';
        ELSE 
          dinReg2Vld <= dinRegVld;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  intdelay_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dinReg_0_im <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          dinReg_0_im <= to_signed(16#0000#, 16);
        ELSIF validIn = '1' THEN
          dinReg_0_im <= din_cast_im;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  intdelay_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dinReg2_0_im <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          dinReg2_0_im <= to_signed(16#0000#, 16);
        ELSIF dinRegVld = '1' THEN
          dinReg2_0_im <= dinReg_0_im;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  dataOut_re <= dout_1_re;

  dataOut_im <= dout_1_im;

  validOut <= doutVld;

END rtl;

