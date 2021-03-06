-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FFT_HDL_Optimized_block.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FFT_HDL_Optimized_block
-- Source Path: ltehdlDownlinkSyncDemod/Sync Signal Search/SSS Searcher/FFT HDL Optimized
-- Hierarchy Level: 5
-- 
-- FFT
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlDownlinkSyncDemod;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FFT_HDL_Optimized_block IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        validIn                           :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        validOut                          :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FFT_HDL_Optimized_block;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FFT_HDL_Optimized_block IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_TWDLROM
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dMemOutDly_vld                  :   IN    std_logic;
          stage                           :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          initIC                          :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          twdl_re                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          twdl_im                         :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_MEMORY
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dMemIn1_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemIn1_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemIn2_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemIn2_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          wrEnb1                          :   IN    std_logic;
          wrEnb2                          :   IN    std_logic;
          wrEnb3                          :   IN    std_logic;
          rdEnb1                          :   IN    std_logic;
          rdEnb2                          :   IN    std_logic;
          rdEnb3                          :   IN    std_logic;
          stage                           :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          initIC                          :   IN    std_logic;
          unLoadPhase                     :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          dMemOut1_re                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemOut1_im                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemOut2_re                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemOut2_im                     :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_BTFSEL
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          din_1_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          din_1_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          validIn                         :   IN    std_logic;
          rdy                             :   IN    std_logic;
          dMemOut1_re                     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemOut1_im                     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemOut2_re                     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemOut2_im                     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemOut_vld                     :   IN    std_logic;
          stage                           :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          initIC                          :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          btfIn1_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfIn1_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfIn2_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfIn2_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfIn_vld                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2_BUTTERFLY
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          btfIn1_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfIn1_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfIn2_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfIn2_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfIn_vld                       :   IN    std_logic;
          twdl_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          twdl_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          syncReset                       :   IN    std_logic;
          btfOut1_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfOut1_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfOut2_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfOut2_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfOut_vld                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_MEMSEL
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          btfOut1_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfOut1_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfOut2_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfOut2_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          btfOut_vld                      :   IN    std_logic;
          stage                           :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          initIC                          :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          stgOut1_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          stgOut1_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          stgOut2_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          stgOut2_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          stgOut_vld                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_CTRL
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          din_1_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          din_1_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          validIn                         :   IN    std_logic;
          stgOut1_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          stgOut1_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          stgOut2_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          stgOut2_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          stgOut_vld                      :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          dMemIn1_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemIn1_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemIn2_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemIn2_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          wrEnb1                          :   OUT   std_logic;
          wrEnb2                          :   OUT   std_logic;
          wrEnb3                          :   OUT   std_logic;
          rdEnb1                          :   OUT   std_logic;
          rdEnb2                          :   OUT   std_logic;
          rdEnb3                          :   OUT   std_logic;
          dMemOut_vld                     :   OUT   std_logic;
          vldOut                          :   OUT   std_logic;
          stage                           :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
          rdy                             :   OUT   std_logic;
          initIC                          :   OUT   std_logic;
          unLoadPhase                     :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_OUTMux
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          rdEnb1                          :   IN    std_logic;
          rdEnb2                          :   IN    std_logic;
          rdEnb3                          :   IN    std_logic;
          dMemOut1_re                     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemOut1_im                     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemOut2_re                     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          dMemOut2_im                     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          vldOut                          :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          dOut_re                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          dOut_im                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          dout_vld                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_TWDLROM
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_TWDLROM(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_MEMORY
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_MEMORY(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_BTFSEL
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_BTFSEL(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2_BUTTERFLY
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2_BUTTERFLY(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_MEMSEL
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_MEMSEL(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_CTRL
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_CTRL(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_OUTMux
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_OUTMux(rtl);

  -- Signals
  SIGNAL dMemOut_vld                      : std_logic;
  SIGNAL dMemOutDly_vld                   : std_logic;
  SIGNAL stage                            : std_logic_vector(2 DOWNTO 0);  -- ufix3
  SIGNAL initIC                           : std_logic;
  SIGNAL twdl_re                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL twdl_im                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dMemIn1_re                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dMemIn1_im                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dMemIn2_re                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dMemIn2_im                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL wrEnb1                           : std_logic;
  SIGNAL wrEnb2                           : std_logic;
  SIGNAL wrEnb3                           : std_logic;
  SIGNAL rdEnb1                           : std_logic;
  SIGNAL rdEnb2                           : std_logic;
  SIGNAL rdEnb3                           : std_logic;
  SIGNAL unLoadPhase                      : std_logic;
  SIGNAL dMemOut1_re                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dMemOut1_im                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dMemOut2_re                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dMemOut2_im                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL rdy                              : std_logic;
  SIGNAL btfIn1_re                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL btfIn1_im                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL btfIn2_re                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL btfIn2_im                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL btfIn_vld                        : std_logic;
  SIGNAL btfOut1_re                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL btfOut1_im                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL btfOut2_re                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL btfOut2_im                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL btfOut_vld                       : std_logic;
  SIGNAL stgOut1_re                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL stgOut1_im                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL stgOut2_re                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL stgOut2_im                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL stgOut_vld                       : std_logic;
  SIGNAL vldOut                           : std_logic;
  SIGNAL dOut_re                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dOut_im                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dout_vld                         : std_logic;

BEGIN
  u_MinResRX2FFT_TWDLROM : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_TWDLROM
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dMemOutDly_vld => dMemOutDly_vld,
              stage => stage,  -- ufix3
              initIC => initIC,
              syncReset => syncReset,
              twdl_re => twdl_re,  -- ufix16
              twdl_im => twdl_im  -- ufix16
              );

  u_MinResRX2FFT_MEMORY : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_MEMORY
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dMemIn1_re => dMemIn1_re,  -- ufix16
              dMemIn1_im => dMemIn1_im,  -- ufix16
              dMemIn2_re => dMemIn2_re,  -- ufix16
              dMemIn2_im => dMemIn2_im,  -- ufix16
              wrEnb1 => wrEnb1,
              wrEnb2 => wrEnb2,
              wrEnb3 => wrEnb3,
              rdEnb1 => rdEnb1,
              rdEnb2 => rdEnb2,
              rdEnb3 => rdEnb3,
              stage => stage,  -- ufix3
              initIC => initIC,
              unLoadPhase => unLoadPhase,
              syncReset => syncReset,
              dMemOut1_re => dMemOut1_re,  -- ufix16
              dMemOut1_im => dMemOut1_im,  -- ufix16
              dMemOut2_re => dMemOut2_re,  -- ufix16
              dMemOut2_im => dMemOut2_im  -- ufix16
              );

  u_MinResRX2FFT_BTFSEL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_BTFSEL
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              din_1_re => dataIn_re,  -- ufix16
              din_1_im => dataIn_im,  -- ufix16
              validIn => validIn,
              rdy => rdy,
              dMemOut1_re => dMemOut1_re,  -- ufix16
              dMemOut1_im => dMemOut1_im,  -- ufix16
              dMemOut2_re => dMemOut2_re,  -- ufix16
              dMemOut2_im => dMemOut2_im,  -- ufix16
              dMemOut_vld => dMemOut_vld,
              stage => stage,  -- ufix3
              initIC => initIC,
              syncReset => syncReset,
              btfIn1_re => btfIn1_re,  -- ufix16
              btfIn1_im => btfIn1_im,  -- ufix16
              btfIn2_re => btfIn2_re,  -- ufix16
              btfIn2_im => btfIn2_im,  -- ufix16
              btfIn_vld => btfIn_vld
              );

  u_MinResRX2FFT_BUTTERFLY : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2_BUTTERFLY
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              btfIn1_re => btfIn1_re,  -- ufix16
              btfIn1_im => btfIn1_im,  -- ufix16
              btfIn2_re => btfIn2_re,  -- ufix16
              btfIn2_im => btfIn2_im,  -- ufix16
              btfIn_vld => btfIn_vld,
              twdl_re => twdl_re,  -- ufix16
              twdl_im => twdl_im,  -- ufix16
              syncReset => syncReset,
              btfOut1_re => btfOut1_re,  -- ufix16
              btfOut1_im => btfOut1_im,  -- ufix16
              btfOut2_re => btfOut2_re,  -- ufix16
              btfOut2_im => btfOut2_im,  -- ufix16
              btfOut_vld => btfOut_vld
              );

  u_MinResRX2FFT_MEMSEL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_MEMSEL
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              btfOut1_re => btfOut1_re,  -- ufix16
              btfOut1_im => btfOut1_im,  -- ufix16
              btfOut2_re => btfOut2_re,  -- ufix16
              btfOut2_im => btfOut2_im,  -- ufix16
              btfOut_vld => btfOut_vld,
              stage => stage,  -- ufix3
              initIC => initIC,
              syncReset => syncReset,
              stgOut1_re => stgOut1_re,  -- ufix16
              stgOut1_im => stgOut1_im,  -- ufix16
              stgOut2_re => stgOut2_re,  -- ufix16
              stgOut2_im => stgOut2_im,  -- ufix16
              stgOut_vld => stgOut_vld
              );

  u_MinResRX2FFT_CTRL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_CTRL
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              din_1_re => dataIn_re,  -- ufix16
              din_1_im => dataIn_im,  -- ufix16
              validIn => validIn,
              stgOut1_re => stgOut1_re,  -- ufix16
              stgOut1_im => stgOut1_im,  -- ufix16
              stgOut2_re => stgOut2_re,  -- ufix16
              stgOut2_im => stgOut2_im,  -- ufix16
              stgOut_vld => stgOut_vld,
              syncReset => syncReset,
              dMemIn1_re => dMemIn1_re,  -- ufix16
              dMemIn1_im => dMemIn1_im,  -- ufix16
              dMemIn2_re => dMemIn2_re,  -- ufix16
              dMemIn2_im => dMemIn2_im,  -- ufix16
              wrEnb1 => wrEnb1,
              wrEnb2 => wrEnb2,
              wrEnb3 => wrEnb3,
              rdEnb1 => rdEnb1,
              rdEnb2 => rdEnb2,
              rdEnb3 => rdEnb3,
              dMemOut_vld => dMemOut_vld,
              vldOut => vldOut,
              stage => stage,  -- ufix3
              rdy => rdy,
              initIC => initIC,
              unLoadPhase => unLoadPhase
              );

  u_MinResRX2FFT_OUTMUX : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_MINRESRX2FFT_OUTMux
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              rdEnb1 => rdEnb1,
              rdEnb2 => rdEnb2,
              rdEnb3 => rdEnb3,
              dMemOut1_re => dMemOut1_re,  -- ufix16
              dMemOut1_im => dMemOut1_im,  -- ufix16
              dMemOut2_re => dMemOut2_re,  -- ufix16
              dMemOut2_im => dMemOut2_im,  -- ufix16
              vldOut => vldOut,
              syncReset => syncReset,
              dOut_re => dOut_re,  -- ufix16
              dOut_im => dOut_im,  -- ufix16
              dout_vld => dout_vld
              );

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dMemOutDly_vld <= '0';
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          dMemOutDly_vld <= '0';
        ELSE 
          dMemOutDly_vld <= dMemOut_vld;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  dataOut_re <= dOut_re;

  dataOut_im <= dOut_im;

  validOut <= dout_vld;

END rtl;

