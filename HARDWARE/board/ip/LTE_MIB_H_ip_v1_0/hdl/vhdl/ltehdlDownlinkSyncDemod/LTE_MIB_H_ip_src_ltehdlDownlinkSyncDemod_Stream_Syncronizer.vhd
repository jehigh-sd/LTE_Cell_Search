-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Stream_Syncronizer.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Stream_Syncronizer
-- Source Path: ltehdlDownlinkSyncDemod/Sync Signal Search/Stream Syncronizer
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_ltehdlDownlinkSyncDemod_pac.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Stream_Syncronizer IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        pop                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        push                              :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validOut                          :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Stream_Syncronizer;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Stream_Syncronizer IS

  -- Signals
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(0 TO 41);  -- ufix1 [42]
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL enb_gated                        : std_logic;
  SIGNAL in1_re_signed                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL in1_im_signed                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataOut_re_1                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataOut_im_1                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL validOut_1                       : std_logic;
  SIGNAL wrAddr                           : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL rdAddr                           : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL dataOutReg_re                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataOutReg_im                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL validOutReg                      : std_logic;
  SIGNAL mem_re                           : vector_of_signed16(0 TO 127);  -- sfix16_En15 [128]
  SIGNAL mem_im                           : vector_of_signed16(0 TO 127);  -- sfix16_En15 [128]
  SIGNAL level                            : signed(15 DOWNTO 0);  -- int16
  SIGNAL wrAddr_next                      : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL rdAddr_next                      : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL dataOutReg_next_re               : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataOutReg_next_im               : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL validOutReg_next                 : std_logic;
  SIGNAL mem_next_re                      : vector_of_signed16(0 TO 127);  -- sfix16_En15 [128]
  SIGNAL mem_next_im                      : vector_of_signed16(0 TO 127);  -- sfix16_En15 [128]
  SIGNAL level_next                       : signed(15 DOWNTO 0);  -- int16
  SIGNAL dataOut_bypass_re                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataOut_bypass_im                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataOut_last_value_re            : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataOut_last_value_im            : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL validOut_2                       : std_logic;
  SIGNAL validOut_last_value              : std_logic;

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

  enb_gated <= stateControl_2 AND enb;

  in1_re_signed <= signed(dataIn_re);

  in1_im_signed <= signed(dataIn_im);

  Stream_Syncronizer_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        wrAddr <= to_unsigned(16#00#, 7);
        rdAddr <= to_unsigned(16#00#, 7);
        dataOutReg_re <= to_signed(16#0000#, 16);
        dataOutReg_im <= to_signed(16#0000#, 16);
        validOutReg <= '0';
        mem_re <= (OTHERS => to_signed(16#0000#, 16));
        mem_im <= (OTHERS => to_signed(16#0000#, 16));
        level <= to_signed(16#0000#, 16);
      ELSIF enb_gated = '1' THEN
        wrAddr <= wrAddr_next;
        rdAddr <= rdAddr_next;
        dataOutReg_re <= dataOutReg_next_re;
        dataOutReg_im <= dataOutReg_next_im;
        validOutReg <= validOutReg_next;
        mem_re <= mem_next_re;
        mem_im <= mem_next_im;
        level <= level_next;
      END IF;
    END IF;
  END PROCESS Stream_Syncronizer_process;

  Stream_Syncronizer_output : PROCESS (dataOutReg_im, dataOutReg_re, in1_im_signed, in1_re_signed, level, mem_im,
       mem_re, pop, push, rdAddr, validOutReg, wrAddr)
    VARIABLE level_temp : signed(15 DOWNTO 0);
    VARIABLE sub_temp : signed(16 DOWNTO 0);
    VARIABLE add_temp : signed(16 DOWNTO 0);
  BEGIN
    sub_temp := to_signed(16#00000#, 17);
    add_temp := to_signed(16#00000#, 17);
    level_temp := level;
    wrAddr_next <= wrAddr;
    rdAddr_next <= rdAddr;
    dataOutReg_next_re <= dataOutReg_re;
    dataOutReg_next_im <= dataOutReg_im;
    mem_next_re <= mem_re;
    mem_next_im <= mem_im;
    --------------------------------------------------------------------------
    -- Constants
    --------------------------------------------------------------------------
    -- Persistent variable initialization
    --------------------------------------------------------------------------
    --------------------------------------------------------------------------
    -- Outputs
    --------------------------------------------------------------------------
    --------------------------------------------------------------------------
    -- Calculate next state values
    --------------------------------------------------------------------------
    IF pop = '1' THEN 
      dataOutReg_next_re <= mem_re(to_integer(rdAddr));
      dataOutReg_next_im <= mem_im(to_integer(rdAddr));
      rdAddr_next <= rdAddr + to_unsigned(16#01#, 7);
      sub_temp := resize(level, 17) - to_signed(16#00001#, 17);
      IF (sub_temp(16) = '0') AND (sub_temp(15) /= '0') THEN 
        level_temp := X"7FFF";
      ELSIF (sub_temp(16) = '1') AND (sub_temp(15) /= '1') THEN 
        level_temp := X"8000";
      ELSE 
        level_temp := sub_temp(15 DOWNTO 0);
      END IF;
    END IF;
    IF push = '1' THEN 
      mem_next_re(to_integer(wrAddr)) <= in1_re_signed;
      mem_next_im(to_integer(wrAddr)) <= in1_im_signed;
      wrAddr_next <= wrAddr + to_unsigned(16#01#, 7);
      add_temp := resize(level_temp, 17) + to_signed(16#00001#, 17);
      IF (add_temp(16) = '0') AND (add_temp(15) /= '0') THEN 
        level_temp := X"7FFF";
      ELSIF (add_temp(16) = '1') AND (add_temp(15) /= '1') THEN 
        level_temp := X"8000";
      ELSE 
        level_temp := add_temp(15 DOWNTO 0);
      END IF;
    END IF;
    validOutReg_next <= pop;
    dataOut_re_1 <= dataOutReg_re;
    dataOut_im_1 <= dataOutReg_im;
    validOut_1 <= validOutReg;
    level_next <= level_temp;
  END PROCESS Stream_Syncronizer_output;


  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dataOut_last_value_re <= to_signed(16#0000#, 16);
        dataOut_last_value_im <= to_signed(16#0000#, 16);
      ELSIF enb_gated = '1' THEN
        dataOut_last_value_re <= dataOut_bypass_re;
        dataOut_last_value_im <= dataOut_bypass_im;
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  dataOut_bypass_re <= dataOut_last_value_re WHEN stateControl_2 = '0' ELSE
      dataOut_re_1;
  
  dataOut_bypass_im <= dataOut_last_value_im WHEN stateControl_2 = '0' ELSE
      dataOut_im_1;

  out1_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        validOut_last_value <= '0';
      ELSIF enb_gated = '1' THEN
        validOut_last_value <= validOut_2;
      END IF;
    END IF;
  END PROCESS out1_bypass_process;


  
  validOut_2 <= validOut_last_value WHEN stateControl_2 = '0' ELSE
      validOut_1;

  dataOut_re <= std_logic_vector(dataOut_bypass_re);

  dataOut_im <= std_logic_vector(dataOut_bypass_im);

  validOut <= validOut_2;

END rtl;
