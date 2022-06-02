-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlPBCHDecoder\LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Controller.vhd
-- Created: 2022-05-23 17:26:45
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Controller
-- Source Path: ltehdlPBCHDecoder/PBCH Controller
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Controller IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        valid_eq                          :   IN    std_logic;
        repeat_qpsk                       :   IN    std_logic;
        MIB_detected                      :   IN    std_logic;
        restart_MIB                       :   IN    std_logic;
        load_des                          :   OUT   std_logic;
        enb_des                           :   OUT   std_logic;
        waddr_qpsk                        :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        raddr_qpsk                        :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
        );
END LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Controller;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Controller IS

  -- Signals
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(0 TO 20);  -- ufix1 [21]
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL enb_1_2_0_gated                  : std_logic;
  SIGNAL load_des_1                       : std_logic;
  SIGNAL enb_des_1                        : std_logic;
  SIGNAL waddr_qpsk_1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL raddr_qpsk_1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL PBCHState                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL waddr_qpsk_cnt                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL raddr_qpsk_cnt                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL PBCHState_next                   : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL waddr_qpsk_cnt_next              : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL raddr_qpsk_cnt_next              : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL load_des_2                       : std_logic;
  SIGNAL load_des_last_value              : std_logic;
  SIGNAL enb_des_2                        : std_logic;
  SIGNAL enb_des_last_value               : std_logic;
  SIGNAL waddr_qpsk_bypass                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL waddr_qpsk_last_value            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL raddr_qpsk_bypass                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL raddr_qpsk_last_value            : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  stateControl_1 <= '1';

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch_reg(0) <= stateControl_1;
        delayMatch_reg(1 TO 20) <= delayMatch_reg(0 TO 19);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  stateControl_2 <= delayMatch_reg(20);

  enb_1_2_0_gated <= stateControl_2 AND enb_1_2_0;

  PBCH_Controller_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PBCHState <= to_unsigned(16#0#, 2);
        waddr_qpsk_cnt <= to_unsigned(16#00#, 8);
        raddr_qpsk_cnt <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0_gated = '1' THEN
        PBCHState <= PBCHState_next;
        waddr_qpsk_cnt <= waddr_qpsk_cnt_next;
        raddr_qpsk_cnt <= raddr_qpsk_cnt_next;
      END IF;
    END IF;
  END PROCESS PBCH_Controller_process;

  PBCH_Controller_output : PROCESS (MIB_detected, PBCHState, raddr_qpsk_cnt, repeat_qpsk, restart_MIB, valid_eq,
       waddr_qpsk_cnt)
    VARIABLE add_temp : unsigned(8 DOWNTO 0);
    VARIABLE add_temp_0 : unsigned(8 DOWNTO 0);
    VARIABLE add_temp_1 : unsigned(8 DOWNTO 0);
  BEGIN
    add_temp := to_unsigned(16#000#, 9);
    add_temp_0 := to_unsigned(16#000#, 9);
    add_temp_1 := to_unsigned(16#000#, 9);
    PBCHState_next <= PBCHState;
    waddr_qpsk_cnt_next <= waddr_qpsk_cnt;
    raddr_qpsk_cnt_next <= raddr_qpsk_cnt;
    load_des_1 <= '0';
    enb_des_1 <= '0';
    CASE PBCHState IS
      WHEN "00" =>
        --idle
        IF valid_eq = '1' THEN 
          PBCHState_next <= to_unsigned(16#1#, 2);
          load_des_1 <= '1';
          add_temp_1 := resize(waddr_qpsk_cnt, 9) + to_unsigned(16#001#, 9);
          IF add_temp_1(8) /= '0' THEN 
            waddr_qpsk_cnt_next <= "11111111";
          ELSE 
            waddr_qpsk_cnt_next <= add_temp_1(7 DOWNTO 0);
          END IF;
        END IF;
      WHEN "01" =>
        IF valid_eq = '1' THEN 
          -- assuming all eq data comes before the first valid seq
          IF waddr_qpsk_cnt < to_unsigned(16#EF#, 8) THEN 
            add_temp := resize(waddr_qpsk_cnt, 9) + to_unsigned(16#001#, 9);
            IF add_temp(8) /= '0' THEN 
              waddr_qpsk_cnt_next <= "11111111";
            ELSE 
              waddr_qpsk_cnt_next <= add_temp(7 DOWNTO 0);
            END IF;
          ELSE 
            waddr_qpsk_cnt_next <= to_unsigned(16#00#, 8);
            PBCHState_next <= to_unsigned(16#2#, 2);
          END IF;
        END IF;
      WHEN "10" =>
        -- read from RAM, output Seq
        enb_des_1 <= '1';
        IF raddr_qpsk_cnt < to_unsigned(16#EF#, 8) THEN 
          add_temp_0 := resize(raddr_qpsk_cnt, 9) + to_unsigned(16#001#, 9);
          IF add_temp_0(8) /= '0' THEN 
            raddr_qpsk_cnt_next <= "11111111";
          ELSE 
            raddr_qpsk_cnt_next <= add_temp_0(7 DOWNTO 0);
          END IF;
        ELSE 
          raddr_qpsk_cnt_next <= to_unsigned(16#00#, 8);
          PBCHState_next <= to_unsigned(16#3#, 2);
        END IF;
      WHEN "11" =>
        -- process
        IF repeat_qpsk = '1' THEN 
          PBCHState_next <= to_unsigned(16#2#, 2);
          raddr_qpsk_cnt_next <= to_unsigned(16#00#, 8);
        END IF;
        IF (MIB_detected OR restart_MIB) = '1' THEN 
          PBCHState_next <= to_unsigned(16#0#, 2);
          --reset all
          waddr_qpsk_cnt_next <= to_unsigned(16#00#, 8);
          raddr_qpsk_cnt_next <= to_unsigned(16#00#, 8);
        END IF;
      WHEN OTHERS => 
        NULL;
    END CASE;
    waddr_qpsk_1 <= waddr_qpsk_cnt;
    raddr_qpsk_1 <= raddr_qpsk_cnt;
  END PROCESS PBCH_Controller_output;


  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        load_des_last_value <= '0';
      ELSIF enb_1_2_0_gated = '1' THEN
        load_des_last_value <= load_des_2;
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  load_des_2 <= load_des_last_value WHEN stateControl_2 = '0' ELSE
      load_des_1;

  out1_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        enb_des_last_value <= '0';
      ELSIF enb_1_2_0_gated = '1' THEN
        enb_des_last_value <= enb_des_2;
      END IF;
    END IF;
  END PROCESS out1_bypass_process;


  
  enb_des_2 <= enb_des_last_value WHEN stateControl_2 = '0' ELSE
      enb_des_1;

  out2_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        waddr_qpsk_last_value <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0_gated = '1' THEN
        waddr_qpsk_last_value <= waddr_qpsk_bypass;
      END IF;
    END IF;
  END PROCESS out2_bypass_process;


  
  waddr_qpsk_bypass <= waddr_qpsk_last_value WHEN stateControl_2 = '0' ELSE
      waddr_qpsk_1;

  out3_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        raddr_qpsk_last_value <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0_gated = '1' THEN
        raddr_qpsk_last_value <= raddr_qpsk_bypass;
      END IF;
    END IF;
  END PROCESS out3_bypass_process;


  
  raddr_qpsk_bypass <= raddr_qpsk_last_value WHEN stateControl_2 = '0' ELSE
      raddr_qpsk_1;

  load_des <= load_des_2;

  enb_des <= enb_des_2;

  waddr_qpsk <= std_logic_vector(waddr_qpsk_bypass);

  raddr_qpsk <= std_logic_vector(raddr_qpsk_bypass);

END rtl;
