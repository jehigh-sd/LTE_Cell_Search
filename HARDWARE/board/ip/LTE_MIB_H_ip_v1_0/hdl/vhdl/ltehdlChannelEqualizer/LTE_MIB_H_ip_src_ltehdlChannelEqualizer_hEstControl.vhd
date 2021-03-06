-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlChannelEqualizer\LTE_MIB_H_ip_src_ltehdlChannelEqualizer_hEstControl.vhd
-- Created: 2022-05-23 17:26:43
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlChannelEqualizer_hEstControl
-- Source Path: ltehdlChannelEqualizer/chEst/hEstControl
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LTE_MIB_H_ip_src_ltehdlChannelEqualizer_ltehdlChannelEqualizer_pac.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlChannelEqualizer_hEstControl IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        reset                             :   IN    std_logic;
        hestRS_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        hestRS_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        rsValid                           :   IN    std_logic;
        ofdmSymbol                        :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        rsCount                           :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
        cellMod3                          :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        cellMod6                          :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        ndlrb                             :   IN    std_logic_vector(6 DOWNTO 0);  -- ufix7
        rsData_re                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        rsData_im                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        addr                              :   OUT   std_logic_vector(8 DOWNTO 0);  -- ufix9
        wrtEnA0                           :   OUT   std_logic;
        wrtEnA1                           :   OUT   std_logic;
        doAverage                         :   OUT   std_logic;
        isFirstRS                         :   OUT   std_logic;
        isLastRS                          :   OUT   std_logic;
        doInterp                          :   OUT   std_logic;
        addrBias                          :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
        );
END LTE_MIB_H_ip_src_ltehdlChannelEqualizer_hEstControl;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlChannelEqualizer_hEstControl IS

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
  SIGNAL ndlrb_unsigned                   : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL delayMatch_reg                   : vector_of_unsigned7(0 TO 20);  -- ufix7 [21]
  SIGNAL ndlrb_1                          : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL delayMatch1_reg                  : std_logic_vector(0 TO 20);  -- ufix1 [21]
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL enb_1_2_0_gated                  : std_logic;
  SIGNAL in1_re_signed                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL in1_im_signed                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL in3_unsigned                     : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL in4_unsigned                     : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL in5_unsigned                     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL in6_unsigned                     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL rsData_re_1                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL rsData_im_1                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL addr_1                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL wrtEnA0_1                        : std_logic;
  SIGNAL wrtEnA1_1                        : std_logic;
  SIGNAL doAverage_1                      : std_logic;
  SIGNAL isFirstRS_1                      : std_logic;
  SIGNAL isLastRS_1                       : std_logic;
  SIGNAL doInterp_1                       : std_logic;
  SIGNAL addrBias_1                       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL hestDone                         : std_logic;
  SIGNAL STATE                            : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL reg_hestRS_re                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL reg_hestRS_im                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL reg_wrtAnt                       : std_logic;
  SIGNAL reg_addr                         : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL reg_readCount                    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL reg_wrtEnA0                      : std_logic;
  SIGNAL reg_wrtEnA1                      : std_logic;
  SIGNAL reg_doAverage                    : std_logic;
  SIGNAL reg_isFirstRS                    : std_logic;
  SIGNAL reg_doInterp                     : std_logic;
  SIGNAL reg_isLastRS                     : std_logic;
  SIGNAL reg_hestDone                     : std_logic;
  SIGNAL reg_addrBias                     : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL STATE_next                       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL reg_hestRS_next_re               : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL reg_hestRS_next_im               : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL reg_wrtAnt_next                  : std_logic;
  SIGNAL reg_addr_next                    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL reg_readCount_next               : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL reg_wrtEnA0_next                 : std_logic;
  SIGNAL reg_wrtEnA1_next                 : std_logic;
  SIGNAL reg_doAverage_next               : std_logic;
  SIGNAL reg_isFirstRS_next               : std_logic;
  SIGNAL reg_doInterp_next                : std_logic;
  SIGNAL reg_isLastRS_next                : std_logic;
  SIGNAL reg_hestDone_next                : std_logic;
  SIGNAL reg_addrBias_next                : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL rsData_bypass_re                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL rsData_bypass_im                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL rsData_last_value_re             : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL rsData_last_value_im             : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL addr_bypass                      : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL addr_last_value                  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL wrtEnA0_2                        : std_logic;
  SIGNAL wrtEnA0_last_value               : std_logic;
  SIGNAL wrtEnA1_2                        : std_logic;
  SIGNAL wrtEnA1_last_value               : std_logic;
  SIGNAL doAverage_2                      : std_logic;
  SIGNAL doAverage_last_value             : std_logic;
  SIGNAL isFirstRS_2                      : std_logic;
  SIGNAL isFirstRS_last_value             : std_logic;
  SIGNAL isLastRS_2                       : std_logic;
  SIGNAL isLastRS_last_value              : std_logic;
  SIGNAL doInterp_2                       : std_logic;
  SIGNAL doInterp_last_value              : std_logic;
  SIGNAL addrBias_bypass                  : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL addrBias_last_value              : unsigned(1 DOWNTO 0);  -- ufix2

BEGIN
  ndlrb_unsigned <= unsigned(ndlrb);

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => to_unsigned(16#00#, 7));
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch_reg(0) <= ndlrb_unsigned;
        delayMatch_reg(1 TO 20) <= delayMatch_reg(0 TO 19);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  ndlrb_1 <= delayMatch_reg(20);

  stateControl_1 <= '1';

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch1_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch1_reg(0) <= stateControl_1;
        delayMatch1_reg(1 TO 20) <= delayMatch1_reg(0 TO 19);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  stateControl_2 <= delayMatch1_reg(20);

  enb_1_2_0_gated <= stateControl_2 AND enb_1_2_0;

  in1_re_signed <= signed(hestRS_re);

  in1_im_signed <= signed(hestRS_im);

  in3_unsigned <= unsigned(ofdmSymbol);

  in4_unsigned <= unsigned(rsCount);

  in5_unsigned <= unsigned(cellMod3);

  in6_unsigned <= unsigned(cellMod6);

  hEstControl_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        STATE <= to_unsigned(16#0#, 3);
        reg_hestRS_re <= to_signed(16#0000#, 16);
        reg_hestRS_im <= to_signed(16#0000#, 16);
        reg_wrtAnt <= '0';
        reg_addr <= to_unsigned(16#000#, 9);
        reg_readCount <= to_unsigned(16#000#, 9);
        reg_wrtEnA0 <= '0';
        reg_wrtEnA1 <= '0';
        reg_doAverage <= '0';
        reg_isFirstRS <= '0';
        reg_doInterp <= '0';
        reg_isLastRS <= '0';
        reg_hestDone <= '0';
        reg_addrBias <= to_unsigned(16#0#, 2);
      ELSIF enb_1_2_0_gated = '1' THEN
        STATE <= STATE_next;
        reg_hestRS_re <= reg_hestRS_next_re;
        reg_hestRS_im <= reg_hestRS_next_im;
        reg_wrtAnt <= reg_wrtAnt_next;
        reg_addr <= reg_addr_next;
        reg_readCount <= reg_readCount_next;
        reg_wrtEnA0 <= reg_wrtEnA0_next;
        reg_wrtEnA1 <= reg_wrtEnA1_next;
        reg_doAverage <= reg_doAverage_next;
        reg_isFirstRS <= reg_isFirstRS_next;
        reg_doInterp <= reg_doInterp_next;
        reg_isLastRS <= reg_isLastRS_next;
        reg_hestDone <= reg_hestDone_next;
        reg_addrBias <= reg_addrBias_next;
      END IF;
    END IF;
  END PROCESS hEstControl_process;

  hEstControl_output : PROCESS (STATE, in1_im_signed, in1_re_signed, in3_unsigned, in4_unsigned, in5_unsigned,
       in6_unsigned, ndlrb_1, reg_addr, reg_addrBias, reg_doAverage,
       reg_doInterp, reg_hestDone, reg_hestRS_im, reg_hestRS_re, reg_isFirstRS,
       reg_isLastRS, reg_readCount, reg_wrtAnt, reg_wrtEnA0, reg_wrtEnA1, reset,
       rsValid)
    VARIABLE firstAnt : std_logic;
    VARIABLE rsStart : unsigned(8 DOWNTO 0);
    VARIABLE rsEnd : unsigned(8 DOWNTO 0);
    VARIABLE rsTotal : unsigned(8 DOWNTO 0);
    VARIABLE guard1 : std_logic;
    VARIABLE guard2 : std_logic;
  BEGIN
    guard1 := '0';
    guard2 := '0';
    STATE_next <= STATE;
    reg_hestRS_next_re <= reg_hestRS_re;
    reg_hestRS_next_im <= reg_hestRS_im;
    reg_wrtAnt_next <= reg_wrtAnt;
    reg_addr_next <= reg_addr;
    reg_readCount_next <= reg_readCount;
    reg_wrtEnA0_next <= reg_wrtEnA0;
    reg_wrtEnA1_next <= reg_wrtEnA1;
    reg_isFirstRS_next <= reg_isFirstRS;
    reg_doInterp_next <= reg_doInterp;
    reg_isLastRS_next <= reg_isLastRS;
    reg_hestDone_next <= reg_hestDone;
    reg_doAverage_next <= hdlcoder_to_stdlogic((in3_unsigned = to_unsigned(16#7#, 4)) OR (in3_unsigned = to_unsigned(16#B#, 4)));
    IF in6_unsigned < to_unsigned(16#00000003#, 16) THEN 
      -- A0 is first in OFDM symbol 0 & 7
      -- A1 is first in OFDM symbols 4 & 11
      firstAnt := '0';
    ELSE 
      -- A1 is first in OFDM symbol 0 & 7
      -- A0 is first in OFDM symbols 4 & 11
      firstAnt := '1';
    END IF;
    CASE in5_unsigned IS
      WHEN "0000000000000000" =>
        -- No interp reqd at bottom
        -- Interp by 2 at top
        reg_addrBias_next <= to_unsigned(16#3#, 2);
      WHEN "0000000000000001" =>
        -- Interp by 1 at top and bottom
        reg_addrBias_next <= to_unsigned(16#2#, 2);
      WHEN "0000000000000010" =>
        -- Interp by 2 at bottom
        -- No interp reqd at top
        reg_addrBias_next <= to_unsigned(16#1#, 2);
      WHEN OTHERS => 
        reg_addrBias_next <= to_unsigned(16#1#, 2);
    END CASE;
    CASE ndlrb_1 IS
      WHEN "1100100" =>
        rsStart := to_unsigned(16#013#, 9);
        rsEnd := to_unsigned(16#1A4#, 9);
        rsTotal := to_unsigned(16#190#, 9);
      WHEN "1001011" =>
        rsStart := to_unsigned(16#045#, 9);
        rsEnd := to_unsigned(16#172#, 9);
        rsTotal := to_unsigned(16#12C#, 9);
      WHEN "0110010" =>
        rsStart := to_unsigned(16#077#, 9);
        rsEnd := to_unsigned(16#140#, 9);
        rsTotal := to_unsigned(16#0C8#, 9);
      WHEN "0011001" =>
        rsStart := to_unsigned(16#0A9#, 9);
        rsEnd := to_unsigned(16#10E#, 9);
        rsTotal := to_unsigned(16#064#, 9);
      WHEN "0001111" =>
        rsStart := to_unsigned(16#0BD#, 9);
        rsEnd := to_unsigned(16#0FA#, 9);
        rsTotal := to_unsigned(16#03C#, 9);
      WHEN "0000110" =>
        rsStart := to_unsigned(16#0CF#, 9);
        rsEnd := to_unsigned(16#0E8#, 9);
        rsTotal := to_unsigned(16#018#, 9);
      WHEN OTHERS => 
        rsStart := to_unsigned(16#013#, 9);
        rsEnd := to_unsigned(16#1A4#, 9);
        rsTotal := to_unsigned(16#190#, 9);
    END CASE;
    IF reset = '1' THEN 
      STATE_next <= to_unsigned(16#0#, 3);
      reg_wrtAnt_next <= '0';
      reg_addr_next <= to_unsigned(16#000#, 9);
      reg_readCount_next <= to_unsigned(16#000#, 9);
      reg_doInterp_next <= '0';
      reg_hestRS_next_re <= to_signed(16#0000#, 16);
      reg_hestRS_next_im <= to_signed(16#0000#, 16);
      reg_wrtEnA0_next <= '0';
      reg_wrtEnA1_next <= '0';
      reg_isFirstRS_next <= '0';
      reg_isLastRS_next <= '0';
      reg_hestDone_next <= '0';
    ELSE 
      CASE STATE IS
        WHEN "000" =>
          --Reset/waiting
          IF rsValid = '1' THEN 
            STATE_next <= to_unsigned(16#1#, 3);
            reg_wrtAnt_next <= firstAnt;
            reg_hestDone_next <= '0';
          END IF;
          ----------------- WRITING ----------------------------------------------
        WHEN "001" =>
          reg_hestDone_next <= '0';
          IF (in4_unsigned > rsStart) AND (in4_unsigned < rsEnd) THEN 
            -- inside the 100 NDLRB range (excluding 110 NDLRB RS)
            -- 400 RS per 100 NDLRB OFDM symbol (440 RS for 110)
            IF rsValid = '1' THEN 
              reg_hestRS_next_re <= in1_re_signed;
              reg_hestRS_next_im <= in1_im_signed;
              reg_addr_next <= reg_addr + to_unsigned(16#001#, 9);
              reg_wrtAnt_next <=  NOT reg_wrtAnt;
              -- Toggle the antenna number
              guard1 := '0';
              guard2 := '0';
              CASE in3_unsigned IS
                WHEN "0000" =>
                  guard1 := '1';
                WHEN "0111" =>
                  guard1 := '1';
                WHEN "0100" =>
                  guard2 := '1';
                WHEN "1011" =>
                  guard2 := '1';
                WHEN OTHERS => 
                  reg_wrtEnA0_next <= '0';
                  reg_wrtEnA1_next <= '0';
              END CASE;
              IF guard2 = '1' THEN 
                -- invert antenna order for ofdmSymbols 4 & 11
                IF reg_wrtAnt = '1' THEN 
                  reg_wrtEnA0_next <= '1';
                  reg_wrtEnA1_next <= '0';
                ELSE 
                  reg_wrtEnA0_next <= '0';
                  reg_wrtEnA1_next <= '1';
                END IF;
              END IF;
              IF guard1 = '1' THEN 
                IF reg_wrtAnt = '1' THEN 
                  reg_wrtEnA0_next <= '0';
                  reg_wrtEnA1_next <= '1';
                ELSE 
                  reg_wrtEnA0_next <= '1';
                  reg_wrtEnA1_next <= '0';
                END IF;
              END IF;
            ELSE 
              reg_wrtEnA0_next <= '0';
              reg_wrtEnA1_next <= '0';
            END IF;
          ELSE 
            reg_wrtEnA0_next <= '0';
            reg_wrtEnA1_next <= '0';
          END IF;
          IF in4_unsigned < rsStart THEN 
            reg_addr_next <= to_unsigned(16#000#, 9);
          END IF;
          IF (in4_unsigned > rsEnd) AND (in3_unsigned = to_unsigned(16#B#, 4)) THEN 
            -- writing completed when finished writing RS for OFDM symbol
            STATE_next <= to_unsigned(16#2#, 3);
            reg_addr_next <= to_unsigned(16#000#, 9);
            reg_wrtEnA0_next <= '0';
            reg_wrtEnA1_next <= '0';
          END IF;
          ----------------- READING / INTERPOLATING ------------------------------
        WHEN "010" =>
          reg_isFirstRS_next <= hdlcoder_to_stdlogic(reg_addr = to_unsigned(16#000#, 9));
          IF reg_addr = rsTotal THEN 
            reg_isLastRS_next <= '1';
          END IF;
          IF reg_addr > rsTotal THEN 
            reg_isLastRS_next <= '0';
            reg_doInterp_next <= '0';
            IF in3_unsigned /= to_unsigned(16#B#, 4) THEN 
              STATE_next <= to_unsigned(16#3#, 3);
            END IF;
          ELSE 
            reg_addr_next <= reg_addr + to_unsigned(16#001#, 9);
            reg_doInterp_next <= '1';
          END IF;
        WHEN "011" =>
          -- wait after write
          reg_isLastRS_next <= '0';
          reg_addr_next <= to_unsigned(16#000#, 9);
          reg_doInterp_next <= '0';
          reg_hestDone_next <= '1';
          reg_wrtAnt_next <= firstAnt;
          STATE_next <= to_unsigned(16#1#, 3);
        WHEN OTHERS => 
          NULL;
      END CASE;
    END IF;
    rsData_re_1 <= reg_hestRS_re;
    rsData_im_1 <= reg_hestRS_im;
    addr_1 <= reg_addr;
    wrtEnA0_1 <= reg_wrtEnA0;
    wrtEnA1_1 <= reg_wrtEnA1;
    doAverage_1 <= reg_doAverage;
    isFirstRS_1 <= reg_isFirstRS;
    isLastRS_1 <= reg_isLastRS;
    doInterp_1 <= reg_doInterp;
    addrBias_1 <= reg_addrBias;
    hestDone <= reg_hestDone;
  END PROCESS hEstControl_output;


  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rsData_last_value_re <= to_signed(16#0000#, 16);
        rsData_last_value_im <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0_gated = '1' THEN
        rsData_last_value_re <= rsData_bypass_re;
        rsData_last_value_im <= rsData_bypass_im;
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  rsData_bypass_re <= rsData_last_value_re WHEN stateControl_2 = '0' ELSE
      rsData_re_1;
  
  rsData_bypass_im <= rsData_last_value_im WHEN stateControl_2 = '0' ELSE
      rsData_im_1;

  out1_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        addr_last_value <= to_unsigned(16#000#, 9);
      ELSIF enb_1_2_0_gated = '1' THEN
        addr_last_value <= addr_bypass;
      END IF;
    END IF;
  END PROCESS out1_bypass_process;


  
  addr_bypass <= addr_last_value WHEN stateControl_2 = '0' ELSE
      addr_1;

  out2_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        wrtEnA0_last_value <= '0';
      ELSIF enb_1_2_0_gated = '1' THEN
        wrtEnA0_last_value <= wrtEnA0_2;
      END IF;
    END IF;
  END PROCESS out2_bypass_process;


  
  wrtEnA0_2 <= wrtEnA0_last_value WHEN stateControl_2 = '0' ELSE
      wrtEnA0_1;

  out3_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        wrtEnA1_last_value <= '0';
      ELSIF enb_1_2_0_gated = '1' THEN
        wrtEnA1_last_value <= wrtEnA1_2;
      END IF;
    END IF;
  END PROCESS out3_bypass_process;


  
  wrtEnA1_2 <= wrtEnA1_last_value WHEN stateControl_2 = '0' ELSE
      wrtEnA1_1;

  out4_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        doAverage_last_value <= '0';
      ELSIF enb_1_2_0_gated = '1' THEN
        doAverage_last_value <= doAverage_2;
      END IF;
    END IF;
  END PROCESS out4_bypass_process;


  
  doAverage_2 <= doAverage_last_value WHEN stateControl_2 = '0' ELSE
      doAverage_1;

  out5_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        isFirstRS_last_value <= '0';
      ELSIF enb_1_2_0_gated = '1' THEN
        isFirstRS_last_value <= isFirstRS_2;
      END IF;
    END IF;
  END PROCESS out5_bypass_process;


  
  isFirstRS_2 <= isFirstRS_last_value WHEN stateControl_2 = '0' ELSE
      isFirstRS_1;

  out6_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        isLastRS_last_value <= '0';
      ELSIF enb_1_2_0_gated = '1' THEN
        isLastRS_last_value <= isLastRS_2;
      END IF;
    END IF;
  END PROCESS out6_bypass_process;


  
  isLastRS_2 <= isLastRS_last_value WHEN stateControl_2 = '0' ELSE
      isLastRS_1;

  out7_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        doInterp_last_value <= '0';
      ELSIF enb_1_2_0_gated = '1' THEN
        doInterp_last_value <= doInterp_2;
      END IF;
    END IF;
  END PROCESS out7_bypass_process;


  
  doInterp_2 <= doInterp_last_value WHEN stateControl_2 = '0' ELSE
      doInterp_1;

  out8_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        addrBias_last_value <= to_unsigned(16#0#, 2);
      ELSIF enb_1_2_0_gated = '1' THEN
        addrBias_last_value <= addrBias_bypass;
      END IF;
    END IF;
  END PROCESS out8_bypass_process;


  
  addrBias_bypass <= addrBias_last_value WHEN stateControl_2 = '0' ELSE
      addrBias_1;

  rsData_re <= std_logic_vector(rsData_bypass_re);

  rsData_im <= std_logic_vector(rsData_bypass_im);

  addr <= std_logic_vector(addr_bypass);

  wrtEnA0 <= wrtEnA0_2;

  wrtEnA1 <= wrtEnA1_2;

  doAverage <= doAverage_2;

  isFirstRS <= isFirstRS_2;

  isLastRS <= isLastRS_2;

  doInterp <= doInterp_2;

  addrBias <= std_logic_vector(addrBias_bypass);

END rtl;

