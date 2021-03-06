-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\LTE_MIB_H_ip_src_subFilter_block3.vhd
-- Created: 2022-05-23 17:26:55
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_subFilter_block3
-- Source Path: zynqRadioHWSWLTEMIBDetectorRFSoC2x2/LTE_MIB_HDL/Preprocessor/Vector Decimator/Decimation/FIR Decimation 
-- HDL Optimized1/FilterBank/subFilte
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_subFilter_block3 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dinReg2_4_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_0                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        coefIn_1                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        coefIn_2                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        coefIn_3                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        coefIn_4                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        dinRegVld                         :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        dout_5_re                         :   OUT   std_logic_vector(32 DOWNTO 0)  -- sfix33_En31
        );
END LTE_MIB_H_ip_src_subFilter_block3;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_subFilter_block3 IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_FilterTapSystolicWvldin_block3
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          dinReg2_4_re                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_0                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
          addin                           :   IN    std_logic_vector(47 DOWNTO 0);  -- sfix48_En31
          dinRegVld                       :   IN    std_logic;
          dinDly2                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          tapout                          :   OUT   std_logic_vector(47 DOWNTO 0)  -- sfix48_En31
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_FilterTapSystolicWvldin_block3
    USE ENTITY work.LTE_MIB_H_ip_src_FilterTapSystolicWvldin_block3(rtl);

  -- Signals
  SIGNAL intdelay_reg                     : std_logic_vector(0 TO 7);  -- ufix1 [8]
  SIGNAL vldShift                         : std_logic;
  SIGNAL vldOutTmp                        : std_logic;
  SIGNAL addin                            : signed(47 DOWNTO 0);  -- sfix48_En31
  SIGNAL dinDly2                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout                           : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_1                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_1                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_2                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_2                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL dinDly2_3                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_3                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL ZERO_OUT                         : signed(32 DOWNTO 0);  -- sfix33_En31
  SIGNAL dinDly2deadOut                   : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL tapout_4                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL tapout_signed                    : signed(47 DOWNTO 0);  -- sfix48_En31
  SIGNAL dout_cast                        : signed(32 DOWNTO 0);  -- sfix33_En31
  SIGNAL muxOut                           : signed(32 DOWNTO 0);  -- sfix33_En31
  SIGNAL dout_5_re_tmp                    : signed(32 DOWNTO 0);  -- sfix33_En31

BEGIN
  u_FilterTap_1 : LTE_MIB_H_ip_src_FilterTapSystolicWvldin_block3
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_4_re => dinReg2_4_re,  -- sfix16_En15
              coefIn_0 => coefIn_0,  -- sfix16_En16
              addin => std_logic_vector(addin),  -- sfix48_En31
              dinRegVld => dinRegVld,
              dinDly2 => dinDly2,  -- sfix16_En15
              tapout => tapout  -- sfix48_En31
              );

  u_FilterTap_2 : LTE_MIB_H_ip_src_FilterTapSystolicWvldin_block3
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_4_re => dinDly2,  -- sfix16_En15
              coefIn_0 => coefIn_1,  -- sfix16_En16
              addin => tapout,  -- sfix48_En31
              dinRegVld => dinRegVld,
              dinDly2 => dinDly2_1,  -- sfix16_En15
              tapout => tapout_1  -- sfix48_En31
              );

  u_FilterTap_3 : LTE_MIB_H_ip_src_FilterTapSystolicWvldin_block3
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_4_re => dinDly2_1,  -- sfix16_En15
              coefIn_0 => coefIn_2,  -- sfix16_En16
              addin => tapout_1,  -- sfix48_En31
              dinRegVld => dinRegVld,
              dinDly2 => dinDly2_2,  -- sfix16_En15
              tapout => tapout_2  -- sfix48_En31
              );

  u_FilterTap_4 : LTE_MIB_H_ip_src_FilterTapSystolicWvldin_block3
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_4_re => dinDly2_2,  -- sfix16_En15
              coefIn_0 => coefIn_3,  -- sfix16_En16
              addin => tapout_2,  -- sfix48_En31
              dinRegVld => dinRegVld,
              dinDly2 => dinDly2_3,  -- sfix16_En15
              tapout => tapout_3  -- sfix48_En31
              );

  u_FilterTap_5 : LTE_MIB_H_ip_src_FilterTapSystolicWvldin_block3
    PORT MAP( clk => clk,
              enb => enb,
              dinReg2_4_re => dinDly2_3,  -- sfix16_En15
              coefIn_0 => coefIn_4,  -- sfix16_En16
              addin => tapout_3,  -- sfix48_En31
              dinRegVld => dinRegVld,
              dinDly2 => dinDly2deadOut,  -- sfix16_En15
              tapout => tapout_4  -- sfix48_En31
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
          intdelay_reg(1 TO 7) <= intdelay_reg(0 TO 6);
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;

  vldShift <= intdelay_reg(7);

  vldOutTmp <= dinRegVld AND vldShift;

  addin <= to_signed(0, 48);

  ZERO_OUT <= to_signed(0, 33);

  tapout_signed <= signed(tapout_4);

  dout_cast <= tapout_signed(32 DOWNTO 0);

  
  muxOut <= ZERO_OUT WHEN vldOutTmp = '0' ELSE
      dout_cast;

  intdelay_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dout_5_re_tmp <= to_signed(0, 33);
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          dout_5_re_tmp <= to_signed(0, 33);
        ELSE 
          dout_5_re_tmp <= muxOut;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  dout_5_re <= std_logic_vector(dout_5_re_tmp);

END rtl;

