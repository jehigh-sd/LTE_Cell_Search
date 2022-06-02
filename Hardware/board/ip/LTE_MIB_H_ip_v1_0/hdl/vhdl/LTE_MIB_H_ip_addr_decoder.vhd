-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\LTE_MIB_H_ip_addr_decoder.vhd
-- Created: 2022-05-23 17:29:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_addr_decoder
-- Source Path: LTE_MIB_H_ip/LTE_MIB_H_ip_axi_lite/LTE_MIB_H_ip_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_ip_timestamp                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_ncellid                      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        read_tddmode                      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        read_freqest                      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        read_celldetected                 :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        read_cellsearchdone               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        read_NDLRB                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        read_PHICH                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        read_ng                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        read_nframe                       :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        read_cellrefip                    :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        read_mibdetected                  :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        read_miberror                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_extdatasel_in               :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
        write_start_in                    :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32
        );
END LTE_MIB_H_ip_addr_decoder;


ARCHITECTURE rtl OF LTE_MIB_H_ip_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_ncellid_1_1           : std_logic;  -- ufix1
  SIGNAL decode_sel_start_in_1_1          : std_logic;  -- ufix1
  SIGNAL decode_sel_extdatasel_in_1_1     : std_logic;  -- ufix1
  SIGNAL decode_sel_ip_timestamp_1_1      : std_logic;  -- ufix1
  SIGNAL decode_sel_axi_enable_1_1        : std_logic;  -- ufix1
  SIGNAL const_0                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_axi_enable_1_1           : std_logic;  -- ufix1
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL const_1_1                        : std_logic;  -- ufix1
  SIGNAL data_reg_axi_enable_1_1          : std_logic;  -- ufix1
  SIGNAL data_slice_axi_enable_1          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_axi_enable_1_1         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ip_timestamp_unsigned       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ip_timestamp            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ip_timestamp_1_1       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_extdatasel_in_1_1        : std_logic;  -- ufix1
  SIGNAL data_in_extdatasel_in            : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_reg_extdatasel_in_1_1       : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_extdatasel_in_1       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_extdatasel_in_1_1      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_start_in_1_1             : std_logic;  -- ufix1
  SIGNAL data_in_start_in                 : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_reg_start_in_1_1            : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_start_in_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ncellid_signed              : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL read_tddmode_signed              : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL read_freqest_signed              : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL read_celldetected_signed         : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL read_cellsearchdone_signed       : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL read_NDLRB_signed                : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL read_PHICH_signed                : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL read_ng_signed                   : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL read_nframe_signed               : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL read_cellrefip_signed            : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL read_mibdetected_signed          : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL read_miberror_signed             : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL decode_sel_miberror_1_1          : std_logic;  -- ufix1
  SIGNAL decode_sel_mibdetected_1_1       : std_logic;  -- ufix1
  SIGNAL decode_sel_cellrefip_1_1         : std_logic;  -- ufix1
  SIGNAL decode_sel_nframe_1_1            : std_logic;  -- ufix1
  SIGNAL decode_sel_ng_1_1                : std_logic;  -- ufix1
  SIGNAL decode_sel_PHICH_1_1             : std_logic;  -- ufix1
  SIGNAL decode_sel_NDLRB_1_1             : std_logic;  -- ufix1
  SIGNAL decode_sel_cellsearchdone_1_1    : std_logic;  -- ufix1
  SIGNAL decode_sel_celldetected_1_1      : std_logic;  -- ufix1
  SIGNAL decode_sel_freqest_1_1           : std_logic;  -- ufix1
  SIGNAL decode_sel_tddmode_1_1           : std_logic;  -- ufix1
  SIGNAL decode_rd_start_in_1_1           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ncellid                 : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_ncellid_1             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ncellid_1_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_tddmode                 : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_tddmode_1             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_tddmode_1_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_freqest                 : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_freqest_1             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_freqest_1_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_celldetected            : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_celldetected_1        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_celldetected_1_1       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_cellsearchdone          : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_cellsearchdone_1      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_cellsearchdone_1_1     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_NDLRB                   : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_NDLRB_1               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_NDLRB_1_1              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_PHICH                   : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_PHICH_1               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_PHICH_1_1              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ng                      : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_ng_1                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ng_1_1                 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_nframe                  : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_nframe_1              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_nframe_1_1             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_cellrefip               : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_cellrefip_1           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_cellrefip_1_1          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_mibdetected             : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_mibdetected_1         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_mibdetected_1_1        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_miberror                : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL data_slice_miberror_1            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_miberror_1_1           : unsigned(31 DOWNTO 0);  -- ufix32

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_ncellid_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0044#, 14) ELSE
      '0';

  
  decode_sel_start_in_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0042#, 14) ELSE
      '0';

  
  decode_sel_extdatasel_in_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0040#, 14) ELSE
      '0';

  
  decode_sel_ip_timestamp_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0002#, 14) ELSE
      '0';

  
  decode_sel_axi_enable_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0001#, 14) ELSE
      '0';

  const_0 <= to_unsigned(0, 32);

  reg_enb_axi_enable_1_1 <= decode_sel_axi_enable_1_1 AND wr_enb;

  data_write_unsigned <= unsigned(data_write);

  data_in_axi_enable <= data_write_unsigned(0);

  const_1_1 <= '1';

  enb <= const_1_1;

  reg_axi_enable_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        data_reg_axi_enable_1_1 <= '1';
      ELSIF enb = '1' AND reg_enb_axi_enable_1_1 = '1' THEN
        data_reg_axi_enable_1_1 <= data_in_axi_enable;
      END IF;
    END IF;
  END PROCESS reg_axi_enable_1_1_process;


  data_slice_axi_enable_1 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & data_reg_axi_enable_1_1;

  
  decode_rd_axi_enable_1_1 <= const_0 WHEN decode_sel_axi_enable_1_1 = '0' ELSE
      data_slice_axi_enable_1;

  read_ip_timestamp_unsigned <= unsigned(read_ip_timestamp);

  reg_ip_timestamp_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_ip_timestamp <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_ip_timestamp <= read_ip_timestamp_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ip_timestamp_process;


  
  decode_rd_ip_timestamp_1_1 <= decode_rd_axi_enable_1_1 WHEN decode_sel_ip_timestamp_1_1 = '0' ELSE
      read_reg_ip_timestamp;

  reg_enb_extdatasel_in_1_1 <= decode_sel_extdatasel_in_1_1 AND wr_enb;

  data_in_extdatasel_in <= signed(data_write_unsigned);

  reg_extdatasel_in_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        data_reg_extdatasel_in_1_1 <= to_signed(0, 32);
      ELSIF enb = '1' AND reg_enb_extdatasel_in_1_1 = '1' THEN
        data_reg_extdatasel_in_1_1 <= data_in_extdatasel_in;
      END IF;
    END IF;
  END PROCESS reg_extdatasel_in_1_1_process;


  data_slice_extdatasel_in_1 <= unsigned(data_reg_extdatasel_in_1_1);

  
  decode_rd_extdatasel_in_1_1 <= decode_rd_ip_timestamp_1_1 WHEN decode_sel_extdatasel_in_1_1 = '0' ELSE
      data_slice_extdatasel_in_1;

  reg_enb_start_in_1_1 <= decode_sel_start_in_1_1 AND wr_enb;

  data_in_start_in <= signed(data_write_unsigned);

  reg_start_in_1_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        data_reg_start_in_1_1 <= to_signed(0, 32);
      ELSIF enb = '1' AND reg_enb_start_in_1_1 = '1' THEN
        data_reg_start_in_1_1 <= data_in_start_in;
      END IF;
    END IF;
  END PROCESS reg_start_in_1_1_process;


  data_slice_start_in_1 <= unsigned(data_reg_start_in_1_1);

  read_ncellid_signed <= signed(read_ncellid);

  read_tddmode_signed <= signed(read_tddmode);

  read_freqest_signed <= signed(read_freqest);

  read_celldetected_signed <= signed(read_celldetected);

  read_cellsearchdone_signed <= signed(read_cellsearchdone);

  read_NDLRB_signed <= signed(read_NDLRB);

  read_PHICH_signed <= signed(read_PHICH);

  read_ng_signed <= signed(read_ng);

  read_nframe_signed <= signed(read_nframe);

  read_cellrefip_signed <= signed(read_cellrefip);

  read_mibdetected_signed <= signed(read_mibdetected);

  read_miberror_signed <= signed(read_miberror);

  
  decode_sel_miberror_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004F#, 14) ELSE
      '0';

  
  decode_sel_mibdetected_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004E#, 14) ELSE
      '0';

  
  decode_sel_cellrefip_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004D#, 14) ELSE
      '0';

  
  decode_sel_nframe_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004C#, 14) ELSE
      '0';

  
  decode_sel_ng_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004B#, 14) ELSE
      '0';

  
  decode_sel_PHICH_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004A#, 14) ELSE
      '0';

  
  decode_sel_NDLRB_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0049#, 14) ELSE
      '0';

  
  decode_sel_cellsearchdone_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0048#, 14) ELSE
      '0';

  
  decode_sel_celldetected_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0047#, 14) ELSE
      '0';

  
  decode_sel_freqest_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0046#, 14) ELSE
      '0';

  
  decode_sel_tddmode_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0045#, 14) ELSE
      '0';

  
  decode_rd_start_in_1_1 <= decode_rd_extdatasel_in_1_1 WHEN decode_sel_start_in_1_1 = '0' ELSE
      data_slice_start_in_1;

  reg_ncellid_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_ncellid <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        read_reg_ncellid <= read_ncellid_signed;
      END IF;
    END IF;
  END PROCESS reg_ncellid_process;


  data_slice_ncellid_1 <= unsigned(read_reg_ncellid);

  
  decode_rd_ncellid_1_1 <= decode_rd_start_in_1_1 WHEN decode_sel_ncellid_1_1 = '0' ELSE
      data_slice_ncellid_1;

  reg_tddmode_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_tddmode <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        read_reg_tddmode <= read_tddmode_signed;
      END IF;
    END IF;
  END PROCESS reg_tddmode_process;


  data_slice_tddmode_1 <= unsigned(read_reg_tddmode);

  
  decode_rd_tddmode_1_1 <= decode_rd_ncellid_1_1 WHEN decode_sel_tddmode_1_1 = '0' ELSE
      data_slice_tddmode_1;

  reg_freqest_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_freqest <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        read_reg_freqest <= read_freqest_signed;
      END IF;
    END IF;
  END PROCESS reg_freqest_process;


  data_slice_freqest_1 <= unsigned(read_reg_freqest);

  
  decode_rd_freqest_1_1 <= decode_rd_tddmode_1_1 WHEN decode_sel_freqest_1_1 = '0' ELSE
      data_slice_freqest_1;

  reg_celldetected_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_celldetected <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        read_reg_celldetected <= read_celldetected_signed;
      END IF;
    END IF;
  END PROCESS reg_celldetected_process;


  data_slice_celldetected_1 <= unsigned(read_reg_celldetected);

  
  decode_rd_celldetected_1_1 <= decode_rd_freqest_1_1 WHEN decode_sel_celldetected_1_1 = '0' ELSE
      data_slice_celldetected_1;

  reg_cellsearchdone_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_cellsearchdone <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        read_reg_cellsearchdone <= read_cellsearchdone_signed;
      END IF;
    END IF;
  END PROCESS reg_cellsearchdone_process;


  data_slice_cellsearchdone_1 <= unsigned(read_reg_cellsearchdone);

  
  decode_rd_cellsearchdone_1_1 <= decode_rd_celldetected_1_1 WHEN decode_sel_cellsearchdone_1_1 = '0' ELSE
      data_slice_cellsearchdone_1;

  reg_NDLRB_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_NDLRB <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        read_reg_NDLRB <= read_NDLRB_signed;
      END IF;
    END IF;
  END PROCESS reg_NDLRB_process;


  data_slice_NDLRB_1 <= unsigned(read_reg_NDLRB);

  
  decode_rd_NDLRB_1_1 <= decode_rd_cellsearchdone_1_1 WHEN decode_sel_NDLRB_1_1 = '0' ELSE
      data_slice_NDLRB_1;

  reg_PHICH_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_PHICH <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        read_reg_PHICH <= read_PHICH_signed;
      END IF;
    END IF;
  END PROCESS reg_PHICH_process;


  data_slice_PHICH_1 <= unsigned(read_reg_PHICH);

  
  decode_rd_PHICH_1_1 <= decode_rd_NDLRB_1_1 WHEN decode_sel_PHICH_1_1 = '0' ELSE
      data_slice_PHICH_1;

  reg_ng_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_ng <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        read_reg_ng <= read_ng_signed;
      END IF;
    END IF;
  END PROCESS reg_ng_process;


  data_slice_ng_1 <= unsigned(read_reg_ng);

  
  decode_rd_ng_1_1 <= decode_rd_PHICH_1_1 WHEN decode_sel_ng_1_1 = '0' ELSE
      data_slice_ng_1;

  reg_nframe_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_nframe <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        read_reg_nframe <= read_nframe_signed;
      END IF;
    END IF;
  END PROCESS reg_nframe_process;


  data_slice_nframe_1 <= unsigned(read_reg_nframe);

  
  decode_rd_nframe_1_1 <= decode_rd_ng_1_1 WHEN decode_sel_nframe_1_1 = '0' ELSE
      data_slice_nframe_1;

  reg_cellrefip_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_cellrefip <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        read_reg_cellrefip <= read_cellrefip_signed;
      END IF;
    END IF;
  END PROCESS reg_cellrefip_process;


  data_slice_cellrefip_1 <= unsigned(read_reg_cellrefip);

  
  decode_rd_cellrefip_1_1 <= decode_rd_nframe_1_1 WHEN decode_sel_cellrefip_1_1 = '0' ELSE
      data_slice_cellrefip_1;

  reg_mibdetected_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_mibdetected <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        read_reg_mibdetected <= read_mibdetected_signed;
      END IF;
    END IF;
  END PROCESS reg_mibdetected_process;


  data_slice_mibdetected_1 <= unsigned(read_reg_mibdetected);

  
  decode_rd_mibdetected_1_1 <= decode_rd_cellrefip_1_1 WHEN decode_sel_mibdetected_1_1 = '0' ELSE
      data_slice_mibdetected_1;

  reg_miberror_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        read_reg_miberror <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        read_reg_miberror <= read_miberror_signed;
      END IF;
    END IF;
  END PROCESS reg_miberror_process;


  data_slice_miberror_1 <= unsigned(read_reg_miberror);

  
  decode_rd_miberror_1_1 <= decode_rd_mibdetected_1_1 WHEN decode_sel_miberror_1_1 = '0' ELSE
      data_slice_miberror_1;

  data_read <= std_logic_vector(decode_rd_miberror_1_1);

  write_extdatasel_in <= std_logic_vector(data_reg_extdatasel_in_1_1);

  write_start_in <= std_logic_vector(data_reg_start_in_1_1);

  write_axi_enable <= data_reg_axi_enable_1_1;

END rtl;

