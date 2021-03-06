-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Transient_Removal.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Transient_Removal
-- Source Path: ltehdlDownlinkSyncDemod/Decimation Filters/Transient Removal
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Transient_Removal IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        validIn                           :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validOut                          :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Transient_Removal;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Transient_Removal IS

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(0 TO 41);  -- ufix1 [42]
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL in0_re_signed                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL in0_im_signed                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL enb_gated                        : std_logic;
  SIGNAL dataOut_re_1                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataOut_im_1                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL count                            : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL dataOutReg_re                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataOutReg_im                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL validOutReg                      : std_logic;
  SIGNAL count_next                       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL dataOutReg_next_re               : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataOutReg_next_im               : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL validOutReg_next                 : std_logic;

BEGIN
  stateControl_1 <= '1';

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch_reg(0) <= stateControl_1;
        delayMatch_reg(1 TO 41) <= delayMatch_reg(0 TO 40);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  stateControl_2 <= delayMatch_reg(41);

  in0_re_signed <= signed(dataIn_re);

  in0_im_signed <= signed(dataIn_im);

  enb_gated <= stateControl_2 AND enb;

  Transient_Removal_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        count <= to_unsigned(16#0#, 3);
        dataOutReg_re <= to_signed(16#0000#, 16);
        dataOutReg_im <= to_signed(16#0000#, 16);
        validOutReg <= '0';
      ELSIF enb_gated = '1' THEN
        count <= count_next;
        dataOutReg_re <= dataOutReg_next_re;
        dataOutReg_im <= dataOutReg_next_im;
        validOutReg <= validOutReg_next;
      END IF;
    END IF;
  END PROCESS Transient_Removal_process;

  Transient_Removal_output : PROCESS (count, dataOutReg_im, dataOutReg_re, in0_im_signed, in0_re_signed, validIn,
       validOutReg)
  BEGIN
    count_next <= count;
    dataOutReg_next_re <= dataOutReg_re;
    dataOutReg_next_im <= dataOutReg_im;
    validOutReg_next <= validOutReg;
    IF (validIn AND hdlcoder_to_stdlogic(count = to_unsigned(16#7#, 3))) = '1' THEN 
      dataOutReg_next_re <= in0_re_signed;
      dataOutReg_next_im <= in0_im_signed;
      validOutReg_next <= '1';
    ELSE 
      validOutReg_next <= '0';
    END IF;
    IF (validIn AND hdlcoder_to_stdlogic(count /= to_unsigned(16#7#, 3))) = '1' THEN 
      count_next <= count + to_unsigned(16#1#, 3);
    END IF;
    dataOut_re_1 <= dataOutReg_re;
    dataOut_im_1 <= dataOutReg_im;
    validOut <= validOutReg;
  END PROCESS Transient_Removal_output;


  dataOut_re <= std_logic_vector(dataOut_re_1);

  dataOut_im <= std_logic_vector(dataOut_im_1);

END rtl;

