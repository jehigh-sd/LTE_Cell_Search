-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlPBCHDecoder\LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIB_Interpretation.vhd
-- Created: 2022-05-23 17:26:45
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIB_Interpretation
-- Source Path: ltehdlPBCHDecoder/MIB Interpretation
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ltehdlPBCHDecoder_pac.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIB_Interpretation IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        restartMIB                        :   IN    std_logic;
        MIBDetect                         :   IN    std_logic;
        dataIn                            :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        nfmod4                            :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        clearReg                          :   IN    std_logic;
        NDLRB                             :   OUT   std_logic_vector(6 DOWNTO 0);  -- ufix7
        PHICHDuration                     :   OUT   std_logic;
        Ng                                :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        NFrame                            :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
        MIBDetected                       :   OUT   std_logic;
        MIBError                          :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIB_Interpretation;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIB_Interpretation IS

  -- Constants
  CONSTANT nc                             : vector_of_unsigned7(0 TO 5) := 
    (to_unsigned(16#06#, 7), to_unsigned(16#0F#, 7), to_unsigned(16#19#, 7), to_unsigned(16#32#, 7),
     to_unsigned(16#4B#, 7), to_unsigned(16#64#, 7));  -- ufix7 [6]

  -- Signals
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(0 TO 41);  -- ufix1 [42]
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL enb_gated                        : std_logic;
  SIGNAL in2_unsigned                     : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL in3_unsigned                     : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL NDLRB_1                          : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL PHICHDuration_1                  : std_logic;
  SIGNAL Ng_1                             : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL NFrame_1                         : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL MIBDetected_1                    : std_logic;
  SIGNAL AllZeroMIB                       : std_logic;
  SIGNAL MIBError_1                       : std_logic;
  SIGNAL NDLRBReg                         : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL NgReg                            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL PHICHReg                         : std_logic;
  SIGNAL NFrameReg                        : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL MIBDetectedReg                   : std_logic;
  SIGNAL AllZeroMIB_reg                   : std_logic;
  SIGNAL waitingForMIB                    : std_logic;
  SIGNAL MIBErrorReg                      : std_logic;
  SIGNAL NDLRBReg_next                    : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL NgReg_next                       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL PHICHReg_next                    : std_logic;
  SIGNAL NFrameReg_next                   : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL MIBDetectedReg_next              : std_logic;
  SIGNAL AllZeroMIB_reg_next              : std_logic;
  SIGNAL waitingForMIB_next               : std_logic;
  SIGNAL MIBErrorReg_next                 : std_logic;
  SIGNAL NDLRB_bypass                     : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL NDLRB_last_value                 : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL PHICHDuration_2                  : std_logic;
  SIGNAL PHICHDuration_last_value         : std_logic;
  SIGNAL Ng_bypass                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Ng_last_value                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL NFrame_bypass                    : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL NFrame_last_value                : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL MIBDetected_2                    : std_logic;
  SIGNAL MIBDetected_last_value           : std_logic;
  SIGNAL MIBError_2                       : std_logic;
  SIGNAL MIBError_last_value              : std_logic;

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

  in2_unsigned <= unsigned(dataIn);

  in3_unsigned <= unsigned(nfmod4);

  MIB_Interpretation_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        NDLRBReg <= to_unsigned(16#00#, 7);
        NgReg <= to_unsigned(16#0#, 2);
        PHICHReg <= '0';
        NFrameReg <= to_unsigned(16#000#, 10);
        MIBDetectedReg <= '0';
        AllZeroMIB_reg <= '0';
        waitingForMIB <= '1';
        MIBErrorReg <= '0';
      ELSIF enb_gated = '1' THEN
        NDLRBReg <= NDLRBReg_next;
        NgReg <= NgReg_next;
        PHICHReg <= PHICHReg_next;
        NFrameReg <= NFrameReg_next;
        MIBDetectedReg <= MIBDetectedReg_next;
        AllZeroMIB_reg <= AllZeroMIB_reg_next;
        waitingForMIB <= waitingForMIB_next;
        MIBErrorReg <= MIBErrorReg_next;
      END IF;
    END IF;
  END PROCESS MIB_Interpretation_process;

  MIB_Interpretation_output : PROCESS (AllZeroMIB_reg, MIBDetect, MIBDetectedReg, MIBErrorReg, NDLRBReg, NFrameReg,
       NgReg, PHICHReg, clearReg, in2_unsigned, in3_unsigned, restartMIB,
       waitingForMIB)
    VARIABLE RBIndex : unsigned(6 DOWNTO 0);
    VARIABLE NFIndex : unsigned(15 DOWNTO 0);
    VARIABLE add_cast : unsigned(1 DOWNTO 0);
    VARIABLE add_cast_0 : unsigned(3 DOWNTO 0);
    VARIABLE add_cast_1 : unsigned(1 DOWNTO 0);
    VARIABLE add_cast_2 : unsigned(3 DOWNTO 0);
    VARIABLE add_temp : unsigned(3 DOWNTO 0);
    VARIABLE add_cast_3 : unsigned(5 DOWNTO 0);
    VARIABLE add_cast_4 : unsigned(5 DOWNTO 0);
    VARIABLE sub_cast : signed(31 DOWNTO 0);
    VARIABLE add_cast_5 : unsigned(1 DOWNTO 0);
    VARIABLE add_cast_6 : unsigned(3 DOWNTO 0);
    VARIABLE add_cast_7 : unsigned(1 DOWNTO 0);
    VARIABLE add_cast_8 : unsigned(3 DOWNTO 0);
    VARIABLE add_temp_0 : unsigned(3 DOWNTO 0);
    VARIABLE add_cast_9 : unsigned(5 DOWNTO 0);
    VARIABLE add_cast_10 : unsigned(1 DOWNTO 0);
    VARIABLE add_cast_11 : unsigned(5 DOWNTO 0);
    VARIABLE add_temp_1 : unsigned(5 DOWNTO 0);
    VARIABLE add_cast_12 : unsigned(7 DOWNTO 0);
    VARIABLE add_cast_13 : unsigned(1 DOWNTO 0);
    VARIABLE add_cast_14 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp_2 : unsigned(7 DOWNTO 0);
    VARIABLE add_cast_15 : unsigned(9 DOWNTO 0);
    VARIABLE add_cast_16 : unsigned(1 DOWNTO 0);
    VARIABLE add_cast_17 : unsigned(9 DOWNTO 0);
    VARIABLE add_temp_3 : unsigned(9 DOWNTO 0);
    VARIABLE add_cast_18 : unsigned(11 DOWNTO 0);
    VARIABLE add_cast_19 : unsigned(1 DOWNTO 0);
    VARIABLE add_cast_20 : unsigned(11 DOWNTO 0);
    VARIABLE add_temp_4 : unsigned(11 DOWNTO 0);
    VARIABLE add_cast_21 : unsigned(13 DOWNTO 0);
    VARIABLE add_cast_22 : unsigned(1 DOWNTO 0);
    VARIABLE add_cast_23 : unsigned(13 DOWNTO 0);
    VARIABLE add_temp_5 : unsigned(13 DOWNTO 0);
    VARIABLE add_cast_24 : unsigned(15 DOWNTO 0);
    VARIABLE add_cast_25 : unsigned(1 DOWNTO 0);
    VARIABLE add_cast_26 : unsigned(15 DOWNTO 0);
    VARIABLE add_cast_27 : unsigned(1 DOWNTO 0);
    VARIABLE add_cast_28 : unsigned(3 DOWNTO 0);
    VARIABLE add_cast_29 : unsigned(3 DOWNTO 0);
    VARIABLE add_temp_6 : unsigned(3 DOWNTO 0);
    VARIABLE add_cast_30 : unsigned(18 DOWNTO 0);
    VARIABLE add_temp_7 : unsigned(18 DOWNTO 0);
  BEGIN
    RBIndex := to_unsigned(16#00#, 7);
    NFIndex := to_unsigned(16#0000#, 16);
    add_temp := to_unsigned(16#0#, 4);
    add_temp_0 := to_unsigned(16#0#, 4);
    add_temp_1 := to_unsigned(16#00#, 6);
    add_temp_2 := to_unsigned(16#00#, 8);
    add_temp_3 := to_unsigned(16#000#, 10);
    add_temp_4 := to_unsigned(16#000#, 12);
    add_temp_5 := to_unsigned(16#0000#, 14);
    add_temp_6 := to_unsigned(16#0#, 4);
    add_temp_7 := to_unsigned(16#00000#, 19);
    add_cast := to_unsigned(16#0#, 2);
    add_cast_0 := to_unsigned(16#0#, 4);
    add_cast_1 := to_unsigned(16#0#, 2);
    add_cast_2 := to_unsigned(16#0#, 4);
    add_cast_3 := to_unsigned(16#00#, 6);
    add_cast_4 := to_unsigned(16#00#, 6);
    sub_cast := to_signed(16#00000000#, 32);
    add_cast_5 := to_unsigned(16#0#, 2);
    add_cast_6 := to_unsigned(16#0#, 4);
    add_cast_7 := to_unsigned(16#0#, 2);
    add_cast_8 := to_unsigned(16#0#, 4);
    add_cast_9 := to_unsigned(16#00#, 6);
    add_cast_10 := to_unsigned(16#0#, 2);
    add_cast_11 := to_unsigned(16#00#, 6);
    add_cast_12 := to_unsigned(16#00#, 8);
    add_cast_13 := to_unsigned(16#0#, 2);
    add_cast_14 := to_unsigned(16#00#, 8);
    add_cast_15 := to_unsigned(16#000#, 10);
    add_cast_16 := to_unsigned(16#0#, 2);
    add_cast_17 := to_unsigned(16#000#, 10);
    add_cast_18 := to_unsigned(16#000#, 12);
    add_cast_19 := to_unsigned(16#0#, 2);
    add_cast_20 := to_unsigned(16#000#, 12);
    add_cast_21 := to_unsigned(16#0000#, 14);
    add_cast_22 := to_unsigned(16#0#, 2);
    add_cast_23 := to_unsigned(16#0000#, 14);
    add_cast_24 := to_unsigned(16#0000#, 16);
    add_cast_25 := to_unsigned(16#0#, 2);
    add_cast_26 := to_unsigned(16#0000#, 16);
    add_cast_27 := to_unsigned(16#0#, 2);
    add_cast_28 := to_unsigned(16#0#, 4);
    add_cast_29 := to_unsigned(16#0#, 4);
    add_cast_30 := to_unsigned(16#00000#, 19);
    NDLRBReg_next <= NDLRBReg;
    NgReg_next <= NgReg;
    PHICHReg_next <= PHICHReg;
    NFrameReg_next <= NFrameReg;
    MIBDetectedReg_next <= MIBDetectedReg;
    AllZeroMIB_reg_next <= AllZeroMIB_reg;
    waitingForMIB_next <= waitingForMIB;
    MIBErrorReg_next <= MIBErrorReg;
    IF (restartMIB AND ( NOT MIBDetect)) = '1' THEN 
      MIBErrorReg_next <= '1';
    ELSIF clearReg = '1' THEN 
      MIBErrorReg_next <= '0';
    END IF;
    IF waitingForMIB = '1' THEN 
      IF MIBDetect = '1' THEN 
        waitingForMIB_next <= '0';
        IF in2_unsigned = to_unsigned(16#000000#, 24) THEN 
          AllZeroMIB_reg_next <= '1';
        END IF;
        add_cast := '0' & in2_unsigned(0);
        add_cast_0 := resize(add_cast & '0', 4);
        add_cast_1 := '0' & in2_unsigned(1);
        add_cast_2 := resize(add_cast_1, 4);
        add_temp := add_cast_0 + add_cast_2;
        add_cast_3 := resize(add_temp & '0', 6);
        add_cast_4 := '0' & '0' & '0' & '0' & '0' & in2_unsigned(2);
        RBIndex := resize(add_cast_3 + add_cast_4, 7) + to_unsigned(16#01#, 7);
        IF RBIndex < to_unsigned(16#07#, 7) THEN 
          sub_cast := signed(resize(RBIndex, 32));
          NDLRBReg_next <= nc(to_integer(sub_cast - 1));
        END IF;
        add_cast_5 := '0' & in2_unsigned(6);
        add_cast_6 := resize(add_cast_5 & '0', 4);
        add_cast_7 := '0' & in2_unsigned(7);
        add_cast_8 := resize(add_cast_7, 4);
        add_temp_0 := add_cast_6 + add_cast_8;
        add_cast_9 := resize(add_temp_0 & '0', 6);
        add_cast_10 := '0' & in2_unsigned(8);
        add_cast_11 := resize(add_cast_10, 6);
        add_temp_1 := add_cast_9 + add_cast_11;
        add_cast_12 := resize(add_temp_1 & '0', 8);
        add_cast_13 := '0' & in2_unsigned(9);
        add_cast_14 := resize(add_cast_13, 8);
        add_temp_2 := add_cast_12 + add_cast_14;
        add_cast_15 := resize(add_temp_2 & '0', 10);
        add_cast_16 := '0' & in2_unsigned(10);
        add_cast_17 := resize(add_cast_16, 10);
        add_temp_3 := add_cast_15 + add_cast_17;
        add_cast_18 := resize(add_temp_3 & '0', 12);
        add_cast_19 := '0' & in2_unsigned(11);
        add_cast_20 := resize(add_cast_19, 12);
        add_temp_4 := add_cast_18 + add_cast_20;
        add_cast_21 := resize(add_temp_4 & '0', 14);
        add_cast_22 := '0' & in2_unsigned(12);
        add_cast_23 := resize(add_cast_22, 14);
        add_temp_5 := add_cast_21 + add_cast_23;
        add_cast_24 := resize(add_temp_5 & '0', 16);
        add_cast_25 := '0' & in2_unsigned(13);
        add_cast_26 := resize(add_cast_25, 16);
        NFIndex := add_cast_24 + add_cast_26;
        IF in2_unsigned(3) /= '0' THEN 
          PHICHReg_next <= '1';
        ELSE 
          PHICHReg_next <= '0';
        END IF;
        add_cast_27 := '0' & in2_unsigned(4);
        add_cast_28 := resize(add_cast_27 & '0', 4);
        add_cast_29 := '0' & '0' & '0' & in2_unsigned(5);
        add_temp_6 := add_cast_28 + add_cast_29;
        IF add_temp_6(3 DOWNTO 2) /= "00" THEN 
          NgReg_next <= "11";
        ELSE 
          NgReg_next <= add_temp_6(1 DOWNTO 0);
        END IF;
        add_cast_30 := resize(NFIndex & '0' & '0', 19);
        add_temp_7 := add_cast_30 + resize(in3_unsigned, 19);
        IF add_temp_7(18 DOWNTO 10) /= "000000000" THEN 
          NFrameReg_next <= "1111111111";
        ELSE 
          NFrameReg_next <= add_temp_7(9 DOWNTO 0);
        END IF;
        MIBDetectedReg_next <= '1';
      END IF;
    ELSIF clearReg = '1' THEN 
      NDLRBReg_next <= to_unsigned(16#00#, 7);
      NgReg_next <= to_unsigned(16#0#, 2);
      PHICHReg_next <= '0';
      NFrameReg_next <= to_unsigned(16#000#, 10);
      MIBDetectedReg_next <= '0';
      AllZeroMIB_reg_next <= '0';
      waitingForMIB_next <= '1';
      MIBErrorReg_next <= '0';
    END IF;
    NDLRB_1 <= NDLRBReg;
    PHICHDuration_1 <= PHICHReg;
    Ng_1 <= NgReg;
    NFrame_1 <= NFrameReg;
    MIBDetected_1 <= MIBDetectedReg;
    AllZeroMIB <= AllZeroMIB_reg;
    MIBError_1 <= MIBErrorReg;
  END PROCESS MIB_Interpretation_output;


  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        NDLRB_last_value <= to_unsigned(16#00#, 7);
      ELSIF enb_gated = '1' THEN
        NDLRB_last_value <= NDLRB_bypass;
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  NDLRB_bypass <= NDLRB_last_value WHEN stateControl_2 = '0' ELSE
      NDLRB_1;

  out1_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PHICHDuration_last_value <= '0';
      ELSIF enb_gated = '1' THEN
        PHICHDuration_last_value <= PHICHDuration_2;
      END IF;
    END IF;
  END PROCESS out1_bypass_process;


  
  PHICHDuration_2 <= PHICHDuration_last_value WHEN stateControl_2 = '0' ELSE
      PHICHDuration_1;

  out2_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Ng_last_value <= to_unsigned(16#0#, 2);
      ELSIF enb_gated = '1' THEN
        Ng_last_value <= Ng_bypass;
      END IF;
    END IF;
  END PROCESS out2_bypass_process;


  
  Ng_bypass <= Ng_last_value WHEN stateControl_2 = '0' ELSE
      Ng_1;

  out3_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        NFrame_last_value <= to_unsigned(16#000#, 10);
      ELSIF enb_gated = '1' THEN
        NFrame_last_value <= NFrame_bypass;
      END IF;
    END IF;
  END PROCESS out3_bypass_process;


  
  NFrame_bypass <= NFrame_last_value WHEN stateControl_2 = '0' ELSE
      NFrame_1;

  out4_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        MIBDetected_last_value <= '0';
      ELSIF enb_gated = '1' THEN
        MIBDetected_last_value <= MIBDetected_2;
      END IF;
    END IF;
  END PROCESS out4_bypass_process;


  
  MIBDetected_2 <= MIBDetected_last_value WHEN stateControl_2 = '0' ELSE
      MIBDetected_1;

  out6_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        MIBError_last_value <= '0';
      ELSIF enb_gated = '1' THEN
        MIBError_last_value <= MIBError_2;
      END IF;
    END IF;
  END PROCESS out6_bypass_process;


  
  MIBError_2 <= MIBError_last_value WHEN stateControl_2 = '0' ELSE
      MIBError_1;

  NDLRB <= std_logic_vector(NDLRB_bypass);

  PHICHDuration <= PHICHDuration_2;

  Ng <= std_logic_vector(Ng_bypass);

  NFrame <= std_logic_vector(NFrame_bypass);

  MIBDetected <= MIBDetected_2;

  MIBError <= MIBError_2;

END rtl;

