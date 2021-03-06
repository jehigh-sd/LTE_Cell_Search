-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlPBCHDecoder\LTE_MIB_H_ip_src_ltehdlPBCHDecoder_CRCGenControl.vhd
-- Created: 2022-05-23 17:26:45
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlPBCHDecoder_CRCGenControl
-- Source Path: ltehdlPBCHDecoder/BCH Decoder/CRC Decoder/CRCGenerator/CRCGenControl
-- Hierarchy Level: 7
-- 
-- CRC Generator Control Signals Generation
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlPBCHDecoder_CRCGenControl IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        startIn                           :   IN    std_logic;  -- ufix1
        endIn                             :   IN    std_logic;  -- ufix1
        validIn                           :   IN    std_logic;  -- ufix1
        startOut                          :   OUT   std_logic;  -- ufix1
        processMsg                        :   OUT   std_logic;  -- ufix1
        padZero                           :   OUT   std_logic;  -- ufix1
        outputCRC                         :   OUT   std_logic;  -- ufix1
        endOut                            :   OUT   std_logic;  -- ufix1
        validOut                          :   OUT   std_logic;  -- ufix1
        regClr                            :   OUT   std_logic;  -- ufix1
        counter                           :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
        counter_outputCRC                 :   OUT   std_logic_vector(3 DOWNTO 0)  -- ufix4
        );
END LTE_MIB_H_ip_src_ltehdlPBCHDecoder_CRCGenControl;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlPBCHDecoder_CRCGenControl IS

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
  SIGNAL dataOut_register_reg             : std_logic_vector(0 TO 16);  -- ufix1 [17]
  SIGNAL validindelay                     : std_logic;  -- ufix1
  SIGNAL sofindelay                       : std_logic;  -- ufix1
  SIGNAL eofindelay                       : std_logic;  -- ufix1
  SIGNAL CRCControlFSM_FSMNextState       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL CRCControlFSM_Cnt1               : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL CRCControlFSM_Cnt2               : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL CRCControlFSM_Cnt3               : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL CRCControlFSM_Cnt3_enb           : std_logic;
  SIGNAL CRCControlFSM_FSMNextState_next  : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL CRCControlFSM_Cnt1_next          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL CRCControlFSM_Cnt2_next          : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL CRCControlFSM_Cnt3_next          : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL CRCControlFSM_Cnt3_enb_next      : std_logic;
  SIGNAL validOutTemp                     : std_logic;  -- ufix1
  SIGNAL endOutTemp                       : std_logic;  -- ufix1
  SIGNAL validLowFlag                     : std_logic;  -- ufix1
  SIGNAL counter_tmp                      : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL counter_outputCRC_tmp            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL dataOut_register_reg_1           : std_logic_vector(0 TO 15);  -- ufix1 [16]
  SIGNAL validLowFlag_register_reg        : std_logic_vector(0 TO 15);  -- ufix1 [16]
  SIGNAL validLowFlagDelay                : std_logic;  -- ufix1

BEGIN
  -- buffer for startOut
  dataOut_register_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dataOut_register_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        dataOut_register_reg(0) <= startIn;
        dataOut_register_reg(1 TO 16) <= dataOut_register_reg(0 TO 15);
      END IF;
    END IF;
  END PROCESS dataOut_register_process;

  startOut <= dataOut_register_reg(16);

  -- validIn buffer
  validInReg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        validindelay <= '0';
      ELSIF enb = '1' THEN
        validindelay <= validIn;
      END IF;
    END IF;
  END PROCESS validInReg_process;


  -- startIn buffer
  startInReg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        sofindelay <= '0';
      ELSIF enb = '1' THEN
        sofindelay <= startIn;
      END IF;
    END IF;
  END PROCESS startInReg_process;


  -- endIn buffer
  endInReg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        eofindelay <= '0';
      ELSIF enb = '1' THEN
        eofindelay <= endIn;
      END IF;
    END IF;
  END PROCESS endInReg_process;


  -- CRC Generator Control FSM
  CRCControlFSM_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        CRCControlFSM_FSMNextState <= to_unsigned(16#0#, 2);
        CRCControlFSM_Cnt1 <= to_unsigned(16#00#, 5);
        CRCControlFSM_Cnt2 <= to_unsigned(16#0#, 4);
        CRCControlFSM_Cnt3 <= to_unsigned(16#0#, 4);
        CRCControlFSM_Cnt3_enb <= '0';
      ELSIF enb = '1' THEN
        CRCControlFSM_FSMNextState <= CRCControlFSM_FSMNextState_next;
        CRCControlFSM_Cnt1 <= CRCControlFSM_Cnt1_next;
        CRCControlFSM_Cnt2 <= CRCControlFSM_Cnt2_next;
        CRCControlFSM_Cnt3 <= CRCControlFSM_Cnt3_next;
        CRCControlFSM_Cnt3_enb <= CRCControlFSM_Cnt3_enb_next;
      END IF;
    END IF;
  END PROCESS CRCControlFSM_process;

  CRCControlFSM_output : PROCESS (CRCControlFSM_Cnt1, CRCControlFSM_Cnt2, CRCControlFSM_Cnt3,
       CRCControlFSM_Cnt3_enb, CRCControlFSM_FSMNextState, eofindelay,
       sofindelay, startIn, validIn, validindelay)
    VARIABLE Cnt3_temp : unsigned(3 DOWNTO 0);
  BEGIN
    Cnt3_temp := CRCControlFSM_Cnt3;
    CRCControlFSM_FSMNextState_next <= CRCControlFSM_FSMNextState;
    CRCControlFSM_Cnt1_next <= CRCControlFSM_Cnt1;
    CRCControlFSM_Cnt2_next <= CRCControlFSM_Cnt2;
    CRCControlFSM_Cnt3_enb_next <= CRCControlFSM_Cnt3_enb;
    CASE CRCControlFSM_FSMNextState IS
      WHEN "00" =>
        validLowFlag <= '1';
        regClr <= '0';
        processMsg <= '0';
        padZero <= '0';
        endOutTemp <= '0';
        IF CRCControlFSM_Cnt3_enb = '1' THEN 
          validOutTemp <= '1';
          outputCRC <= '1';
          IF CRCControlFSM_Cnt3 = to_unsigned(16#F#, 4) THEN 
            CRCControlFSM_Cnt3_enb_next <= '0';
            Cnt3_temp := to_unsigned(16#0#, 4);
          ELSE 
            Cnt3_temp := CRCControlFSM_Cnt3 + to_unsigned(16#1#, 4);
          END IF;
        ELSE 
          validOutTemp <= '0';
          outputCRC <= '0';
        END IF;
        IF (validindelay /= '0') AND (sofindelay /= '0') THEN 
          processMsg <= '1';
        END IF;
        IF (validIn /= '0') AND (startIn /= '0') THEN 
          regClr <= '1';
          CRCControlFSM_FSMNextState_next <= to_unsigned(16#1#, 2);
          CRCControlFSM_Cnt1_next <= to_unsigned(16#00#, 5);
          CRCControlFSM_Cnt2_next <= to_unsigned(16#0#, 4);
        ELSE 
          CRCControlFSM_FSMNextState_next <= to_unsigned(16#0#, 2);
        END IF;
      WHEN "01" =>
        validLowFlag <= '1';
        regClr <= '0';
        processMsg <= '1';
        endOutTemp <= '0';
        padZero <= '0';
        CRCControlFSM_Cnt2_next <= to_unsigned(16#0#, 4);
        IF validindelay = '0' THEN 
          validLowFlag <= '0';
        END IF;
        IF (validIn /= '0') AND (startIn /= '0') THEN 
          regClr <= '1';
          CRCControlFSM_FSMNextState_next <= to_unsigned(16#1#, 2);
          CRCControlFSM_Cnt1_next <= to_unsigned(16#00#, 5);
          IF CRCControlFSM_Cnt3_enb = '1' THEN 
            validOutTemp <= '1';
            outputCRC <= '1';
            IF CRCControlFSM_Cnt3 = to_unsigned(16#F#, 4) THEN 
              CRCControlFSM_Cnt3_enb_next <= '0';
              Cnt3_temp := to_unsigned(16#0#, 4);
            ELSE 
              Cnt3_temp := CRCControlFSM_Cnt3 + to_unsigned(16#1#, 4);
            END IF;
          ELSE 
            validOutTemp <= '0';
            outputCRC <= '0';
          END IF;
        ELSE 
          IF CRCControlFSM_Cnt3_enb = '1' THEN 
            validOutTemp <= '1';
            outputCRC <= '1';
            IF CRCControlFSM_Cnt3 = to_unsigned(16#F#, 4) THEN 
              CRCControlFSM_Cnt3_enb_next <= '0';
              Cnt3_temp := to_unsigned(16#0#, 4);
            ELSE 
              Cnt3_temp := CRCControlFSM_Cnt3 + to_unsigned(16#1#, 4);
            END IF;
          ELSE 
            validOutTemp <= hdlcoder_to_stdlogic(CRCControlFSM_Cnt1 = to_unsigned(16#10#, 5));
            outputCRC <= '0';
          END IF;
          IF CRCControlFSM_Cnt1 < to_unsigned(16#10#, 5) THEN 
            CRCControlFSM_Cnt1_next <= CRCControlFSM_Cnt1 + to_unsigned(16#01#, 5);
          END IF;
          IF (validindelay /= '0') AND (eofindelay /= '0') THEN 
            CRCControlFSM_FSMNextState_next <= to_unsigned(16#2#, 2);
          ELSE 
            CRCControlFSM_FSMNextState_next <= to_unsigned(16#1#, 2);
          END IF;
        END IF;
      WHEN "10" =>
        validLowFlag <= '1';
        regClr <= '0';
        processMsg <= '0';
        padZero <= '1';
        IF (validindelay /= '0') AND (sofindelay /= '0') THEN 
          processMsg <= '1';
        END IF;
        IF (validIn /= '0') AND (startIn /= '0') THEN 
          regClr <= '1';
          CRCControlFSM_FSMNextState_next <= to_unsigned(16#1#, 2);
          CRCControlFSM_Cnt1_next <= to_unsigned(16#00#, 5);
          IF CRCControlFSM_Cnt2 = to_unsigned(16#F#, 4) THEN 
            validOutTemp <= '1';
            endOutTemp <= '1';
            CRCControlFSM_Cnt3_enb_next <= '1';
            outputCRC <= '0';
            Cnt3_temp := to_unsigned(16#0#, 4);
            CRCControlFSM_Cnt2_next <= to_unsigned(16#0#, 4);
          ELSE 
            endOutTemp <= '0';
            IF CRCControlFSM_Cnt3_enb = '1' THEN 
              validOutTemp <= '1';
              outputCRC <= '1';
              IF CRCControlFSM_Cnt3 = to_unsigned(16#F#, 4) THEN 
                CRCControlFSM_Cnt3_enb_next <= '0';
                Cnt3_temp := to_unsigned(16#0#, 4);
              END IF;
              Cnt3_temp := Cnt3_temp + to_unsigned(16#1#, 4);
            ELSE 
              validOutTemp <= '0';
              CRCControlFSM_Cnt2_next <= to_unsigned(16#0#, 4);
              Cnt3_temp := to_unsigned(16#0#, 4);
              outputCRC <= '0';
            END IF;
          END IF;
        ELSE 
          IF CRCControlFSM_Cnt1 = to_unsigned(16#10#, 5) THEN 
            validOutTemp <= '1';
          ELSIF (hdlcoder_to_stdlogic(CRCControlFSM_Cnt2 = to_unsigned(16#F#, 4)) OR CRCControlFSM_Cnt3_enb) = '1' THEN 
            validOutTemp <= '1';
          ELSE 
            CRCControlFSM_Cnt1_next <= CRCControlFSM_Cnt1 + to_unsigned(16#01#, 5);
            validOutTemp <= '0';
          END IF;
          IF CRCControlFSM_Cnt3_enb = '1' THEN 
            outputCRC <= '1';
            IF CRCControlFSM_Cnt3 = to_unsigned(16#F#, 4) THEN 
              CRCControlFSM_Cnt3_enb_next <= '0';
              Cnt3_temp := to_unsigned(16#0#, 4);
            END IF;
            Cnt3_temp := Cnt3_temp + to_unsigned(16#1#, 4);
          ELSE 
            outputCRC <= '0';
          END IF;
          IF CRCControlFSM_Cnt2 = to_unsigned(16#F#, 4) THEN 
            CRCControlFSM_FSMNextState_next <= to_unsigned(16#0#, 2);
            endOutTemp <= '1';
            CRCControlFSM_Cnt3_enb_next <= '1';
            Cnt3_temp := to_unsigned(16#0#, 4);
            CRCControlFSM_Cnt2_next <= to_unsigned(16#0#, 4);
          ELSE 
            CRCControlFSM_FSMNextState_next <= to_unsigned(16#2#, 2);
            endOutTemp <= '0';
            CRCControlFSM_Cnt2_next <= CRCControlFSM_Cnt2 + to_unsigned(16#1#, 4);
          END IF;
        END IF;
      WHEN OTHERS => 
        CRCControlFSM_FSMNextState_next <= to_unsigned(16#0#, 2);
        validOutTemp <= '0';
        endOutTemp <= '0';
        outputCRC <= '0';
        processMsg <= '0';
        padZero <= '0';
        regClr <= '0';
        validLowFlag <= '1';
    END CASE;
    counter_tmp <= CRCControlFSM_Cnt2;
    counter_outputCRC_tmp <= CRCControlFSM_Cnt3;
    CRCControlFSM_Cnt3_next <= Cnt3_temp;
  END PROCESS CRCControlFSM_output;


  -- buffer for endOut
  dataOut_register_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dataOut_register_reg_1 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        dataOut_register_reg_1(0) <= endOutTemp;
        dataOut_register_reg_1(1 TO 15) <= dataOut_register_reg_1(0 TO 14);
      END IF;
    END IF;
  END PROCESS dataOut_register_1_process;

  endOut <= dataOut_register_reg_1(15);

  -- buffer for validLowFlag
  validLowFlag_register_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        validLowFlag_register_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        validLowFlag_register_reg(0) <= validLowFlag;
        validLowFlag_register_reg(1 TO 15) <= validLowFlag_register_reg(0 TO 14);
      END IF;
    END IF;
  END PROCESS validLowFlag_register_process;

  validLowFlagDelay <= validLowFlag_register_reg(15);

  -- drag validOut down when validIn is low in the message processing state
  validOut <= validOutTemp AND validLowFlagDelay;

  counter <= std_logic_vector(counter_tmp);

  counter_outputCRC <= std_logic_vector(counter_outputCRC_tmp);

END rtl;

