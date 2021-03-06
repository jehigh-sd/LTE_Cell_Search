-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlChannelEqualizer\LTE_MIB_H_ip_src_ltehdlChannelEqualizer_SimpleDualPortRAM_generic.vhd
-- Created: 2022-05-23 17:26:43
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlChannelEqualizer_SimpleDualPortRAM_generic
-- Source Path: ltehdlChannelEqualizer/chEst/hEstInterpAndStore/hEstInterpAndStore/ant0ram1/SimpleDualPortRAM_generic
-- Hierarchy Level: 7
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlChannelEqualizer_SimpleDualPortRAM_generic IS
  GENERIC( AddrWidth                      : integer := 1;
           DataWidth                      : integer := 1
           );
  PORT( clk                               :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        wr_din_re                         :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
        wr_din_im                         :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
        wr_addr                           :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
        wr_en                             :   IN    std_logic;  -- ufix1
        rd_addr                           :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
        rd_dout_re                        :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
        rd_dout_im                        :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
        );
END LTE_MIB_H_ip_src_ltehdlChannelEqualizer_SimpleDualPortRAM_generic;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlChannelEqualizer_SimpleDualPortRAM_generic IS

  -- Local Type Definitions
  TYPE ram_type IS ARRAY (2**AddrWidth - 1 DOWNTO 0) of std_logic_vector(DataWidth*2 - 1 DOWNTO 0);

  -- Signals
  SIGNAL ram                              : ram_type := (OTHERS => (OTHERS => '0'));
  SIGNAL data_int                         : std_logic_vector(DataWidth*2 - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL wr_addr_unsigned                 : unsigned(AddrWidth - 1 DOWNTO 0);  -- generic width
  SIGNAL rd_addr_unsigned                 : unsigned(AddrWidth - 1 DOWNTO 0);  -- generic width

BEGIN
  wr_addr_unsigned <= unsigned(wr_addr);

  rd_addr_unsigned <= unsigned(rd_addr);

  SimpleDualPortRAM_generic_process: PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        IF wr_en = '1' THEN
          ram(to_integer(wr_addr_unsigned)) <= wr_din_re & wr_din_im;
        END IF;
        data_int <= ram(to_integer(rd_addr_unsigned));
      END IF;
    END IF;
  END PROCESS SimpleDualPortRAM_generic_process;

  rd_dout_re <= data_int(DataWidth*2-1 DOWNTO DataWidth);
  rd_dout_im <= data_int(DataWidth-1 DOWNTO 0);

END rtl;

