-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Complex3Multiply.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Complex3Multiply
-- Source Path: ltehdlDownlinkSyncDemod/OFDM Demodulation/FFT HDL Optimized/RADIX22FFT_SDF1_3/Complex3Multiply
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Complex3Multiply IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        din_re                            :   IN    std_logic_vector(18 DOWNTO 0);  -- ufix19
        din_im                            :   IN    std_logic_vector(18 DOWNTO 0);  -- ufix19
        din_3_vld_dly                     :   IN    std_logic;
        twdl_3_1_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        twdl_3_1_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        syncReset                         :   IN    std_logic;
        dinXTwdl_re                       :   OUT   std_logic_vector(18 DOWNTO 0);  -- ufix19
        dinXTwdl_im                       :   OUT   std_logic_vector(18 DOWNTO 0);  -- ufix19
        dinXTwdl_3_1_vld                  :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Complex3Multiply;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Complex3Multiply IS

  -- Signals
  SIGNAL din_re_signed                    : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL din_re_reg                       : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL din_im_signed                    : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL din_im_reg                       : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL adder_add_cast                   : signed(19 DOWNTO 0);  -- sfix20_En15
  SIGNAL adder_add_cast_1                 : signed(19 DOWNTO 0);  -- sfix20_En15
  SIGNAL din_sum                          : signed(19 DOWNTO 0);  -- sfix20_En15
  SIGNAL twdl_3_1_re_signed               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twdl_re_reg                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twdl_3_1_im_signed               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twdl_im_reg                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL adder_add_cast_2                 : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL adder_add_cast_3                 : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL twdl_sum                         : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Complex3Multiply_din1_re_pipe1   : signed(18 DOWNTO 0) := to_signed(16#00000#, 19);  -- sfix19
  SIGNAL Complex3Multiply_din1_im_pipe1   : signed(18 DOWNTO 0) := to_signed(16#00000#, 19);  -- sfix19
  SIGNAL Complex3Multiply_din1_sum_pipe1  : signed(19 DOWNTO 0) := to_signed(16#00000#, 20);  -- sfix20
  SIGNAL Complex3Multiply_prodOfRe_pipe1  : signed(34 DOWNTO 0) := to_signed(0, 35);  -- sfix35
  SIGNAL Complex3Multiply_ProdOfIm_pipe1  : signed(34 DOWNTO 0) := to_signed(0, 35);  -- sfix35
  SIGNAL Complex3Multiply_prodOfSum_pipe1 : signed(36 DOWNTO 0) := to_signed(0, 37);  -- sfix37
  SIGNAL Complex3Multiply_twiddle_re_pipe1 : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16
  SIGNAL Complex3Multiply_twiddle_im_pipe1 : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16
  SIGNAL Complex3Multiply_twiddle_sum_pipe1 : signed(16 DOWNTO 0) := to_signed(16#00000#, 17);  -- sfix17
  SIGNAL prodOfRe                         : signed(34 DOWNTO 0) := to_signed(0, 35);  -- sfix35_En29
  SIGNAL prodOfIm                         : signed(34 DOWNTO 0) := to_signed(0, 35);  -- sfix35_En29
  SIGNAL prodOfSum                        : signed(36 DOWNTO 0) := to_signed(0, 37);  -- sfix37_En29
  SIGNAL din_vld_dly1                     : std_logic;
  SIGNAL din_vld_dly2                     : std_logic;
  SIGNAL din_vld_dly3                     : std_logic;
  SIGNAL prod_vld                         : std_logic;
  SIGNAL Complex3Add_tmpResult_reg        : signed(36 DOWNTO 0);  -- sfix37
  SIGNAL Complex3Add_multRes_re_reg1      : signed(35 DOWNTO 0);  -- sfix36
  SIGNAL Complex3Add_multRes_re_reg2      : signed(35 DOWNTO 0);  -- sfix36
  SIGNAL Complex3Add_multRes_im_reg       : signed(37 DOWNTO 0);  -- sfix38
  SIGNAL Complex3Add_prod_vld_reg1        : std_logic;
  SIGNAL Complex3Add_prodOfSum_reg        : signed(36 DOWNTO 0);  -- sfix37
  SIGNAL Complex3Add_tmpResult_reg_next   : signed(36 DOWNTO 0);  -- sfix37_En29
  SIGNAL Complex3Add_multRes_re_reg1_next : signed(35 DOWNTO 0);  -- sfix36_En29
  SIGNAL Complex3Add_multRes_re_reg2_next : signed(35 DOWNTO 0);  -- sfix36_En29
  SIGNAL Complex3Add_multRes_im_reg_next  : signed(37 DOWNTO 0);  -- sfix38_En29
  SIGNAL Complex3Add_sub_cast             : signed(35 DOWNTO 0);  -- sfix36_En29
  SIGNAL Complex3Add_sub_cast_1           : signed(35 DOWNTO 0);  -- sfix36_En29
  SIGNAL Complex3Add_sub_cast_2           : signed(37 DOWNTO 0);  -- sfix38_En29
  SIGNAL Complex3Add_sub_cast_3           : signed(37 DOWNTO 0);  -- sfix38_En29
  SIGNAL Complex3Add_add_cast             : signed(35 DOWNTO 0);  -- sfix36_En29
  SIGNAL Complex3Add_add_cast_1           : signed(35 DOWNTO 0);  -- sfix36_En29
  SIGNAL Complex3Add_add_temp             : signed(35 DOWNTO 0);  -- sfix36_En29
  SIGNAL multResFP_re                     : signed(35 DOWNTO 0);  -- sfix36_En29
  SIGNAL multResFP_im                     : signed(37 DOWNTO 0);  -- sfix38_En29
  SIGNAL dinXTwdl_re_tmp                  : signed(18 DOWNTO 0);  -- sfix19_En15
  SIGNAL dinXTwdl_im_tmp                  : signed(18 DOWNTO 0);  -- sfix19_En15

BEGIN
  din_re_signed <= signed(din_re);

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        din_re_reg <= to_signed(16#00000#, 19);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          din_re_reg <= to_signed(16#00000#, 19);
        ELSE 
          din_re_reg <= din_re_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  din_im_signed <= signed(din_im);

  intdelay_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        din_im_reg <= to_signed(16#00000#, 19);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          din_im_reg <= to_signed(16#00000#, 19);
        ELSE 
          din_im_reg <= din_im_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  adder_add_cast <= resize(din_re_reg, 20);
  adder_add_cast_1 <= resize(din_im_reg, 20);
  din_sum <= adder_add_cast + adder_add_cast_1;

  twdl_3_1_re_signed <= signed(twdl_3_1_re);

  intdelay_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        twdl_re_reg <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          twdl_re_reg <= to_signed(16#0000#, 16);
        ELSE 
          twdl_re_reg <= twdl_3_1_re_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  twdl_3_1_im_signed <= signed(twdl_3_1_im);

  intdelay_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        twdl_im_reg <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          twdl_im_reg <= to_signed(16#0000#, 16);
        ELSE 
          twdl_im_reg <= twdl_3_1_im_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  adder_add_cast_2 <= resize(twdl_re_reg, 17);
  adder_add_cast_3 <= resize(twdl_im_reg, 17);
  twdl_sum <= adder_add_cast_2 + adder_add_cast_3;

  -- Complex3Multiply
  Complex3Multiply_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        prodOfRe <= Complex3Multiply_prodOfRe_pipe1;
        prodOfIm <= Complex3Multiply_ProdOfIm_pipe1;
        prodOfSum <= Complex3Multiply_prodOfSum_pipe1;
        Complex3Multiply_prodOfRe_pipe1 <= Complex3Multiply_din1_re_pipe1 * Complex3Multiply_twiddle_re_pipe1;
        Complex3Multiply_ProdOfIm_pipe1 <= Complex3Multiply_din1_im_pipe1 * Complex3Multiply_twiddle_im_pipe1;
        Complex3Multiply_prodOfSum_pipe1 <= Complex3Multiply_din1_sum_pipe1 * Complex3Multiply_twiddle_sum_pipe1;
        Complex3Multiply_twiddle_re_pipe1 <= twdl_re_reg;
        Complex3Multiply_twiddle_im_pipe1 <= twdl_im_reg;
        Complex3Multiply_twiddle_sum_pipe1 <= twdl_sum;
        Complex3Multiply_din1_re_pipe1 <= din_re_reg;
        Complex3Multiply_din1_im_pipe1 <= din_im_reg;
        Complex3Multiply_din1_sum_pipe1 <= din_sum;
      END IF;
    END IF;
  END PROCESS Complex3Multiply_process;


  intdelay_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        din_vld_dly1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          din_vld_dly1 <= '0';
        ELSE 
          din_vld_dly1 <= din_3_vld_dly;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  intdelay_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        din_vld_dly2 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          din_vld_dly2 <= '0';
        ELSE 
          din_vld_dly2 <= din_vld_dly1;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  intdelay_6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        din_vld_dly3 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          din_vld_dly3 <= '0';
        ELSE 
          din_vld_dly3 <= din_vld_dly2;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  intdelay_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        prod_vld <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          prod_vld <= '0';
        ELSE 
          prod_vld <= din_vld_dly3;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  -- Complex3Add
  Complex3Add_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Complex3Add_prodOfSum_reg <= to_signed(0, 37);
        Complex3Add_tmpResult_reg <= to_signed(0, 37);
        Complex3Add_multRes_re_reg1 <= to_signed(0, 36);
        Complex3Add_multRes_re_reg2 <= to_signed(0, 36);
        Complex3Add_multRes_im_reg <= to_signed(0, 38);
        Complex3Add_prod_vld_reg1 <= '0';
        dinXTwdl_3_1_vld <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          Complex3Add_prodOfSum_reg <= to_signed(0, 37);
          Complex3Add_tmpResult_reg <= to_signed(0, 37);
          Complex3Add_multRes_re_reg1 <= to_signed(0, 36);
          Complex3Add_multRes_re_reg2 <= to_signed(0, 36);
          Complex3Add_multRes_im_reg <= to_signed(0, 38);
          Complex3Add_prod_vld_reg1 <= '0';
          dinXTwdl_3_1_vld <= '0';
        ELSE 
          Complex3Add_tmpResult_reg <= Complex3Add_tmpResult_reg_next;
          Complex3Add_multRes_re_reg1 <= Complex3Add_multRes_re_reg1_next;
          Complex3Add_multRes_re_reg2 <= Complex3Add_multRes_re_reg2_next;
          Complex3Add_multRes_im_reg <= Complex3Add_multRes_im_reg_next;
          Complex3Add_prodOfSum_reg <= prodOfSum;
          dinXTwdl_3_1_vld <= Complex3Add_prod_vld_reg1;
          Complex3Add_prod_vld_reg1 <= prod_vld;
        END IF;
      END IF;
    END IF;
  END PROCESS Complex3Add_process;

  Complex3Add_multRes_re_reg2_next <= Complex3Add_multRes_re_reg1;
  Complex3Add_sub_cast <= resize(prodOfRe, 36);
  Complex3Add_sub_cast_1 <= resize(prodOfIm, 36);
  Complex3Add_multRes_re_reg1_next <= Complex3Add_sub_cast - Complex3Add_sub_cast_1;
  Complex3Add_sub_cast_2 <= resize(Complex3Add_prodOfSum_reg, 38);
  Complex3Add_sub_cast_3 <= resize(Complex3Add_tmpResult_reg, 38);
  Complex3Add_multRes_im_reg_next <= Complex3Add_sub_cast_2 - Complex3Add_sub_cast_3;
  Complex3Add_add_cast <= resize(prodOfRe, 36);
  Complex3Add_add_cast_1 <= resize(prodOfIm, 36);
  Complex3Add_add_temp <= Complex3Add_add_cast + Complex3Add_add_cast_1;
  Complex3Add_tmpResult_reg_next <= resize(Complex3Add_add_temp, 37);
  multResFP_re <= Complex3Add_multRes_re_reg2;
  multResFP_im <= Complex3Add_multRes_im_reg;

  dinXTwdl_re_tmp <= multResFP_re(32 DOWNTO 14) + ('0' & (multResFP_re(13) AND (( NOT multResFP_re(35)) OR (multResFP_re(12) OR multResFP_re(11) OR multResFP_re(10) OR multResFP_re(9) OR multResFP_re(8) OR multResFP_re(7) OR multResFP_re(6) OR multResFP_re(5) OR multResFP_re(4) OR multResFP_re(3) OR multResFP_re(2) OR multResFP_re(1) OR multResFP_re(0)))));

  dinXTwdl_re <= std_logic_vector(dinXTwdl_re_tmp);

  dinXTwdl_im_tmp <= multResFP_im(32 DOWNTO 14) + ('0' & (multResFP_im(13) AND (( NOT multResFP_im(37)) OR (multResFP_im(12) OR multResFP_im(11) OR multResFP_im(10) OR multResFP_im(9) OR multResFP_im(8) OR multResFP_im(7) OR multResFP_im(6) OR multResFP_im(5) OR multResFP_im(4) OR multResFP_im(3) OR multResFP_im(2) OR multResFP_im(1) OR multResFP_im(0)))));

  dinXTwdl_im <= std_logic_vector(dinXTwdl_im_tmp);

END rtl;
