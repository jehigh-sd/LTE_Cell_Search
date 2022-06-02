-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_RADIX22FFT_CTRL1_6.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_RADIX22FFT_CTRL1_6
-- Source Path: ltehdlDownlinkSyncDemod/OFDM Demodulation/FFT HDL Optimized/RADIX22FFT_CTRL1_6
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_RADIX22FFT_CTRL1_6 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        dout_5_1_vld                      :   IN    std_logic;
        dinXTwdl_6_1_vld                  :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        rd_6_Addr                         :   OUT   std_logic_vector(4 DOWNTO 0);  -- ufix5
        rd_6_Enb                          :   OUT   std_logic;
        proc_6_enb                        :   OUT   std_logic;
        multiply_6_J                      :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_RADIX22FFT_CTRL1_6;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_RADIX22FFT_CTRL1_6 IS

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
  SIGNAL SDFController_wrCount            : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL SDFController_wrState            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdState            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdAddr_reg         : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL SDFController_procEnb_reg        : std_logic;
  SIGNAL SDFController_multjState         : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_multiply_J_reg     : std_logic;
  SIGNAL SDFController_wrCount_next       : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL SDFController_wrState_next       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdState_next       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdAddr_reg_next    : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL SDFController_procEnb_reg_next   : std_logic;
  SIGNAL SDFController_multjState_next    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_multiply_J_reg_next : std_logic;
  SIGNAL rd_6_Addr_tmp                    : unsigned(4 DOWNTO 0);  -- ufix5

BEGIN
  -- SDFController
  SDFController_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        SDFController_wrCount <= to_unsigned(16#00#, 5);
        SDFController_rdAddr_reg <= to_unsigned(16#00#, 5);
        SDFController_wrState <= to_unsigned(16#0#, 2);
        SDFController_rdState <= to_unsigned(16#0#, 2);
        SDFController_multjState <= to_unsigned(16#0#, 2);
        SDFController_procEnb_reg <= '0';
        SDFController_multiply_J_reg <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          SDFController_wrCount <= to_unsigned(16#00#, 5);
          SDFController_rdAddr_reg <= to_unsigned(16#00#, 5);
          SDFController_wrState <= to_unsigned(16#0#, 2);
          SDFController_rdState <= to_unsigned(16#0#, 2);
          SDFController_multjState <= to_unsigned(16#0#, 2);
          SDFController_procEnb_reg <= '0';
          SDFController_multiply_J_reg <= '0';
        ELSE 
          SDFController_wrCount <= SDFController_wrCount_next;
          SDFController_wrState <= SDFController_wrState_next;
          SDFController_rdState <= SDFController_rdState_next;
          SDFController_rdAddr_reg <= SDFController_rdAddr_reg_next;
          SDFController_procEnb_reg <= SDFController_procEnb_reg_next;
          SDFController_multjState <= SDFController_multjState_next;
          SDFController_multiply_J_reg <= SDFController_multiply_J_reg_next;
        END IF;
      END IF;
    END IF;
  END PROCESS SDFController_process;

  SDFController_output : PROCESS (SDFController_multiply_J_reg, SDFController_multjState,
       SDFController_procEnb_reg, SDFController_rdAddr_reg,
       SDFController_rdState, SDFController_wrCount, SDFController_wrState,
       dinXTwdl_6_1_vld, dout_5_1_vld)
  BEGIN
    SDFController_wrCount_next <= SDFController_wrCount;
    SDFController_wrState_next <= SDFController_wrState;
    SDFController_rdState_next <= SDFController_rdState;
    SDFController_rdAddr_reg_next <= SDFController_rdAddr_reg;
    SDFController_procEnb_reg_next <= SDFController_procEnb_reg;
    SDFController_multjState_next <= SDFController_multjState;
    SDFController_multiply_J_reg_next <= SDFController_multiply_J_reg;
    CASE SDFController_multjState IS
      WHEN "00" =>
        SDFController_multjState_next <= to_unsigned(16#0#, 2);
        SDFController_multiply_J_reg_next <= '0';
        IF SDFController_rdState = to_unsigned(16#1#, 2) THEN 
          SDFController_multjState_next <= to_unsigned(16#1#, 2);
        END IF;
      WHEN "01" =>
        SDFController_multiply_J_reg_next <= '0';
        IF SDFController_rdState = to_unsigned(16#2#, 2) THEN 
          SDFController_multjState_next <= to_unsigned(16#2#, 2);
        END IF;
      WHEN "10" =>
        SDFController_multiply_J_reg_next <= '0';
        IF SDFController_rdState = to_unsigned(16#1#, 2) THEN 
          SDFController_multjState_next <= to_unsigned(16#3#, 2);
          SDFController_multiply_J_reg_next <= '1';
        END IF;
      WHEN "11" =>
        IF SDFController_rdState = to_unsigned(16#1#, 2) THEN 
          SDFController_multjState_next <= to_unsigned(16#3#, 2);
          SDFController_multiply_J_reg_next <= '1';
        ELSE 
          SDFController_multiply_J_reg_next <= '0';
          SDFController_multjState_next <= to_unsigned(16#0#, 2);
        END IF;
      WHEN OTHERS => 
        SDFController_multjState_next <= to_unsigned(16#0#, 2);
        SDFController_multiply_J_reg_next <= '0';
    END CASE;
    CASE SDFController_rdState IS
      WHEN "00" =>
        SDFController_rdState_next <= to_unsigned(16#0#, 2);
        SDFController_rdAddr_reg_next <= to_unsigned(16#00#, 5);
        rd_6_Enb <= '0';
        IF (dout_5_1_vld AND hdlcoder_to_stdlogic(SDFController_wrCount = to_unsigned(16#1F#, 5))) = '1' THEN 
          SDFController_rdState_next <= to_unsigned(16#1#, 2);
        END IF;
      WHEN "01" =>
        SDFController_rdState_next <= to_unsigned(16#1#, 2);
        rd_6_Enb <= dinXTwdl_6_1_vld;
        IF dinXTwdl_6_1_vld = '1' THEN 
          IF SDFController_rdAddr_reg = to_unsigned(16#1F#, 5) THEN 
            SDFController_rdState_next <= to_unsigned(16#2#, 2);
          END IF;
          SDFController_rdAddr_reg_next <= SDFController_rdAddr_reg + to_unsigned(16#01#, 5);
        END IF;
      WHEN "10" =>
        rd_6_Enb <= '1';
        IF SDFController_rdAddr_reg = to_unsigned(16#1F#, 5) THEN 
          IF (dout_5_1_vld AND hdlcoder_to_stdlogic(SDFController_wrCount = to_unsigned(16#1F#, 5))) = '1' THEN 
            SDFController_rdState_next <= to_unsigned(16#1#, 2);
          ELSE 
            SDFController_rdState_next <= to_unsigned(16#0#, 2);
          END IF;
        END IF;
        SDFController_rdAddr_reg_next <= SDFController_rdAddr_reg + to_unsigned(16#01#, 5);
      WHEN OTHERS => 
        SDFController_rdState_next <= to_unsigned(16#0#, 2);
        SDFController_rdAddr_reg_next <= to_unsigned(16#00#, 5);
        rd_6_Enb <= '0';
    END CASE;
    CASE SDFController_wrState IS
      WHEN "00" =>
        SDFController_wrState_next <= to_unsigned(16#0#, 2);
        SDFController_wrCount_next <= to_unsigned(16#00#, 5);
        SDFController_procEnb_reg_next <= '0';
        IF dout_5_1_vld = '1' THEN 
          SDFController_wrState_next <= to_unsigned(16#1#, 2);
          SDFController_wrCount_next <= to_unsigned(16#01#, 5);
        END IF;
      WHEN "01" =>
        SDFController_wrState_next <= to_unsigned(16#1#, 2);
        SDFController_procEnb_reg_next <= '0';
        IF dout_5_1_vld = '1' THEN 
          IF SDFController_wrCount = to_unsigned(16#1F#, 5) THEN 
            SDFController_wrState_next <= to_unsigned(16#2#, 2);
            SDFController_procEnb_reg_next <= '1';
          ELSE 
            SDFController_wrState_next <= to_unsigned(16#1#, 2);
          END IF;
          SDFController_wrCount_next <= SDFController_wrCount + to_unsigned(16#01#, 5);
        END IF;
      WHEN "10" =>
        SDFController_wrState_next <= to_unsigned(16#2#, 2);
        IF dout_5_1_vld = '1' THEN 
          IF SDFController_wrCount = to_unsigned(16#1F#, 5) THEN 
            SDFController_wrState_next <= to_unsigned(16#1#, 2);
            SDFController_procEnb_reg_next <= '0';
          ELSE 
            SDFController_wrState_next <= to_unsigned(16#2#, 2);
            SDFController_procEnb_reg_next <= '1';
          END IF;
          SDFController_wrCount_next <= SDFController_wrCount + to_unsigned(16#01#, 5);
        END IF;
      WHEN OTHERS => 
        SDFController_wrState_next <= to_unsigned(16#0#, 2);
        SDFController_wrCount_next <= to_unsigned(16#1F#, 5);
        SDFController_procEnb_reg_next <= '0';
    END CASE;
    rd_6_Addr_tmp <= SDFController_rdAddr_reg;
    proc_6_enb <= SDFController_procEnb_reg;
    multiply_6_J <= SDFController_multiply_J_reg;
  END PROCESS SDFController_output;


  rd_6_Addr <= std_logic_vector(rd_6_Addr_tmp);

END rtl;

