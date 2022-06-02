-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlPBCHIndexing\LTE_MIB_H_ip_src_ltehdlPBCHIndexing_ltehdlPBCHIndexing.vhd
-- Created: 2022-05-23 17:26:45
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlPBCHIndexing_ltehdlPBCHIndexing
-- Source Path: ltehdlPBCHIndexing
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlPBCHIndexing;

ENTITY LTE_MIB_H_ip_src_ltehdlPBCHIndexing_ltehdlPBCHIndexing IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        cellID                            :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
        start                             :   IN    std_logic;
        addr_rd_addr                      :   OUT   std_logic_vector(10 DOWNTO 0);  -- record {ufix11,ufix4,boolean}
        addr_rd_bank                      :   OUT   std_logic_vector(3 DOWNTO 0);  -- record {ufix11,ufix4,boolean}
        addr_rd_en                        :   OUT   std_logic  -- record {ufix11,ufix4,boolean}
        );
END LTE_MIB_H_ip_src_ltehdlPBCHIndexing_ltehdlPBCHIndexing;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlPBCHIndexing_ltehdlPBCHIndexing IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHIndexing_PBCHIndGen
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          NCellID                         :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
          start                           :   IN    std_logic;
          idx_data                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          idx_data_valid                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlPBCHIndexing_mod_12_6
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          addr_in                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          reminder                        :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
          quotient                        :   OUT   std_logic_vector(10 DOWNTO 0)  -- ufix11
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHIndexing_PBCHIndGen
    USE ENTITY work_ltehdlPBCHIndexing.LTE_MIB_H_ip_src_ltehdlPBCHIndexing_PBCHIndGen(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlPBCHIndexing_mod_12_6
    USE ENTITY work_ltehdlPBCHIndexing.LTE_MIB_H_ip_src_ltehdlPBCHIndexing_mod_12_6(rtl);

  -- Signals
  SIGNAL PBCHIndGen_out1                  : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL PBCHIndGen_out2                  : std_logic;
  SIGNAL rd_addr                          : std_logic_vector(10 DOWNTO 0);  -- ufix11
  SIGNAL rd_bank                          : std_logic_vector(10 DOWNTO 0);  -- ufix11
  SIGNAL rd_bank_unsigned                 : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL rd_bank_1                        : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay_reg                        : std_logic_vector(0 TO 4);  -- ufix1 [5]
  SIGNAL rd_en                            : std_logic;

BEGIN
  u_PBCHIndGen : LTE_MIB_H_ip_src_ltehdlPBCHIndexing_PBCHIndGen
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              NCellID => cellID,  -- ufix9
              start => start,
              idx_data => PBCHIndGen_out1,  -- uint16
              idx_data_valid => PBCHIndGen_out2
              );

  u_mod_12_6 : LTE_MIB_H_ip_src_ltehdlPBCHIndexing_mod_12_6
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              addr_in => PBCHIndGen_out1,  -- uint16
              reminder => rd_addr,  -- ufix11
              quotient => rd_bank  -- ufix11
              );

  rd_bank_unsigned <= unsigned(rd_bank);

  rd_bank_1 <= rd_bank_unsigned(3 DOWNTO 0);

  addr_rd_bank <= std_logic_vector(rd_bank_1);

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay_reg(0) <= PBCHIndGen_out2;
        Delay_reg(1 TO 4) <= Delay_reg(0 TO 3);
      END IF;
    END IF;
  END PROCESS Delay_process;

  rd_en <= Delay_reg(4);

  addr_rd_addr <= rd_addr;

  addr_rd_en <= rd_en;

END rtl;
