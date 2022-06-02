-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2\LTE_GENER_ip_src_subFilter_block1.vhd
-- Created: 2022-05-23 17:12:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_GENER_ip_src_subFilter_block1
-- Source Path: zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2/LTE_GENERATOR/LTE_Generator/Vector Interpolator/FIR_Vector_Interp/Discrete 
-- FIR Filter HDL Optimized2/Filter/subFilte
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_GENER_ip_src_subFilter_block1 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dinReg2_0_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16
        coefIn_0                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_1                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_2                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_3                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_4                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_5                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_6                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_7                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_8                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_9                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_10                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_11                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_12                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_13                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_14                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_15                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_16                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_17                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_18                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_19                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_20                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_21                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_22                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_23                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_24                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_25                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_26                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_27                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_28                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_29                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_30                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_31                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dinRegVld                         :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        dout_1_re                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16
        doutVld                           :   OUT   std_logic
        );
END LTE_GENER_ip_src_subFilter_block1;


ARCHITECTURE rtl OF LTE_GENER_ip_src_subFilter_block1 IS

  -- Component Declarations
  COMPONENT LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          dinReg2_0_re                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16
          coefIn_0                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          addin                           :   IN    std_logic_vector(47 DOWNTO 0);  -- sfix48_En15
          dinRegVld                       :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          dinDly2                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16
          tapout                          :   OUT   std_logic_vector(47 DOWNTO 0)  -- sfix48_En15
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    USE ENTITY work.LTE_GENER_ip_src_FilterTapSystolicWvldin_block(rtl);

  -- Signals
  SIGNAL intdelay_reg                     : std_logic_vector(0 TO 34);  -- ufix1 [35]
  SIGNAL vldShift                         : std_logic;
  SIGNAL vldOutTmp                        : std_logic;
  SIGNAL ZERO_OUT                         : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL addin                            : signed(47 DOWNTO 0);  -- sfix48_En15
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
  SIGNAL dinDly2_16                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_16                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_17                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_17                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_18                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_18                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_19                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_19                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_20                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_20                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_21                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_21                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_22                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_22                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_23                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_23                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_24                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_24                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_25                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_25                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_26                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_26                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_27                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_27                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_28                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_28                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_29                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_29                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_30                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_30                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2deadOut                   : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_31                        : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL tapout_signed                    : signed(47 DOWNTO 0);  -- sfix48_En15
  SIGNAL dout_cast                        : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL muxOut                           : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL dout_1_re_tmp                    : signed(15 DOWNTO 0);  -- sfix16

BEGIN
  u_FilterTap_1 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinReg2_0_re,  -- sfix16
              coefIn_0 => coefIn_0,  -- sfix16_En15
              addin => std_logic_vector(addin),  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2,  -- sfix16
              tapout => tapout  -- sfix48_En15
              );

  u_FilterTap_2 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2,  -- sfix16
              coefIn_0 => coefIn_1,  -- sfix16_En15
              addin => tapout,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_1,  -- sfix16
              tapout => tapout_1  -- sfix48_En15
              );

  u_FilterTap_3 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_1,  -- sfix16
              coefIn_0 => coefIn_2,  -- sfix16_En15
              addin => tapout_1,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_2,  -- sfix16
              tapout => tapout_2  -- sfix48_En15
              );

  u_FilterTap_4 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_2,  -- sfix16
              coefIn_0 => coefIn_3,  -- sfix16_En15
              addin => tapout_2,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_3,  -- sfix16
              tapout => tapout_3  -- sfix48_En15
              );

  u_FilterTap_5 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_3,  -- sfix16
              coefIn_0 => coefIn_4,  -- sfix16_En15
              addin => tapout_3,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_4,  -- sfix16
              tapout => tapout_4  -- sfix48_En15
              );

  u_FilterTap_6 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_4,  -- sfix16
              coefIn_0 => coefIn_5,  -- sfix16_En15
              addin => tapout_4,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_5,  -- sfix16
              tapout => tapout_5  -- sfix48_En15
              );

  u_FilterTap_7 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_5,  -- sfix16
              coefIn_0 => coefIn_6,  -- sfix16_En15
              addin => tapout_5,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_6,  -- sfix16
              tapout => tapout_6  -- sfix48_En15
              );

  u_FilterTap_8 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_6,  -- sfix16
              coefIn_0 => coefIn_7,  -- sfix16_En15
              addin => tapout_6,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_7,  -- sfix16
              tapout => tapout_7  -- sfix48_En15
              );

  u_FilterTap_9 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_7,  -- sfix16
              coefIn_0 => coefIn_8,  -- sfix16_En15
              addin => tapout_7,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_8,  -- sfix16
              tapout => tapout_8  -- sfix48_En15
              );

  u_FilterTap_10 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_8,  -- sfix16
              coefIn_0 => coefIn_9,  -- sfix16_En15
              addin => tapout_8,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_9,  -- sfix16
              tapout => tapout_9  -- sfix48_En15
              );

  u_FilterTap_11 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_9,  -- sfix16
              coefIn_0 => coefIn_10,  -- sfix16_En15
              addin => tapout_9,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_10,  -- sfix16
              tapout => tapout_10  -- sfix48_En15
              );

  u_FilterTap_12 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_10,  -- sfix16
              coefIn_0 => coefIn_11,  -- sfix16_En15
              addin => tapout_10,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_11,  -- sfix16
              tapout => tapout_11  -- sfix48_En15
              );

  u_FilterTap_13 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_11,  -- sfix16
              coefIn_0 => coefIn_12,  -- sfix16_En15
              addin => tapout_11,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_12,  -- sfix16
              tapout => tapout_12  -- sfix48_En15
              );

  u_FilterTap_14 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_12,  -- sfix16
              coefIn_0 => coefIn_13,  -- sfix16_En15
              addin => tapout_12,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_13,  -- sfix16
              tapout => tapout_13  -- sfix48_En15
              );

  u_FilterTap_15 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_13,  -- sfix16
              coefIn_0 => coefIn_14,  -- sfix16_En15
              addin => tapout_13,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_14,  -- sfix16
              tapout => tapout_14  -- sfix48_En15
              );

  u_FilterTap_16 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_14,  -- sfix16
              coefIn_0 => coefIn_15,  -- sfix16_En15
              addin => tapout_14,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_15,  -- sfix16
              tapout => tapout_15  -- sfix48_En15
              );

  u_FilterTap_17 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_15,  -- sfix16
              coefIn_0 => coefIn_16,  -- sfix16_En15
              addin => tapout_15,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_16,  -- sfix16
              tapout => tapout_16  -- sfix48_En15
              );

  u_FilterTap_18 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_16,  -- sfix16
              coefIn_0 => coefIn_17,  -- sfix16_En15
              addin => tapout_16,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_17,  -- sfix16
              tapout => tapout_17  -- sfix48_En15
              );

  u_FilterTap_19 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_17,  -- sfix16
              coefIn_0 => coefIn_18,  -- sfix16_En15
              addin => tapout_17,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_18,  -- sfix16
              tapout => tapout_18  -- sfix48_En15
              );

  u_FilterTap_20 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_18,  -- sfix16
              coefIn_0 => coefIn_19,  -- sfix16_En15
              addin => tapout_18,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_19,  -- sfix16
              tapout => tapout_19  -- sfix48_En15
              );

  u_FilterTap_21 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_19,  -- sfix16
              coefIn_0 => coefIn_20,  -- sfix16_En15
              addin => tapout_19,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_20,  -- sfix16
              tapout => tapout_20  -- sfix48_En15
              );

  u_FilterTap_22 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_20,  -- sfix16
              coefIn_0 => coefIn_21,  -- sfix16_En15
              addin => tapout_20,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_21,  -- sfix16
              tapout => tapout_21  -- sfix48_En15
              );

  u_FilterTap_23 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_21,  -- sfix16
              coefIn_0 => coefIn_22,  -- sfix16_En15
              addin => tapout_21,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_22,  -- sfix16
              tapout => tapout_22  -- sfix48_En15
              );

  u_FilterTap_24 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_22,  -- sfix16
              coefIn_0 => coefIn_23,  -- sfix16_En15
              addin => tapout_22,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_23,  -- sfix16
              tapout => tapout_23  -- sfix48_En15
              );

  u_FilterTap_25 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_23,  -- sfix16
              coefIn_0 => coefIn_24,  -- sfix16_En15
              addin => tapout_23,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_24,  -- sfix16
              tapout => tapout_24  -- sfix48_En15
              );

  u_FilterTap_26 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_24,  -- sfix16
              coefIn_0 => coefIn_25,  -- sfix16_En15
              addin => tapout_24,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_25,  -- sfix16
              tapout => tapout_25  -- sfix48_En15
              );

  u_FilterTap_27 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_25,  -- sfix16
              coefIn_0 => coefIn_26,  -- sfix16_En15
              addin => tapout_25,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_26,  -- sfix16
              tapout => tapout_26  -- sfix48_En15
              );

  u_FilterTap_28 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_26,  -- sfix16
              coefIn_0 => coefIn_27,  -- sfix16_En15
              addin => tapout_26,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_27,  -- sfix16
              tapout => tapout_27  -- sfix48_En15
              );

  u_FilterTap_29 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_27,  -- sfix16
              coefIn_0 => coefIn_28,  -- sfix16_En15
              addin => tapout_27,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_28,  -- sfix16
              tapout => tapout_28  -- sfix48_En15
              );

  u_FilterTap_30 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_28,  -- sfix16
              coefIn_0 => coefIn_29,  -- sfix16_En15
              addin => tapout_28,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_29,  -- sfix16
              tapout => tapout_29  -- sfix48_En15
              );

  u_FilterTap_31 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_29,  -- sfix16
              coefIn_0 => coefIn_30,  -- sfix16_En15
              addin => tapout_29,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2_30,  -- sfix16
              tapout => tapout_30  -- sfix48_En15
              );

  u_FilterTap_32 : LTE_GENER_ip_src_FilterTapSystolicWvldin_block
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_0_re => dinDly2_30,  -- sfix16
              coefIn_0 => coefIn_31,  -- sfix16_En15
              addin => tapout_30,  -- sfix48_En15
              dinRegVld => dinRegVld,
              syncReset => syncReset,
              dinDly2 => dinDly2deadOut,  -- sfix16
              tapout => tapout_31  -- sfix48_En15
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
          intdelay_reg(1 TO 34) <= intdelay_reg(0 TO 33);
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;

  vldShift <= intdelay_reg(34);

  vldOutTmp <= dinRegVld AND vldShift;

  ZERO_OUT <= to_signed(16#0000#, 16);

  addin <= to_signed(0, 48);

  tapout_signed <= signed(tapout_31);

  dout_cast <= tapout_signed(30 DOWNTO 15);

  
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

