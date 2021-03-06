-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlPBCHDecoder\LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ltehdlPBCHDecoder.vhd
-- Created: 2022-05-23 17:26:45
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ltehdlPBCHDecoder
-- Source Path: ltehdlPBCHDecoder
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlPBCHDecoder;

ENTITY LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ltehdlPBCHDecoder IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        enb_1_2_1                         :   IN    std_logic;
        NCellID                           :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
        symbols_eqSymbols_re              :   IN    std_logic_vector(17 DOWNTO 0);  -- record {sfix18_En17 (c),boolean}
        symbols_eqSymbols_im              :   IN    std_logic_vector(17 DOWNTO 0);  -- record {sfix18_En17 (c),boolean}
        symbols_eqSymbolsValid            :   IN    std_logic;  -- record {sfix18_En17 (c),boolean}
        enableDecoder                     :   IN    std_logic;
        clearOutputReg                    :   IN    std_logic;
        NDLRB                             :   OUT   std_logic_vector(6 DOWNTO 0);  -- ufix7
        PHICH                             :   OUT   std_logic;
        Ng                                :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        NFrame                            :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
        CellRefP                          :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
        MIBDetected                       :   OUT   std_logic;
        MIBError                          :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ltehdlPBCHDecoder;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlPBCHDecoder_ltehdlPBCHDecoder IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_SimpleDualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          wr_din_re                       :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_din_im                       :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout_re                      :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          rd_dout_im                      :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_restartMIBPulseResync
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          p                               :   IN    std_logic;
          q                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIBDetectedPulseResync
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          p                               :   IN    std_logic;
          q                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_repeatQPSKPulseResync
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          p                               :   IN    std_logic;
          q                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Controller
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          valid_eq                        :   IN    std_logic;
          repeat_qpsk                     :   IN    std_logic;
          MIB_detected                    :   IN    std_logic;
          restart_MIB                     :   IN    std_logic;
          load_des                        :   OUT   std_logic;
          enb_des                         :   OUT   std_logic;
          waddr_qpsk                      :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          raddr_qpsk                      :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Gold_Sequence_Generator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          Load                            :   IN    std_logic;
          Init                            :   IN    std_logic_vector(30 DOWNTO 0);  -- ufix31
          enable                          :   IN    std_logic;
          Out2                            :   OUT   std_logic;
          Out1                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Descrambling
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          goldSeq                         :   IN    std_logic;
          valid_seq                       :   IN    std_logic;
          qpsksymbol_re                   :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En17
          qpsksymbol_im                   :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En17
          deScrambled                     :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En17
          valid                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Rate_Recovery
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          data                            :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En17
          enb_1                           :   IN    std_logic;
          rateRecovered_0                 :   OUT   std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          rateRecovered_1                 :   OUT   std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          rateRecovered_2                 :   OUT   std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_BCH_Decoder
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_0                        :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          dataIn_1                        :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          dataIn_2                        :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En17
          validIn                         :   IN    std_logic;
          clearReg                        :   IN    std_logic;
          cellRefP                        :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
          repeatQPSK                      :   OUT   std_logic;
          restartMIB                      :   OUT   std_logic;
          MIBDetected                     :   OUT   std_logic;
          dataOut                         :   OUT   std_logic_vector(23 DOWNTO 0);  -- ufix24
          nfmod4                          :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIB_Interpretation
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          restartMIB                      :   IN    std_logic;
          MIBDetect                       :   IN    std_logic;
          dataIn                          :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
          nfmod4                          :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          clearReg                        :   IN    std_logic;
          NDLRB                           :   OUT   std_logic_vector(6 DOWNTO 0);  -- ufix7
          PHICHDuration                   :   OUT   std_logic;
          Ng                              :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          NFrame                          :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          MIBDetected                     :   OUT   std_logic;
          MIBError                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_SimpleDualPortRAM_generic
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_SimpleDualPortRAM_generic(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_restartMIBPulseResync
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_restartMIBPulseResync(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIBDetectedPulseResync
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIBDetectedPulseResync(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_repeatQPSKPulseResync
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_repeatQPSKPulseResync(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Controller
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Controller(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Gold_Sequence_Generator
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Gold_Sequence_Generator(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Descrambling
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Descrambling(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Rate_Recovery
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Rate_Recovery(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_BCH_Decoder
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_BCH_Decoder(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIB_Interpretation
    USE ENTITY work_ltehdlPBCHDecoder.LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIB_Interpretation(rtl);

  -- Signals
  SIGNAL Upsample1_muxsel                 : std_logic;  -- ufix1
  SIGNAL eqSymbolsValid                   : std_logic;
  SIGNAL Delay12_out1                     : std_logic;
  SIGNAL Delay11_out1                     : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(0 TO 20);  -- ufix1 [21]
  SIGNAL Delay11_out1_1                   : std_logic;
  SIGNAL symbol_valid                     : std_logic;
  SIGNAL Upsample1_zero                   : std_logic;
  SIGNAL Repeat_out1                      : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Data_Type_Conversion8_out1       : unsigned(30 DOWNTO 0);  -- ufix31
  SIGNAL stateControl                     : std_logic;
  SIGNAL delayMatch3_reg                  : std_logic_vector(0 TO 41);  -- ufix1 [42]
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL enb_gated                        : std_logic;
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL delayMatch2_reg                  : std_logic_vector(0 TO 41);  -- ufix1 [42]
  SIGNAL stateControl_3                   : std_logic;
  SIGNAL enb_gated_1                      : std_logic;
  SIGNAL eqSymbols_re                     : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL eqSymbols_im                     : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL wr_din_re                        : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL wr_din_im                        : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL stateControl_5                   : std_logic;
  SIGNAL delayMatch1_reg                  : std_logic_vector(0 TO 20);  -- ufix1 [21]
  SIGNAL stateControl_6                   : std_logic;
  SIGNAL enb_1_2_0_gated                  : std_logic;
  SIGNAL Repeat2_out1                     : std_logic;
  SIGNAL Delay6_out1_im                   : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL symbolBuffer_out1_im             : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL symbolBuffer_out1_im_signed      : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL waddr_qpsk                       : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL raddr_qpsk                       : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL symbolBuffer_out1_re             : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL symbolBuffer_out1_re_signed      : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL Delay6_out1_re                   : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL goldValid                        : std_logic;
  SIGNAL Delay5_out1                      : std_logic;
  SIGNAL enb_des                          : std_logic;
  SIGNAL gold_en                          : std_logic;
  SIGNAL restartMIB                       : std_logic;
  SIGNAL restart                          : std_logic;
  SIGNAL MIBDetected_1                    : std_logic;
  SIGNAL mib_detected                     : std_logic;
  SIGNAL repeatQPSK                       : std_logic;
  SIGNAL repeatQPSKPulseResync_out1       : std_logic;
  SIGNAL load_des                         : std_logic;
  SIGNAL gold_load                        : std_logic;
  SIGNAL Gold_Sequence_Generator_out1     : std_logic;
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL PBCH_Descrambling_out1           : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL descValid                        : std_logic;
  SIGNAL PBCH_Rate_Recovery_out1_0        : std_logic_vector(19 DOWNTO 0);  -- ufix20
  SIGNAL PBCH_Rate_Recovery_out1_1        : std_logic_vector(19 DOWNTO 0);  -- ufix20
  SIGNAL PBCH_Rate_Recovery_out1_2        : std_logic_vector(19 DOWNTO 0);  -- ufix20
  SIGNAL rateRecValid                     : std_logic;
  SIGNAL cellrefp_1                       : std_logic_vector(2 DOWNTO 0);  -- ufix3
  SIGNAL dataOut                          : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL BCH_Decoder_out6                 : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL restartMIB_1                     : std_logic;
  SIGNAL MIBDetected_2                    : std_logic;
  SIGNAL dataOut_1                        : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL dataOut_2                        : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL NDLRB_1                          : std_logic_vector(6 DOWNTO 0);  -- ufix7
  SIGNAL PHICHDuration                    : std_logic;
  SIGNAL Ng_1                             : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL NFrame_1                         : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL MIBDetected_3                    : std_logic;
  SIGNAL MIBError_1                       : std_logic;
  SIGNAL NDLRB_unsigned                   : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Downsample12_out1                : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Delay14_out1                     : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Downsample11_out1                : std_logic;
  SIGNAL Delay2_out1                      : std_logic;
  SIGNAL Ng_unsigned                      : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Downsample10_out1                : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Delay3_out1                      : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL NFrame_unsigned                  : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Downsample9_out1                 : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Delay7_out1                      : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL cellrefp_2                       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Downsample_out1                  : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Delay10_out1                     : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Downsample8_out1                 : std_logic;
  SIGNAL Delay8_out1                      : std_logic;
  SIGNAL Downsample2_out1                 : std_logic;
  SIGNAL Delay1_out1                      : std_logic;

BEGIN
  u_symbolBuffer : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 8,
                 DataWidth => 18
                 )
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              wr_din_re => std_logic_vector(wr_din_re),
              wr_din_im => std_logic_vector(wr_din_im),
              wr_addr => waddr_qpsk,
              wr_en => symbol_valid,
              rd_addr => raddr_qpsk,
              rd_dout_re => symbolBuffer_out1_re,
              rd_dout_im => symbolBuffer_out1_im
              );

  u_restartMIBPulseResync : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_restartMIBPulseResync
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_2_0 => enb_1_2_0,
              enb_1_2_1 => enb_1_2_1,
              p => restartMIB,
              q => restart
              );

  u_MIBDetectedPulseResync : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIBDetectedPulseResync
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_2_0 => enb_1_2_0,
              enb_1_2_1 => enb_1_2_1,
              p => MIBDetected_1,
              q => mib_detected
              );

  u_repeatQPSKPulseResync : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_repeatQPSKPulseResync
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_2_0 => enb_1_2_0,
              enb_1_2_1 => enb_1_2_1,
              p => repeatQPSK,
              q => repeatQPSKPulseResync_out1
              );

  u_PBCH_Controller : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Controller
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              valid_eq => symbol_valid,
              repeat_qpsk => repeatQPSKPulseResync_out1,
              MIB_detected => mib_detected,
              restart_MIB => restart,
              load_des => load_des,
              enb_des => enb_des,
              waddr_qpsk => waddr_qpsk,  -- uint8
              raddr_qpsk => raddr_qpsk  -- uint8
              );

  u_Gold_Sequence_Generator : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_Gold_Sequence_Generator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              Load => gold_load,
              Init => std_logic_vector(Data_Type_Conversion8_out1),  -- ufix31
              enable => gold_en,
              Out2 => Gold_Sequence_Generator_out1,
              Out1 => goldValid
              );

  u_PBCH_Descrambling : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Descrambling
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              goldSeq => Delay4_out1,
              valid_seq => Delay5_out1,
              qpsksymbol_re => std_logic_vector(Delay6_out1_re),  -- sfix18_En17
              qpsksymbol_im => std_logic_vector(Delay6_out1_im),  -- sfix18_En17
              deScrambled => PBCH_Descrambling_out1,  -- sfix18_En17
              valid => descValid
              );

  u_PBCH_Rate_Recovery : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_PBCH_Rate_Recovery
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data => PBCH_Descrambling_out1,  -- sfix18_En17
              enb_1 => descValid,
              rateRecovered_0 => PBCH_Rate_Recovery_out1_0,  -- sfix20_En17
              rateRecovered_1 => PBCH_Rate_Recovery_out1_1,  -- sfix20_En17
              rateRecovered_2 => PBCH_Rate_Recovery_out1_2,  -- sfix20_En17
              validOut => rateRecValid
              );

  u_BCH_Decoder : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_BCH_Decoder
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_0 => PBCH_Rate_Recovery_out1_0,  -- sfix20_En17
              dataIn_1 => PBCH_Rate_Recovery_out1_1,  -- sfix20_En17
              dataIn_2 => PBCH_Rate_Recovery_out1_2,  -- sfix20_En17
              validIn => rateRecValid,
              clearReg => Repeat2_out1,
              cellRefP => cellrefp_1,  -- ufix3
              repeatQPSK => repeatQPSK,
              restartMIB => restartMIB,
              MIBDetected => MIBDetected_1,
              dataOut => dataOut,  -- ufix24
              nfmod4 => BCH_Decoder_out6  -- ufix2
              );

  u_MIB_Interpretation : LTE_MIB_H_ip_src_ltehdlPBCHDecoder_MIB_Interpretation
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              restartMIB => restartMIB_1,
              MIBDetect => MIBDetected_2,
              dataIn => dataOut_2,  -- ufix24
              nfmod4 => BCH_Decoder_out6,  -- ufix2
              clearReg => Repeat2_out1,
              NDLRB => NDLRB_1,  -- ufix7
              PHICHDuration => PHICHDuration,
              Ng => Ng_1,  -- ufix2
              NFrame => NFrame_1,  -- ufix10
              MIBDetected => MIBDetected_3,
              MIBError => MIBError_1
              );

  -- Free running, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  -- 
  -- Upsample1: Upsample by 2, Sample offset 0 
  Upsample1_cnt_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Upsample1_muxsel <= '1';
      ELSIF enb = '1' THEN
        Upsample1_muxsel <=  NOT Upsample1_muxsel;
      END IF;
    END IF;
  END PROCESS Upsample1_cnt_process;


  eqSymbolsValid <= symbols_eqSymbolsValid;

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay12_out1 <= eqSymbolsValid;
      END IF;
    END IF;
  END PROCESS Delay12_process;


  Delay11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay11_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay11_out1 <= enableDecoder;
      END IF;
    END IF;
  END PROCESS Delay11_process;


  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch_reg(0) <= Delay11_out1;
        delayMatch_reg(1 TO 20) <= delayMatch_reg(0 TO 19);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  Delay11_out1_1 <= delayMatch_reg(20);

  symbol_valid <= Delay12_out1 AND Delay11_out1_1;

  Upsample1_zero <= '0';

  Repeat_out1 <= unsigned(NCellID);

  Data_Type_Conversion8_out1 <= resize(Repeat_out1, 31);

  stateControl <= '1';

  delayMatch3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch3_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch3_reg(0) <= stateControl;
        delayMatch3_reg(1 TO 41) <= delayMatch3_reg(0 TO 40);
      END IF;
    END IF;
  END PROCESS delayMatch3_process;

  stateControl_1 <= delayMatch3_reg(41);

  enb_gated <= stateControl_1 AND enb;

  stateControl_2 <= '1';

  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch2_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch2_reg(0) <= stateControl_2;
        delayMatch2_reg(1 TO 41) <= delayMatch2_reg(0 TO 40);
      END IF;
    END IF;
  END PROCESS delayMatch2_process;

  stateControl_3 <= delayMatch2_reg(41);

  enb_gated_1 <= stateControl_3 AND enb;

  eqSymbols_re <= signed(symbols_eqSymbols_re);

  eqSymbols_im <= signed(symbols_eqSymbols_im);

  Delay13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        wr_din_re <= to_signed(16#00000#, 18);
        wr_din_im <= to_signed(16#00000#, 18);
      ELSIF enb_1_2_0 = '1' THEN
        wr_din_re <= eqSymbols_re;
        wr_din_im <= eqSymbols_im;
      END IF;
    END IF;
  END PROCESS Delay13_process;


  stateControl_5 <= '1';

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch1_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch1_reg(0) <= stateControl_5;
        delayMatch1_reg(1 TO 20) <= delayMatch1_reg(0 TO 19);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  stateControl_6 <= delayMatch1_reg(20);

  enb_1_2_0_gated <= stateControl_6 AND enb_1_2_0;

  Repeat2_out1 <= clearOutputReg;

  symbolBuffer_out1_im_signed <= signed(symbolBuffer_out1_im);

  symbolBuffer_out1_re_signed <= signed(symbolBuffer_out1_re);

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_out1_re <= to_signed(16#00000#, 18);
        Delay6_out1_im <= to_signed(16#00000#, 18);
      ELSIF enb_1_2_0_gated = '1' THEN
        Delay6_out1_re <= symbolBuffer_out1_re_signed;
        Delay6_out1_im <= symbolBuffer_out1_im_signed;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1 <= '0';
      ELSIF enb_gated_1 = '1' THEN
        Delay5_out1 <= goldValid;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  gold_en <= enb_des;

  
  gold_load <= load_des WHEN Upsample1_muxsel = '1' ELSE
      Upsample1_zero;

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= '0';
      ELSIF enb_gated = '1' THEN
        Delay4_out1 <= Gold_Sequence_Generator_out1;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  restartMIB_1 <= restartMIB;

  MIBDetected_2 <= MIBDetected_1;

  dataOut_1 <= unsigned(dataOut);

  dataOut_2 <= std_logic_vector(dataOut_1);

  NDLRB_unsigned <= unsigned(NDLRB_1);

  -- Downsample by 2 register (Sample offset 0)
  Downsample12_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Downsample12_out1 <= to_unsigned(16#00#, 7);
      ELSIF enb_1_2_1 = '1' THEN
        Downsample12_out1 <= NDLRB_unsigned;
      END IF;
    END IF;
  END PROCESS Downsample12_output_process;


  Delay14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_out1 <= to_unsigned(16#00#, 7);
      ELSIF enb_1_2_0 = '1' THEN
        Delay14_out1 <= Downsample12_out1;
      END IF;
    END IF;
  END PROCESS Delay14_process;


  NDLRB <= std_logic_vector(Delay14_out1);

  -- Downsample by 2 register (Sample offset 0)
  Downsample11_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Downsample11_out1 <= '0';
      ELSIF enb_1_2_1 = '1' THEN
        Downsample11_out1 <= PHICHDuration;
      END IF;
    END IF;
  END PROCESS Downsample11_output_process;


  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay2_out1 <= Downsample11_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Ng_unsigned <= unsigned(Ng_1);

  -- Downsample by 2 register (Sample offset 0)
  Downsample10_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Downsample10_out1 <= to_unsigned(16#0#, 2);
      ELSIF enb_1_2_1 = '1' THEN
        Downsample10_out1 <= Ng_unsigned;
      END IF;
    END IF;
  END PROCESS Downsample10_output_process;


  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= to_unsigned(16#0#, 2);
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_out1 <= Downsample10_out1;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Ng <= std_logic_vector(Delay3_out1);

  NFrame_unsigned <= unsigned(NFrame_1);

  -- Downsample by 2 register (Sample offset 0)
  Downsample9_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Downsample9_out1 <= to_unsigned(16#000#, 10);
      ELSIF enb_1_2_1 = '1' THEN
        Downsample9_out1 <= NFrame_unsigned;
      END IF;
    END IF;
  END PROCESS Downsample9_output_process;


  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_out1 <= to_unsigned(16#000#, 10);
      ELSIF enb_1_2_0 = '1' THEN
        Delay7_out1 <= Downsample9_out1;
      END IF;
    END IF;
  END PROCESS Delay7_process;


  NFrame <= std_logic_vector(Delay7_out1);

  cellrefp_2 <= unsigned(cellrefp_1);

  -- Downsample by 2 register (Sample offset 0)
  Downsample_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Downsample_out1 <= to_unsigned(16#0#, 3);
      ELSIF enb_1_2_1 = '1' THEN
        Downsample_out1 <= cellrefp_2;
      END IF;
    END IF;
  END PROCESS Downsample_output_process;


  Delay10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay10_out1 <= to_unsigned(16#0#, 3);
      ELSIF enb_1_2_0 = '1' THEN
        Delay10_out1 <= Downsample_out1;
      END IF;
    END IF;
  END PROCESS Delay10_process;


  CellRefP <= std_logic_vector(Delay10_out1);

  -- Downsample by 2 register (Sample offset 0)
  Downsample8_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Downsample8_out1 <= '0';
      ELSIF enb_1_2_1 = '1' THEN
        Downsample8_out1 <= MIBDetected_3;
      END IF;
    END IF;
  END PROCESS Downsample8_output_process;


  Delay8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay8_out1 <= Downsample8_out1;
      END IF;
    END IF;
  END PROCESS Delay8_process;


  -- Downsample by 2 register (Sample offset 0)
  Downsample2_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Downsample2_out1 <= '0';
      ELSIF enb_1_2_1 = '1' THEN
        Downsample2_out1 <= MIBError_1;
      END IF;
    END IF;
  END PROCESS Downsample2_output_process;


  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay1_out1 <= Downsample2_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  PHICH <= Delay2_out1;

  MIBDetected <= Delay8_out1;

  MIBError <= Delay1_out1;

END rtl;

