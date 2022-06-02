-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2\LTE_GENER_ip_axi4_stream_q_master.vhd
-- Created: 2022-05-23 17:12:12
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_GENER_ip_axi4_stream_q_master
-- Source Path: LTE_GENER_ip/LTE_GENER_ip_axi4_stream_q_master
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_GENER_ip_axi4_stream_q_master IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        AXI4_Stream_Q_Master_TREADY       :   IN    std_logic;  -- ufix1
        user_data                         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        user_valid                        :   IN    std_logic;  -- ufix1
        write_packet_size_axi4_stream_q_master :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Stream_Q_Master_TDATA        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        AXI4_Stream_Q_Master_TVALID       :   OUT   std_logic;  -- ufix1
        AXI4_Stream_Q_Master_TLAST        :   OUT   std_logic;  -- ufix1
        user_ready                        :   OUT   std_logic  -- ufix1
        );
END LTE_GENER_ip_axi4_stream_q_master;


ARCHITECTURE rtl OF LTE_GENER_ip_axi4_stream_q_master IS

  -- Component Declarations
  COMPONENT LTE_GENER_ip_fifo_data_OUT_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          Push                            :   IN    std_logic;  -- ufix1
          Pop                             :   IN    std_logic;  -- ufix1
          Out_rsvd                        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          Empty                           :   OUT   std_logic;  -- ufix1
          AFull                           :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_fifo_TLAST_OUT_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;  -- ufix1
          Push                            :   IN    std_logic;  -- ufix1
          Pop                             :   IN    std_logic;  -- ufix1
          Out_rsvd                        :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_GENER_ip_fifo_data_OUT_block
    USE ENTITY work.LTE_GENER_ip_fifo_data_OUT_block(rtl);

  FOR ALL : LTE_GENER_ip_fifo_TLAST_OUT_block
    USE ENTITY work.LTE_GENER_ip_fifo_TLAST_OUT_block(rtl);

  -- Signals
  SIGNAL AXI4_Stream_Q_Master_TDATA_tmp   : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL fifo_empty_data                  : std_logic;  -- ufix1
  SIGNAL fifo_afull_data                  : std_logic;  -- ufix1
  SIGNAL write_packet_size_axi4_stream_q_master_unsigned : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL tlast_size_value                 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_packet_size_strobe           : std_logic;  -- ufix1
  SIGNAL auto_tlast                       : std_logic;  -- ufix1
  SIGNAL reset_TLAST                      : std_logic;  -- ufix1
  SIGNAL tlast_counter_out                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL relop_relop1                     : std_logic;
  SIGNAL internal_ready                   : std_logic;  -- ufix1

BEGIN
  u_LTE_GENER_ip_fifo_data_OUT_inst : LTE_GENER_ip_fifo_data_OUT_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              In_rsvd => user_data,  -- ufix128
              Push => user_valid,  -- ufix1
              Pop => AXI4_Stream_Q_Master_TREADY,  -- ufix1
              Out_rsvd => AXI4_Stream_Q_Master_TDATA_tmp,  -- ufix128
              Empty => fifo_empty_data,  -- ufix1
              AFull => fifo_afull_data  -- ufix1
              );

  u_LTE_GENER_ip_fifo_TLAST_OUT_inst : LTE_GENER_ip_fifo_TLAST_OUT_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              In_rsvd => auto_tlast,  -- ufix1
              Push => user_valid,  -- ufix1
              Pop => AXI4_Stream_Q_Master_TREADY,  -- ufix1
              Out_rsvd => AXI4_Stream_Q_Master_TLAST  -- ufix1
              );

  AXI4_Stream_Q_Master_TVALID <=  NOT fifo_empty_data;

  write_packet_size_axi4_stream_q_master_unsigned <= unsigned(write_packet_size_axi4_stream_q_master);

  const_1 <= to_unsigned(1, 32);

  tlast_size_value <= write_packet_size_axi4_stream_q_master_unsigned - const_1;

  reset_TLAST <= reg_packet_size_strobe OR auto_tlast;

  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  tlast_counter_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        tlast_counter_out <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        IF reset_TLAST = '1' THEN 
          tlast_counter_out <= to_unsigned(0, 32);
        ELSIF user_valid = '1' THEN 
          tlast_counter_out <= tlast_counter_out + to_unsigned(1, 32);
        END IF;
      END IF;
    END IF;
  END PROCESS tlast_counter_process;


  
  relop_relop1 <= '1' WHEN tlast_counter_out = tlast_size_value ELSE
      '0';

  auto_tlast <= user_valid AND relop_relop1;

  internal_ready <=  NOT fifo_afull_data;

  AXI4_Stream_Q_Master_TDATA <= AXI4_Stream_Q_Master_TDATA_tmp;

  user_ready <= internal_ready;

END rtl;

