-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Find_Max_Correlation.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Find_Max_Correlation
-- Source Path: ltehdlDownlinkSyncDemod/Sync Signal Search/SSS Searcher/Max Likelihood SSS/Find Max Correlation
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Find_Max_Correlation IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        correlation                       :   IN    std_logic_vector(35 DOWNTO 0);  -- ufix36
        thresholdExceeded                 :   IN    std_logic;
        validIn                           :   IN    std_logic;
        seqNum                            :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        duplexMode                        :   IN    std_logic;  -- ufix1
        winningSeqNum                     :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
        TDD                               :   OUT   std_logic;
        success                           :   OUT   std_logic;
        duplexModeDone                    :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Find_Max_Correlation;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Find_Max_Correlation IS

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
  SIGNAL enb_gated                        : std_logic;
  SIGNAL in1_signed                       : signed(35 DOWNTO 0);  -- sfix36_En26
  SIGNAL in4_unsigned                     : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL maxCorrelation                   : signed(35 DOWNTO 0);  -- sfix36_En26
  SIGNAL winningSeqNum_1                  : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL TDD_1                            : std_logic;
  SIGNAL success_1                        : std_logic;
  SIGNAL duplexModeDone_1                 : std_logic;
  SIGNAL reg_maxCorrelation               : signed(35 DOWNTO 0);  -- sfix36_En26
  SIGNAL reg_winningSeqNum                : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL reg_success                      : std_logic;
  SIGNAL reg_duplexMode                   : std_logic;  -- ufix1
  SIGNAL reg_duplexModeDone               : std_logic;
  SIGNAL reg_maxCorrelation_next          : signed(35 DOWNTO 0);  -- sfix36_En26
  SIGNAL reg_winningSeqNum_next           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL reg_success_next                 : std_logic;
  SIGNAL reg_duplexMode_next              : std_logic;  -- ufix1
  SIGNAL reg_duplexModeDone_next          : std_logic;
  SIGNAL winningSeqNum_bypass             : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL winningSeqNum_last_value         : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL TDD_2                            : std_logic;
  SIGNAL TDD_last_value                   : std_logic;
  SIGNAL success_2                        : std_logic;
  SIGNAL success_last_value               : std_logic;
  SIGNAL duplexModeDone_2                 : std_logic;
  SIGNAL duplexModeDone_last_value        : std_logic;

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

  in1_signed <= signed(correlation);

  in4_unsigned <= unsigned(seqNum);

  Find_Max_Correlation_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        reg_maxCorrelation <= to_signed(0, 36);
        reg_winningSeqNum <= to_unsigned(16#000#, 10);
        reg_success <= '0';
        reg_duplexMode <= '0';
        reg_duplexModeDone <= '0';
      ELSIF enb_gated = '1' THEN
        reg_maxCorrelation <= reg_maxCorrelation_next;
        reg_winningSeqNum <= reg_winningSeqNum_next;
        reg_success <= reg_success_next;
        reg_duplexMode <= reg_duplexMode_next;
        reg_duplexModeDone <= reg_duplexModeDone_next;
      END IF;
    END IF;
  END PROCESS Find_Max_Correlation_process;

  Find_Max_Correlation_output : PROCESS (duplexMode, in1_signed, in4_unsigned, reg_duplexMode, reg_duplexModeDone,
       reg_maxCorrelation, reg_success, reg_winningSeqNum, reset,
       thresholdExceeded, validIn)
    VARIABLE next_duplexModeDone : std_logic;
  BEGIN
    ----------------------------------------------------------------------------
    -- Constants
    ----------------------------------------------------------------------------
    -- number of SSS sequences checked for a given PSS
    ----------------------------------------------------------------------------
    -- Initialize registers
    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------
    -- Assign outputs
    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------
    -- Update registers
    ----------------------------------------------------------------------------
    -- Initialize next reg values to current values.
    reg_maxCorrelation_next <= reg_maxCorrelation;
    reg_winningSeqNum_next <= reg_winningSeqNum;
    reg_success_next <= reg_success;
    reg_duplexMode_next <= reg_duplexMode;
    -- Keep track of winning sequence
    IF reset = '1' THEN 
      reg_maxCorrelation_next <= in1_signed;
      reg_winningSeqNum_next <= in4_unsigned;
      reg_success_next <= '0';
      reg_duplexMode_next <= '0';
    ELSIF ((validIn AND thresholdExceeded) AND hdlcoder_to_stdlogic((in4_unsigned < to_unsigned(16#003#, 10)) OR (in1_signed > reg_maxCorrelation))) = '1' THEN 
      reg_maxCorrelation_next <= in1_signed;
      reg_winningSeqNum_next <= in4_unsigned;
      reg_success_next <= '1';
      reg_duplexMode_next <= duplexMode;
    END IF;
    next_duplexModeDone := validIn AND hdlcoder_to_stdlogic(in4_unsigned >= to_unsigned(16#3ED#, 10));
    -- Write new values to registers.
    reg_duplexModeDone_next <= next_duplexModeDone;
    maxCorrelation <= reg_maxCorrelation;
    winningSeqNum_1 <= reg_winningSeqNum;
    IF reg_duplexMode /= '0' THEN 
      TDD_1 <= '1';
    ELSE 
      TDD_1 <= '0';
    END IF;
    success_1 <= reg_success;
    duplexModeDone_1 <= reg_duplexModeDone;
  END PROCESS Find_Max_Correlation_output;


  out1_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        winningSeqNum_last_value <= to_unsigned(16#000#, 10);
      ELSIF enb_gated = '1' THEN
        winningSeqNum_last_value <= winningSeqNum_bypass;
      END IF;
    END IF;
  END PROCESS out1_bypass_process;


  
  winningSeqNum_bypass <= winningSeqNum_last_value WHEN stateControl_2 = '0' ELSE
      winningSeqNum_1;

  out2_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        TDD_last_value <= '0';
      ELSIF enb_gated = '1' THEN
        TDD_last_value <= TDD_2;
      END IF;
    END IF;
  END PROCESS out2_bypass_process;


  
  TDD_2 <= TDD_last_value WHEN stateControl_2 = '0' ELSE
      TDD_1;

  out3_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        success_last_value <= '0';
      ELSIF enb_gated = '1' THEN
        success_last_value <= success_2;
      END IF;
    END IF;
  END PROCESS out3_bypass_process;


  
  success_2 <= success_last_value WHEN stateControl_2 = '0' ELSE
      success_1;

  out4_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        duplexModeDone_last_value <= '0';
      ELSIF enb_gated = '1' THEN
        duplexModeDone_last_value <= duplexModeDone_2;
      END IF;
    END IF;
  END PROCESS out4_bypass_process;


  
  duplexModeDone_2 <= duplexModeDone_last_value WHEN stateControl_2 = '0' ELSE
      duplexModeDone_1;

  winningSeqNum <= std_logic_vector(winningSeqNum_bypass);

  TDD <= TDD_2;

  success <= success_2;

  duplexModeDone <= duplexModeDone_2;

END rtl;
