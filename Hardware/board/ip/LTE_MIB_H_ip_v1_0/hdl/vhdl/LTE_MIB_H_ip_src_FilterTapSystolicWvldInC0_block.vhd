-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\LTE_MIB_H_ip_src_FilterTapSystolicWvldInC0_block.vhd
-- Created: 2022-05-23 17:26:55
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_FilterTapSystolicWvldInC0_block
-- Source Path: zynqRadioHWSWLTEMIBDetectorRFSoC2x2/LTE_MIB_HDL/Preprocessor/Vector Decimator/Decimation/FIR Decimation 
-- HDL Optimized1/FilterBank/subFilter/FilterTapSystolicWvldInC
-- Hierarchy Level: 7
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_FilterTapSystolicWvldInC0_block IS
  PORT( clk                               :   IN    std_logic;
        enb                               :   IN    std_logic;
        dinReg2_1_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        addin                             :   IN    std_logic_vector(47 DOWNTO 0);  -- sfix48_En31
        dinRegVld                         :   IN    std_logic;
        tapout                            :   OUT   std_logic_vector(47 DOWNTO 0)  -- sfix48_En31
        );
END LTE_MIB_H_ip_src_FilterTapSystolicWvldInC0_block;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_FilterTapSystolicWvldInC0_block IS

  -- Signals
  SIGNAL dinReg2_1_re_signed              : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL addin_signed                     : signed(47 DOWNTO 0);  -- sfix48_En31
  SIGNAL fTap_din1_reg1                   : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16
  SIGNAL fTap_din1_reg2                   : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16
  SIGNAL fTap_addout_reg                  : signed(47 DOWNTO 0) := to_signed(0, 48);  -- sfix48
  SIGNAL fTap_din1_reg1_next              : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL fTap_din1_reg2_next              : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL fTap_addout_reg_next             : signed(47 DOWNTO 0);  -- sfix48_En31
  SIGNAL dinDly2                          : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL tapout_tmp                       : signed(47 DOWNTO 0);  -- sfix48_En31

BEGIN
  dinReg2_1_re_signed <= signed(dinReg2_1_re);

  addin_signed <= signed(addin);

  -- FilterTapSystolicWvldInC0
  fTap_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        fTap_din1_reg1 <= fTap_din1_reg1_next;
        fTap_din1_reg2 <= fTap_din1_reg2_next;
        fTap_addout_reg <= fTap_addout_reg_next;
      END IF;
    END IF;
  END PROCESS fTap_process;

  fTap_output : PROCESS (addin_signed, dinReg2_1_re_signed, dinRegVld, fTap_addout_reg, fTap_din1_reg1,
       fTap_din1_reg2)
  BEGIN
    fTap_din1_reg1_next <= fTap_din1_reg1;
    fTap_din1_reg2_next <= fTap_din1_reg2;
    fTap_addout_reg_next <= fTap_addout_reg;
    IF dinRegVld = '1' THEN 
      fTap_addout_reg_next <= addin_signed;
    END IF;
    IF dinRegVld = '1' THEN 
      fTap_din1_reg2_next <= fTap_din1_reg1;
      fTap_din1_reg1_next <= dinReg2_1_re_signed;
    END IF;
    dinDly2 <= fTap_din1_reg2;
    tapout_tmp <= fTap_addout_reg;
  END PROCESS fTap_output;


  tapout <= std_logic_vector(tapout_tmp);

END rtl;

