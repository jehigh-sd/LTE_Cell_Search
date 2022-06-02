-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2\LTE_GENER_ip_src_subFilter.vhd
-- Created: 2022-05-23 17:12:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_GENER_ip_src_subFilter
-- Source Path: zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2/LTE_GENERATOR/LTE_Generator/Vector Interpolator/FIR_Vector_Interp/Discrete 
-- FIR Filter HDL Optimized/Filter/subFilte
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_GENER_ip_src_subFilter IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dinReg2_0_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16
        coefIn_0                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_1                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_2                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_3                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_4                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_5                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_6                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_7                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_8                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_9                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_10                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_11                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_12                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_13                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_14                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_15                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_16                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_17                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_18                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_19                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_20                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_21                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_22                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_23                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_24                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_25                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_26                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_27                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_28                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_29                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_30                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_31                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dinRegVld                         :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        dout_1_re                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16
        doutVld                           :   OUT   std_logic
        );
END LTE_GENER_ip_src_subFilter;


ARCHITECTURE rtl OF LTE_GENER_ip_src_subFilter IS

  -- Component Declarations
  COMPONENT LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          dinReg2_0_re                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16
          addin                           :   IN    std_logic_vector(47 DOWNTO 0);  -- sfix48_En14
          dinRegVld                       :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          dinDly2                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16
          tapout                          :   OUT   std_logic_vector(47 DOWNTO 0)  -- sfix48_En14
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_FilterTapSystolicPreAddWvlIn
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          dinReg2_0_re                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16
          dinPreAdd                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16
          coefIn_0                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          addin                           :   IN    std_logic_vector(47 DOWNTO 0);  -- sfix48_En14
          dinRegVld                       :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          tapout                          :   OUT   std_logic_vector(47 DOWNTO 0)  -- sfix48_En14
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    USE ENTITY work.LTE_GENER_ip_src_FilterTapSystolicWvldInC0(rtl);

  FOR ALL : LTE_GENER_ip_src_FilterTapSystolicPreAddWvlIn
    USE ENTITY work.LTE_GENER_ip_src_FilterTapSystolicPreAddWvlIn(rtl);

  -- Signals
  SIGNAL intdelay_reg                     : std_logic_vector(0 TO 20);  -- ufix1 [21]
  SIGNAL vldShift                         : std_logic;
  SIGNAL vldOutTmp                        : std_logic;
  SIGNAL ZERO_OUT                         : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL addin                            : signed(47 DOWNTO 0);  -- sfix48_En14
  SIGNAL dinDly2                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout                           : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_1                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_1                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_2                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_2                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_3                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_3                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_4                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_4                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_5                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_5                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_6                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_6                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_7                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_7                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_8                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_8                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_9                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_9                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_10                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_10                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_11                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_11                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_12                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_12                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_13                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_13                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_14                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_14                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_15                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_15                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL ZERO                             : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL tapout_16                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL tapout_signed                    : signed(47 DOWNTO 0);  -- sfix48_En14
  SIGNAL dout_cast                        : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL muxOut                           : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL dout_1_re_tmp                    : signed(15 DOWNTO 0);  -- sfix16

BEGIN
  u_FilterTap_1 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinReg2_0_re,  -- sfix16
              addin => std_logic_vector(addin),  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2,  -- sfix16
              tapout => tapout  -- sfix48_En14
              );

  u_FilterTap_2 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2,  -- sfix16
              addin => tapout,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_1,  -- sfix16
              tapout => tapout_1  -- sfix48_En14
              );

  u_FilterTap_3 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_1,  -- sfix16
              addin => tapout_1,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_2,  -- sfix16
              tapout => tapout_2  -- sfix48_En14
              );

  u_FilterTap_4 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_2,  -- sfix16
              addin => tapout_2,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_3,  -- sfix16
              tapout => tapout_3  -- sfix48_En14
              );

  u_FilterTap_5 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_3,  -- sfix16
              addin => tapout_3,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_4,  -- sfix16
              tapout => tapout_4  -- sfix48_En14
              );

  u_FilterTap_6 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_4,  -- sfix16
              addin => tapout_4,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_5,  -- sfix16
              tapout => tapout_5  -- sfix48_En14
              );

  u_FilterTap_7 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_5,  -- sfix16
              addin => tapout_5,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_6,  -- sfix16
              tapout => tapout_6  -- sfix48_En14
              );

  u_FilterTap_8 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_6,  -- sfix16
              addin => tapout_6,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_7,  -- sfix16
              tapout => tapout_7  -- sfix48_En14
              );

  u_FilterTap_9 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_7,  -- sfix16
              addin => tapout_7,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_8,  -- sfix16
              tapout => tapout_8  -- sfix48_En14
              );

  u_FilterTap_10 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_8,  -- sfix16
              addin => tapout_8,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_9,  -- sfix16
              tapout => tapout_9  -- sfix48_En14
              );

  u_FilterTap_11 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_9,  -- sfix16
              addin => tapout_9,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_10,  -- sfix16
              tapout => tapout_10  -- sfix48_En14
              );

  u_FilterTap_12 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_10,  -- sfix16
              addin => tapout_10,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_11,  -- sfix16
              tapout => tapout_11  -- sfix48_En14
              );

  u_FilterTap_13 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_11,  -- sfix16
              addin => tapout_11,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_12,  -- sfix16
              tapout => tapout_12  -- sfix48_En14
              );

  u_FilterTap_14 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_12,  -- sfix16
              addin => tapout_12,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_13,  -- sfix16
              tapout => tapout_13  -- sfix48_En14
              );

  u_FilterTap_15 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_13,  -- sfix16
              addin => tapout_13,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_14,  -- sfix16
              tapout => tapout_14  -- sfix48_En14
              );

  u_FilterTap_16 : LTE_GENER_ip_src_FilterTapSystolicWvldInC0
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_14,  -- sfix16
              addin => tapout_14,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_15,  -- sfix16
              tapout => tapout_15  -- sfix48_En14
              );

  u_FilterTap_17 : LTE_GENER_ip_src_FilterTapSystolicPreAddWvlIn
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_15,  -- sfix16
              dinPreAdd => std_logic_vector(ZERO),  -- sfix16
              coefIn_0 => coefIn_16,  -- sfix16_En14
              addin => tapout_15,  -- sfix48_En14
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              tapout => tapout_16  -- sfix48_En14
              );

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        intdelay_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          intdelay_reg <= (OTHERS => '0');
        ELSIF dinRegVld = '1' THEN
          intdelay_reg(0) <= dinRegVld;
          intdelay_reg(1 TO 20) <= intdelay_reg(0 TO 19);
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;

  vldShift <= intdelay_reg(20);

  vldOutTmp <= dinRegVld AND vldShift;

  ZERO_OUT <= to_signed(16#0000#, 16);

  addin <= to_signed(0, 48);

  ZERO <= to_signed(16#0000#, 16);

  tapout_signed <= signed(tapout_16);

  dout_cast <= tapout_signed(29 DOWNTO 14);

  
  muxOut <= ZERO_OUT WHEN vldOutTmp = '0' ELSE
      dout_cast;

  intdelay_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dout_1_re_tmp <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          dout_1_re_tmp <= to_signed(16#0000#, 16);
        ELSE 
          dout_1_re_tmp <= muxOut;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  dout_1_re <= std_logic_vector(dout_1_re_tmp);

  intdelay_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        doutVld <= '0';
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          doutVld <= '0';
        ELSE 
          doutVld <= vldOutTmp;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


END rtl;
