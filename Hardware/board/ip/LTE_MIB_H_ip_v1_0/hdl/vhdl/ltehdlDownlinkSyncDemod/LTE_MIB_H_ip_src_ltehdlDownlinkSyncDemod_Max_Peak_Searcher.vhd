-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Max_Peak_Searcher.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Max_Peak_Searcher
-- Source Path: ltehdlDownlinkSyncDemod/Sync Signal Search/PSS Searcher/Max Peak Searcher
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlDownlinkSyncDemod;
USE work.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_ltehdlDownlinkSyncDemod_pac.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Max_Peak_Searcher IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        correlationIn_0                   :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
        correlationIn_1                   :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
        correlationIn_2                   :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
        thresholdIn                       :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
        validIn                           :   IN    std_logic;
        start                             :   IN    std_logic;
        startTime                         :   IN    std_logic_vector(14 DOWNTO 0);  -- ufix15
        timingOffset                      :   OUT   std_logic_vector(14 DOWNTO 0);  -- ufix15
        NCellID2                          :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        done                              :   OUT   std_logic;
        success                           :   OUT   std_logic;
        validOut                          :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Max_Peak_Searcher;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Max_Peak_Searcher IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Max_Element
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          x_0                             :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
          x_1                             :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
          x_2                             :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
          xmax                            :   OUT   std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
          idx                             :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Peak_Search
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          corr                            :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
          PSSIdxIn                        :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          thresholdIn                     :   IN    std_logic_vector(29 DOWNTO 0);  -- ufix30_En24
          thresholdExceeded               :   IN    std_logic;
          validIn                         :   IN    std_logic;
          start                           :   IN    std_logic;
          startTime                       :   IN    std_logic_vector(14 DOWNTO 0);  -- ufix15
          timingOffset                    :   OUT   std_logic_vector(14 DOWNTO 0);  -- ufix15
          NCellID2                        :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          done                            :   OUT   std_logic;
          success                         :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Max_Element
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Max_Element(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Peak_Search
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Peak_Search(rtl);

  -- Signals
  SIGNAL resetIn                          : std_logic;
  SIGNAL correlationIn                    : vector_of_unsigned30(0 TO 2);  -- ufix30_En24 [3]
  SIGNAL Delay14_out1                     : vector_of_unsigned30(0 TO 2);  -- ufix30_En24 [3]
  SIGNAL xmax                             : std_logic_vector(29 DOWNTO 0);  -- ufix30
  SIGNAL idx                              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL xmax_unsigned                    : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL Delay6_out1                      : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL idx_unsigned                     : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Delay7_out1                      : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL thresholdIn_unsigned             : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL Delay15_out1                     : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL Delay3_out1                      : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL Delay9_out1                      : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL corr                             : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL PSSIdxIn                         : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL thresholdIn_1                    : unsigned(29 DOWNTO 0);  -- ufix30_En24
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL thresholdExceeded                : std_logic;
  SIGNAL Delay16_out1                     : std_logic;
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL Delay10_out1                     : std_logic;
  SIGNAL validIn_1                        : std_logic;
  SIGNAL startTime_unsigned               : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL start_1                          : std_logic;
  SIGNAL startTime_1                      : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL timingOffset_tmp                 : std_logic_vector(14 DOWNTO 0);  -- ufix15
  SIGNAL NCellID2_tmp                     : std_logic_vector(1 DOWNTO 0);  -- ufix2

BEGIN
  -- Delay matching is not needed for the start
  -- and startTime signals, because the
  -- peak search uses a timing reference
  -- to schedule the start operation at
  -- some point in the future.

  u_Max_Element : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Max_Element
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              x_0 => std_logic_vector(Delay14_out1(0)),  -- ufix30_En24
              x_1 => std_logic_vector(Delay14_out1(1)),  -- ufix30_En24
              x_2 => std_logic_vector(Delay14_out1(2)),  -- ufix30_En24
              xmax => xmax,  -- ufix30_En24
              idx => idx  -- ufix2
              );

  u_Peak_Search : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Peak_Search
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              corr => std_logic_vector(corr),  -- ufix30_En24
              PSSIdxIn => std_logic_vector(PSSIdxIn),  -- ufix2
              thresholdIn => std_logic_vector(thresholdIn_1),  -- ufix30_En24
              thresholdExceeded => thresholdExceeded,
              validIn => validIn_1,
              start => start_1,
              startTime => std_logic_vector(startTime_1),  -- ufix15
              timingOffset => timingOffset_tmp,  -- ufix15
              NCellID2 => NCellID2_tmp,  -- ufix2
              done => done,
              success => success,
              validOut => validOut
              );

  resetIn <= start;

  correlationIn(0) <= unsigned(correlationIn_0);
  correlationIn(1) <= unsigned(correlationIn_1);
  correlationIn(2) <= unsigned(correlationIn_2);

  Delay14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_out1 <= (OTHERS => to_unsigned(16#00000000#, 30));
      ELSIF enb = '1' THEN
        Delay14_out1 <= correlationIn;
      END IF;
    END IF;
  END PROCESS Delay14_process;


  xmax_unsigned <= unsigned(xmax);

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_out1 <= to_unsigned(16#00000000#, 30);
      ELSIF enb = '1' THEN
        Delay6_out1 <= xmax_unsigned;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  idx_unsigned <= unsigned(idx);

  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_out1 <= to_unsigned(16#0#, 2);
      ELSIF enb = '1' THEN
        Delay7_out1 <= idx_unsigned;
      END IF;
    END IF;
  END PROCESS Delay7_process;


  thresholdIn_unsigned <= unsigned(thresholdIn);

  Delay15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay15_out1 <= to_unsigned(16#00000000#, 30);
      ELSIF enb = '1' THEN
        Delay15_out1 <= thresholdIn_unsigned;
      END IF;
    END IF;
  END PROCESS Delay15_process;


  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= to_unsigned(16#00000000#, 30);
      ELSIF enb = '1' THEN
        Delay3_out1 <= Delay15_out1;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Delay9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay9_out1 <= to_unsigned(16#00000000#, 30);
      ELSIF enb = '1' THEN
        Delay9_out1 <= Delay3_out1;
      END IF;
    END IF;
  END PROCESS Delay9_process;


  Delay11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        corr <= to_unsigned(16#00000000#, 30);
      ELSIF enb = '1' THEN
        corr <= Delay6_out1;
      END IF;
    END IF;
  END PROCESS Delay11_process;


  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PSSIdxIn <= to_unsigned(16#0#, 2);
      ELSIF enb = '1' THEN
        PSSIdxIn <= Delay7_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        thresholdIn_1 <= to_unsigned(16#00000000#, 30);
      ELSIF enb = '1' THEN
        thresholdIn_1 <= Delay9_out1;
      END IF;
    END IF;
  END PROCESS Delay12_process;


  
  Relational_Operator_relop1 <= '1' WHEN Delay6_out1 > Delay9_out1 ELSE
      '0';

  Delay8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        thresholdExceeded <= '0';
      ELSIF enb = '1' THEN
        thresholdExceeded <= Relational_Operator_relop1;
      END IF;
    END IF;
  END PROCESS Delay8_process;


  Delay16_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay16_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay16_out1 <= validIn;
      END IF;
    END IF;
  END PROCESS Delay16_process;


  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay4_out1 <= Delay16_out1;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  Delay10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay10_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay10_out1 <= Delay4_out1;
      END IF;
    END IF;
  END PROCESS Delay10_process;


  Delay19_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        validIn_1 <= '0';
      ELSIF enb = '1' THEN
        validIn_1 <= Delay10_out1;
      END IF;
    END IF;
  END PROCESS Delay19_process;


  startTime_unsigned <= unsigned(startTime);

  Delay17_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        start_1 <= '0';
      ELSIF enb = '1' THEN
        start_1 <= resetIn;
      END IF;
    END IF;
  END PROCESS Delay17_process;


  Delay18_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        startTime_1 <= to_unsigned(16#0000#, 15);
      ELSIF enb = '1' THEN
        startTime_1 <= startTime_unsigned;
      END IF;
    END IF;
  END PROCESS Delay18_process;


  timingOffset <= timingOffset_tmp;

  NCellID2 <= NCellID2_tmp;

END rtl;
