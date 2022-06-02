-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Addressable_Delay_Line_block11.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Addressable_Delay_Line_block11
-- Source Path: ltehdlDownlinkSyncDemod/Sync Signal Search/PSS Searcher/Correlators/PSSXCorr2/C-D/Addressable Delay 
-- Lin
-- Hierarchy Level: 8
-- 
-- Addressable Delay Line
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlDownlinkSyncDemod;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Addressable_Delay_Line_block11 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn                            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        wrEn                              :   IN    std_logic;
        wrAddr                            :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
        rdAddr                            :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
        delayLineEnd                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        dataOut                           :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Addressable_Delay_Line_block11;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Addressable_Delay_Line_block11 IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SimpleDualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SimpleDualPortRAM_generic
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SimpleDualPortRAM_generic(rtl);

  -- Signals
  SIGNAL wrAddr_unsigned                  : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL rdAddr_unsigned                  : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL relop_relop1                     : std_logic;
  SIGNAL dataEndEn                        : std_logic;
  SIGNAL wrEnN                            : std_logic;
  SIGNAL dataEndEnS                       : std_logic;
  SIGNAL delayedSignals                   : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL delayedSignals_signed            : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL delayLineEnd_tmp                 : signed(15 DOWNTO 0);  -- sfix16_En15

BEGIN
  u_Delay_Line_Memory : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 5,
                 DataWidth => 16
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => dataIn,
              wr_addr => wrAddr,
              wr_en => wrEn,
              rd_addr => rdAddr,
              rd_dout => delayedSignals
              );

  wrAddr_unsigned <= unsigned(wrAddr);

  rdAddr_unsigned <= unsigned(rdAddr);

  
  relop_relop1 <= '1' WHEN wrAddr_unsigned = rdAddr_unsigned ELSE
      '0';

  dataOutReg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dataEndEn <= '0';
      ELSIF enb = '1' THEN
        dataEndEn <= relop_relop1;
      END IF;
    END IF;
  END PROCESS dataOutReg_process;


  wrEnN <=  NOT dataEndEn;

  dataEndEnS <= relop_relop1 AND wrEnN;

  delayedSignals_signed <= signed(delayedSignals);

  dataOutReg_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayLineEnd_tmp <= to_signed(16#0000#, 16);
      ELSIF enb = '1' AND dataEndEnS = '1' THEN
        delayLineEnd_tmp <= delayedSignals_signed;
      END IF;
    END IF;
  END PROCESS dataOutReg_1_process;


  delayLineEnd <= std_logic_vector(delayLineEnd_tmp);

  dataOut <= delayedSignals;

END rtl;

