-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FilterTapSystolic_block2.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FilterTapSystolic_block2
-- Source Path: ltehdlDownlinkSyncDemod/Sync Signal Search/PSS Searcher/Correlators/PSSXCorr1/C/FilterTapSystolic
-- Hierarchy Level: 8
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FilterTapSystolic_block2 IS
  PORT( clk                               :   IN    std_logic;
        enb                               :   IN    std_logic;
        din_re                            :   IN    std_logic_vector(16 DOWNTO 0);  -- ufix17
        coeff                             :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        sumIn                             :   IN    std_logic_vector(28 DOWNTO 0);  -- ufix29
        sumOut                            :   OUT   std_logic_vector(28 DOWNTO 0)  -- ufix29
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FilterTapSystolic_block2;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FilterTapSystolic_block2 IS

  -- Signals
  SIGNAL din_re_signed                    : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL coeff_signed                     : signed(7 DOWNTO 0);  -- sfix8_En9
  SIGNAL sumIn_signed                     : signed(28 DOWNTO 0);  -- sfix29_En24
  SIGNAL fTap_din_reg1                    : signed(16 DOWNTO 0) := to_signed(16#00000#, 17);  -- sfix17
  SIGNAL fTap_coef_reg1                   : signed(7 DOWNTO 0) := to_signed(16#00#, 8);  -- sfix8
  SIGNAL fTap_din_reg2                    : signed(16 DOWNTO 0) := to_signed(16#00000#, 17);  -- sfix17
  SIGNAL fTap_coef_reg2                   : signed(7 DOWNTO 0) := to_signed(16#00#, 8);  -- sfix8
  SIGNAL fTap_mult_reg                    : signed(24 DOWNTO 0) := to_signed(16#0000000#, 25);  -- sfix25
  SIGNAL fTap_addout_reg                  : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29
  SIGNAL fTap_addout_reg_next             : signed(28 DOWNTO 0);  -- sfix29_En24
  SIGNAL fTap_add_cast                    : signed(28 DOWNTO 0);  -- sfix29_En24
  SIGNAL sumOut_tmp                       : signed(28 DOWNTO 0);  -- sfix29_En24

BEGIN
  din_re_signed <= signed(din_re);

  coeff_signed <= signed(coeff);

  sumIn_signed <= signed(sumIn);

  -- FilterTapSystolicS
  fTap_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        fTap_addout_reg <= fTap_addout_reg_next;
        fTap_mult_reg <= fTap_din_reg2 * fTap_coef_reg2;
        fTap_din_reg2 <= fTap_din_reg1;
        fTap_coef_reg2 <= fTap_coef_reg1;
        fTap_din_reg1 <= din_re_signed;
        fTap_coef_reg1 <= coeff_signed;
      END IF;
    END IF;
  END PROCESS fTap_process;

  sumOut_tmp <= fTap_addout_reg;
  fTap_add_cast <= resize(fTap_mult_reg, 29);
  fTap_addout_reg_next <= fTap_add_cast + sumIn_signed;

  sumOut <= std_logic_vector(sumOut_tmp);

END rtl;

