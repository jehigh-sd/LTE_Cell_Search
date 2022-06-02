-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FrequencyEstimation.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FrequencyEstimation
-- Source Path: ltehdlDownlinkSyncDemod/FrequencyEstimation
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlDownlinkSyncDemod;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FrequencyEstimation IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validIn                           :   IN    std_logic;
        freqEst                           :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14
        freqEstValid                      :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FrequencyEstimation;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_FrequencyEstimation IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CyclicPrefixCorrelator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          validIn                         :   IN    std_logic;
          corrOut_re                      :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          corrOut_im                      :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Rect2Polar
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          dataIn_im                       :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          validIn                         :   IN    std_logic;
          magOut                          :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En23
          angleOut                        :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En14
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_AngleAtMaximum
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          magIn                           :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En23
          angleIn                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En14
          validIn                         :   IN    std_logic;
          angleOut                        :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En14
          slotValidOut                    :   OUT   std_logic;
          sampleValidOut                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_AngleFilter
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          angleIn                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En14
          slotValidIn                     :   IN    std_logic;
          sampleValidIn                   :   IN    std_logic;
          angleOut                        :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En14
          sampleValidOut                  :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CyclicPrefixCorrelator
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CyclicPrefixCorrelator(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Rect2Polar
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Rect2Polar(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_AngleAtMaximum
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_AngleAtMaximum(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_AngleFilter
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_AngleFilter(rtl);

  -- Signals
  SIGNAL CyclicPrefixCorrelator_out1_re   : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL CyclicPrefixCorrelator_out1_im   : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL CyclicPrefixCorrelator_out2      : std_logic;
  SIGNAL Rect2Polar_out1                  : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL Rect2Polar_out2                  : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL Rect2Polar_out3                  : std_logic;
  SIGNAL AngleAtMaximum_out1              : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL AngleAtMaximum_out2              : std_logic;
  SIGNAL AngleAtMaximum_out3              : std_logic;
  SIGNAL AngleFilter_out1                 : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL tb_freqEstDataValid              : std_logic;
  SIGNAL AngleFilter_out1_signed          : signed(13 DOWNTO 0);  -- sfix14_En14
  SIGNAL tb_freqEstData                   : signed(13 DOWNTO 0);  -- sfix14

BEGIN
  u_CyclicPrefixCorrelator : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_CyclicPrefixCorrelator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => dataIn_re,  -- sfix16_En15
              dataIn_im => dataIn_im,  -- sfix16_En15
              validIn => validIn,
              corrOut_re => CyclicPrefixCorrelator_out1_re,  -- sfix24_En23
              corrOut_im => CyclicPrefixCorrelator_out1_im,  -- sfix24_En23
              validOut => CyclicPrefixCorrelator_out2
              );

  u_Rect2Polar : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Rect2Polar
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => CyclicPrefixCorrelator_out1_re,  -- sfix24_En23
              dataIn_im => CyclicPrefixCorrelator_out1_im,  -- sfix24_En23
              validIn => CyclicPrefixCorrelator_out2,
              magOut => Rect2Polar_out1,  -- sfix25_En23
              angleOut => Rect2Polar_out2,  -- sfix14_En14
              validOut => Rect2Polar_out3
              );

  u_AngleAtMaximum : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_AngleAtMaximum
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              magIn => Rect2Polar_out1,  -- sfix25_En23
              angleIn => Rect2Polar_out2,  -- sfix14_En14
              validIn => Rect2Polar_out3,
              angleOut => AngleAtMaximum_out1,  -- sfix14_En14
              slotValidOut => AngleAtMaximum_out2,
              sampleValidOut => AngleAtMaximum_out3
              );

  u_AngleFilter : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_AngleFilter
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              angleIn => AngleAtMaximum_out1,  -- sfix14_En14
              slotValidIn => AngleAtMaximum_out2,
              sampleValidIn => AngleAtMaximum_out3,
              angleOut => AngleFilter_out1,  -- sfix14_En14
              sampleValidOut => tb_freqEstDataValid
              );

  AngleFilter_out1_signed <= signed(AngleFilter_out1);

  tb_freqEstData <= AngleFilter_out1_signed;

  freqEst <= std_logic_vector(tb_freqEstData);

  freqEstValid <= tb_freqEstDataValid;

END rtl;

