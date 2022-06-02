-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2\LTE_GENER_ip_src_FilterTapSystolicWvldin_block3.vhd
-- Created: 2022-05-23 17:12:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_GENER_ip_src_FilterTapSystolicWvldin_block3
-- Source Path: zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2/LTE_GENERATOR/LTE_Generator/Vector Interpolator/FIR_Vector_Interp/Discrete 
-- FIR Filter HDL Optimized6/Filter/subFilter/FilterTapSystolicWvldi
-- Hierarchy Level: 7
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_GENER_ip_src_FilterTapSystolicWvldin_block3 IS
  PORT( clk                               :   IN    std_logic;
        enb                               :   IN    std_logic;
        dinReg2_0_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16
        coefIn_0                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        addin                             :   IN    std_logic_vector(47 DOWNTO 0);  -- sfix48_En15
        dinRegVld                         :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        dinDly2                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16
        tapout                            :   OUT   std_logic_vector(47 DOWNTO 0)  -- sfix48_En15
        );
END LTE_GENER_ip_src_FilterTapSystolicWvldin_block3;


ARCHITECTURE rtl OF LTE_GENER_ip_src_FilterTapSystolicWvldin_block3 IS

  -- Signals
  SIGNAL dinReg2_0_re_signed              : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL coefIn_0_signed                  : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL addin_signed                     : signed(47 DOWNTO 0);  -- sfix48_En15
  SIGNAL fTap_din_reg1                    : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16
  SIGNAL fTap_coef_reg1                   : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16
  SIGNAL fTap_din_reg2                    : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16
  SIGNAL fTap_coef_reg2                   : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16
  SIGNAL fTap_mult_reg                    : signed(31 DOWNTO 0) := to_signed(0, 32);  -- sfix32
  SIGNAL fTap_addout_reg                  : signed(47 DOWNTO 0) := to_signed(0, 48);  -- sfix48
  SIGNAL fTap_din_reg1_next               : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL fTap_coef_reg1_next              : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL fTap_din_reg2_next               : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL fTap_coef_reg2_next              : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL fTap_mult_reg_next               : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL fTap_addout_reg_next             : signed(47 DOWNTO 0);  -- sfix48_En15
  SIGNAL dinDly2_tmp                      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL tapout_tmp                       : signed(47 DOWNTO 0);  -- sfix48_En15

BEGIN
  dinReg2_0_re_signed <= signed(dinReg2_0_re);

  coefIn_0_signed <= signed(coefIn_0);

  addin_signed <= signed(addin);

  -- FilterTapSystlicWvldIn
  fTap_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF syncReset = '1' THEN
          fTap_din_reg1 <= to_signed(16#0000#, 16);
          fTap_coef_reg1 <= to_signed(16#0000#, 16);
          fTap_din_reg2 <= to_signed(16#0000#, 16);
          fTap_coef_reg2 <= to_signed(16#0000#, 16);
          fTap_mult_reg <= to_signed(0, 32);
          fTap_addout_reg <= to_signed(0, 48);
        ELSE 
          fTap_din_reg1 <= fTap_din_reg1_next;
          fTap_coef_reg1 <= fTap_coef_reg1_next;
          fTap_din_reg2 <= fTap_din_reg2_next;
          fTap_coef_reg2 <= fTap_coef_reg2_next;
          fTap_mult_reg <= fTap_mult_reg_next;
          fTap_addout_reg <= fTap_addout_reg_next;
        END IF;
      END IF;
    END IF;
  END PROCESS fTap_process;

  fTap_output : PROCESS (addin_signed, coefIn_0_signed, dinReg2_0_re_signed, dinRegVld, fTap_addout_reg,
       fTap_coef_reg1, fTap_coef_reg2, fTap_din_reg1, fTap_din_reg2,
       fTap_mult_reg)
    VARIABLE add_cast : signed(47 DOWNTO 0);
  BEGIN
    add_cast := to_signed(0, 48);
    fTap_din_reg1_next <= fTap_din_reg1;
    fTap_coef_reg1_next <= fTap_coef_reg1;
    fTap_din_reg2_next <= fTap_din_reg2;
    fTap_coef_reg2_next <= fTap_coef_reg2;
    fTap_mult_reg_next <= fTap_mult_reg;
    fTap_addout_reg_next <= fTap_addout_reg;
    IF dinRegVld = '1' THEN 
      add_cast := resize(fTap_mult_reg, 48);
      fTap_addout_reg_next <= add_cast + addin_signed;
      fTap_mult_reg_next <= fTap_din_reg2 * fTap_coef_reg2;
      fTap_din_reg2_next <= fTap_din_reg1;
      fTap_coef_reg2_next <= fTap_coef_reg1;
      fTap_din_reg1_next <= dinReg2_0_re_signed;
      fTap_coef_reg1_next <= coefIn_0_signed;
    END IF;
    dinDly2_tmp <= fTap_din_reg2;
    tapout_tmp <= fTap_addout_reg;
  END PROCESS fTap_output;


  dinDly2 <= std_logic_vector(dinDly2_tmp);

  tapout <= std_logic_vector(tapout_tmp);

END rtl;
