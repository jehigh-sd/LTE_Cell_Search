-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\LTE_MIB_H_ip_dut.vhd
-- Created: 2022-05-23 17:29:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_dut
-- Source Path: LTE_MIB_H_ip/LTE_MIB_H_ip_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_dut IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        rxdatai_in                        :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        rxdataq_in                        :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        rxdatai_valid                     :   IN    std_logic;  -- ufix1
        rxdataq_valid                     :   IN    std_logic;  -- ufix1
        start_in                          :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        extdatasel_in                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        ce_out                            :   OUT   std_logic;  -- ufix1
        ncellid                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        tddmode                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        freqest                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        celldetected                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        cellsearchdone                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        NDLRB                             :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        PHICH                             :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        ng                                :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        nframe                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        cellrefip                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        mibdetected                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        miberror                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        rxdatai_ready                     :   OUT   std_logic;  -- ufix1
        rxdataq_ready                     :   OUT   std_logic  -- ufix1
        );
END LTE_MIB_H_ip_dut;


ARCHITECTURE rtl OF LTE_MIB_H_ip_dut IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_LTE_MIB_HDL
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          rxdatai_in                      :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          rxdataq_in                      :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          rxdatai_valid                   :   IN    std_logic;  -- ufix1
          rxdataq_valid                   :   IN    std_logic;  -- ufix1
          start_in                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
          extdatasel_in                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
          ce_out                          :   OUT   std_logic;  -- ufix1
          ncellid                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          tddmode                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          freqest                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          celldetected                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          cellsearchdone                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          NDLRB                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          PHICH                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          ng                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          nframe                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          cellrefip                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          mibdetected                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          miberror                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          rxdatai_ready                   :   OUT   std_logic;  -- ufix1
          rxdataq_ready                   :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_LTE_MIB_HDL
    USE ENTITY work.LTE_MIB_H_ip_src_LTE_MIB_HDL(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL rxdatai_valid_sig                : std_logic;  -- ufix1
  SIGNAL rxdataq_valid_sig                : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL ncellid_sig                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL tddmode_sig                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL freqest_sig                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL celldetected_sig                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL cellsearchdone_sig               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL NDLRB_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL PHICH_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ng_sig                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nframe_sig                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL cellrefip_sig                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL mibdetected_sig                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL miberror_sig                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rxdatai_ready_sig                : std_logic;  -- ufix1
  SIGNAL rxdataq_ready_sig                : std_logic;  -- ufix1

BEGIN
  u_LTE_MIB_H_ip_src_LTE_MIB_HDL : LTE_MIB_H_ip_src_LTE_MIB_HDL
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset_x => reset_x,
              rxdatai_in => rxdatai_in,  -- ufix128
              rxdataq_in => rxdataq_in,  -- ufix128
              rxdatai_valid => rxdatai_valid_sig,  -- ufix1
              rxdataq_valid => rxdataq_valid_sig,  -- ufix1
              start_in => start_in,  -- sfix32
              extdatasel_in => extdatasel_in,  -- sfix32
              ce_out => ce_out_sig,  -- ufix1
              ncellid => ncellid_sig,  -- sfix32
              tddmode => tddmode_sig,  -- sfix32
              freqest => freqest_sig,  -- sfix32
              celldetected => celldetected_sig,  -- sfix32
              cellsearchdone => cellsearchdone_sig,  -- sfix32
              NDLRB => NDLRB_sig,  -- sfix32
              PHICH => PHICH_sig,  -- sfix32
              ng => ng_sig,  -- sfix32
              nframe => nframe_sig,  -- sfix32
              cellrefip => cellrefip_sig,  -- sfix32
              mibdetected => mibdetected_sig,  -- sfix32
              miberror => miberror_sig,  -- sfix32
              rxdatai_ready => rxdatai_ready_sig,  -- ufix1
              rxdataq_ready => rxdataq_ready_sig  -- ufix1
              );

  rxdatai_valid_sig <= rxdatai_valid;

  rxdataq_valid_sig <= rxdataq_valid;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  ncellid <= ncellid_sig;

  tddmode <= tddmode_sig;

  freqest <= freqest_sig;

  celldetected <= celldetected_sig;

  cellsearchdone <= cellsearchdone_sig;

  NDLRB <= NDLRB_sig;

  PHICH <= PHICH_sig;

  ng <= ng_sig;

  nframe <= nframe_sig;

  cellrefip <= cellrefip_sig;

  mibdetected <= mibdetected_sig;

  miberror <= miberror_sig;

  rxdatai_ready <= rxdatai_ready_sig;

  rxdataq_ready <= rxdataq_ready_sig;

END rtl;
