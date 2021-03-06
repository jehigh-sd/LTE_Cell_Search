-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEDecimatorRFSoC2x2\LTE_DOWNS_ip.vhd
-- Created: 2022-05-25 15:55:32
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: -1
-- Target subsystem base rate: -1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_DOWNS_ip
-- Source Path: LTE_DOWNS_ip
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_DOWNS_ip IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        AXI4_Stream_I_Master_TREADY       :   IN    std_logic;  -- ufix1
        AXI4_Stream_I_Slave_TDATA         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        AXI4_Stream_I_Slave_TVALID        :   IN    std_logic;  -- ufix1
        AXI4_Stream_Q_Master_TREADY       :   IN    std_logic;  -- ufix1
        AXI4_Stream_Q_Slave_TDATA         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        AXI4_Stream_Q_Slave_TVALID        :   IN    std_logic;  -- ufix1
        AXI4_Lite_ACLK                    :   IN    std_logic;  -- ufix1
        AXI4_Lite_ARESETN                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_AWADDR                  :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Lite_AWVALID                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_WDATA                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_WSTRB                   :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI4_Lite_WVALID                  :   IN    std_logic;  -- ufix1
        AXI4_Lite_BREADY                  :   IN    std_logic;  -- ufix1
        AXI4_Lite_ARADDR                  :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Lite_ARVALID                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_RREADY                  :   IN    std_logic;  -- ufix1
        AXI4_Stream_I_Master_TDATA        :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Stream_I_Master_TVALID       :   OUT   std_logic;  -- ufix1
        AXI4_Stream_I_Master_TLAST        :   OUT   std_logic;  -- ufix1
        AXI4_Stream_I_Slave_TREADY        :   OUT   std_logic;  -- ufix1
        AXI4_Stream_Q_Master_TDATA        :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Stream_Q_Master_TVALID       :   OUT   std_logic;  -- ufix1
        AXI4_Stream_Q_Master_TLAST        :   OUT   std_logic;  -- ufix1
        AXI4_Stream_Q_Slave_TREADY        :   OUT   std_logic;  -- ufix1
        AXI4_Lite_AWREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_WREADY                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_BRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_BVALID                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_ARREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_RDATA                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_RRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_RVALID                  :   OUT   std_logic  -- ufix1
        );
END LTE_DOWNS_ip;


ARCHITECTURE rtl OF LTE_DOWNS_ip IS

  -- Component Declarations
  COMPONENT LTE_DOWNS_ip_reset_sync
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_in                        :   IN    std_logic;  -- ufix1
          reset_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_DOWNS_ip_axi_lite
    PORT( reset_x                         :   IN    std_logic;
          AXI4_Lite_ACLK                  :   IN    std_logic;  -- ufix1
          AXI4_Lite_ARESETN               :   IN    std_logic;  -- ufix1
          AXI4_Lite_AWADDR                :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_AWVALID               :   IN    std_logic;  -- ufix1
          AXI4_Lite_WDATA                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_WSTRB                 :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI4_Lite_WVALID                :   IN    std_logic;  -- ufix1
          AXI4_Lite_BREADY                :   IN    std_logic;  -- ufix1
          AXI4_Lite_ARADDR                :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_ARVALID               :   IN    std_logic;  -- ufix1
          AXI4_Lite_RREADY                :   IN    std_logic;  -- ufix1
          read_ip_timestamp               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_AWREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_WREADY                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_BRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_BVALID                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_ARREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_RDATA                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_RRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_RVALID                :   OUT   std_logic;  -- ufix1
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_packet_size_axi4_stream_i_master :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_packet_size_axi4_stream_q_master :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_extdatasel_in             :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT LTE_DOWNS_ip_axi4_stream_q_master
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          AXI4_Stream_Q_Master_TREADY     :   IN    std_logic;  -- ufix1
          user_data                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          user_valid                      :   IN    std_logic;  -- ufix1
          write_packet_size_axi4_stream_q_master :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Stream_Q_Master_TDATA      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Stream_Q_Master_TVALID     :   OUT   std_logic;  -- ufix1
          AXI4_Stream_Q_Master_TLAST      :   OUT   std_logic;  -- ufix1
          user_ready                      :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT LTE_DOWNS_ip_axi4_stream_q_slave
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          AXI4_Stream_Q_Slave_TDATA       :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          AXI4_Stream_Q_Slave_TVALID      :   IN    std_logic;  -- ufix1
          user_ready                      :   IN    std_logic;  -- ufix1
          AXI4_Stream_Q_Slave_TREADY      :   OUT   std_logic;  -- ufix1
          user_data                       :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          user_valid                      :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT LTE_DOWNS_ip_axi4_stream_i_slave
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          AXI4_Stream_I_Slave_TDATA       :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          AXI4_Stream_I_Slave_TVALID      :   IN    std_logic;  -- ufix1
          user_ready                      :   IN    std_logic;  -- ufix1
          AXI4_Stream_I_Slave_TREADY      :   OUT   std_logic;  -- ufix1
          user_data                       :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          user_valid                      :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT LTE_DOWNS_ip_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_x                         :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          rxdatai_in                      :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          rxdataq_in                      :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          rxdatai_valid                   :   IN    std_logic;  -- ufix1
          rxdataq_valid                   :   IN    std_logic;  -- ufix1
          txdatai_ready                   :   IN    std_logic;  -- ufix1
          txdataq_ready                   :   IN    std_logic;  -- ufix1
          extdatasel_in                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
          ce_out_0                        :   OUT   std_logic;  -- ufix1
          ce_out_1                        :   OUT   std_logic;  -- ufix1
          txI_data                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          txQ_data                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          txI_valid                       :   OUT   std_logic;  -- ufix1
          txQ_valid                       :   OUT   std_logic;  -- ufix1
          rxI_ready                       :   OUT   std_logic;  -- ufix1
          rxQ_ready                       :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT LTE_DOWNS_ip_axi4_stream_i_master
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          AXI4_Stream_I_Master_TREADY     :   IN    std_logic;  -- ufix1
          user_data                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          user_valid                      :   IN    std_logic;  -- ufix1
          write_packet_size_axi4_stream_i_master :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Stream_I_Master_TDATA      :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Stream_I_Master_TVALID     :   OUT   std_logic;  -- ufix1
          AXI4_Stream_I_Master_TLAST      :   OUT   std_logic;  -- ufix1
          user_ready                      :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_DOWNS_ip_reset_sync
    USE ENTITY work.LTE_DOWNS_ip_reset_sync(rtl);

  FOR ALL : LTE_DOWNS_ip_axi_lite
    USE ENTITY work.LTE_DOWNS_ip_axi_lite(rtl);

  FOR ALL : LTE_DOWNS_ip_axi4_stream_q_master
    USE ENTITY work.LTE_DOWNS_ip_axi4_stream_q_master(rtl);

  FOR ALL : LTE_DOWNS_ip_axi4_stream_q_slave
    USE ENTITY work.LTE_DOWNS_ip_axi4_stream_q_slave(rtl);

  FOR ALL : LTE_DOWNS_ip_axi4_stream_i_slave
    USE ENTITY work.LTE_DOWNS_ip_axi4_stream_i_slave(rtl);

  FOR ALL : LTE_DOWNS_ip_dut
    USE ENTITY work.LTE_DOWNS_ip_dut(rtl);

  FOR ALL : LTE_DOWNS_ip_axi4_stream_i_master
    USE ENTITY work.LTE_DOWNS_ip_axi4_stream_i_master(rtl);

  -- Signals
  SIGNAL reset_x                          : std_logic;
  SIGNAL ip_timestamp                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL reset_before_sync                : std_logic;  -- ufix1
  SIGNAL AXI4_Lite_BRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Lite_RDATA_tmp              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Lite_RRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_axi_enable                 : std_logic;  -- ufix1
  SIGNAL write_packet_size_axi4_stream_i_master : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_packet_size_axi4_stream_q_master : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_extdatasel_in              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1_1                        : std_logic;  -- ufix1
  SIGNAL txQ_data_sig                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL txQ_valid_sig                    : std_logic;  -- ufix1
  SIGNAL AXI4_Stream_Q_Master_TDATA_tmp   : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL top_user_ready                   : std_logic;  -- ufix1
  SIGNAL rxQ_ready_sig                    : std_logic;  -- ufix1
  SIGNAL top_user_data                    : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL top_user_valid                   : std_logic;  -- ufix1
  SIGNAL rxI_ready_sig                    : std_logic;  -- ufix1
  SIGNAL top_user_data_1                  : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL top_user_valid_1                 : std_logic;  -- ufix1
  SIGNAL top_user_ready_1                 : std_logic;  -- ufix1
  SIGNAL ce_out_0_sig                     : std_logic;  -- ufix1
  SIGNAL ce_out_1_sig                     : std_logic;  -- ufix1
  SIGNAL txI_data_sig                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL txI_valid_sig                    : std_logic;  -- ufix1
  SIGNAL AXI4_Stream_I_Master_TDATA_tmp   : std_logic_vector(15 DOWNTO 0);  -- ufix16

BEGIN
  u_LTE_DOWNS_ip_reset_sync_inst : LTE_DOWNS_ip_reset_sync
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_in => reset_before_sync,  -- ufix1
              reset_out => reset_x
              );

  u_LTE_DOWNS_ip_axi_lite_inst : LTE_DOWNS_ip_axi_lite
    PORT MAP( reset_x => reset_x,
              AXI4_Lite_ACLK => AXI4_Lite_ACLK,  -- ufix1
              AXI4_Lite_ARESETN => AXI4_Lite_ARESETN,  -- ufix1
              AXI4_Lite_AWADDR => AXI4_Lite_AWADDR,  -- ufix16
              AXI4_Lite_AWVALID => AXI4_Lite_AWVALID,  -- ufix1
              AXI4_Lite_WDATA => AXI4_Lite_WDATA,  -- ufix32
              AXI4_Lite_WSTRB => AXI4_Lite_WSTRB,  -- ufix4
              AXI4_Lite_WVALID => AXI4_Lite_WVALID,  -- ufix1
              AXI4_Lite_BREADY => AXI4_Lite_BREADY,  -- ufix1
              AXI4_Lite_ARADDR => AXI4_Lite_ARADDR,  -- ufix16
              AXI4_Lite_ARVALID => AXI4_Lite_ARVALID,  -- ufix1
              AXI4_Lite_RREADY => AXI4_Lite_RREADY,  -- ufix1
              read_ip_timestamp => std_logic_vector(ip_timestamp),  -- ufix32
              AXI4_Lite_AWREADY => AXI4_Lite_AWREADY,  -- ufix1
              AXI4_Lite_WREADY => AXI4_Lite_WREADY,  -- ufix1
              AXI4_Lite_BRESP => AXI4_Lite_BRESP_tmp,  -- ufix2
              AXI4_Lite_BVALID => AXI4_Lite_BVALID,  -- ufix1
              AXI4_Lite_ARREADY => AXI4_Lite_ARREADY,  -- ufix1
              AXI4_Lite_RDATA => AXI4_Lite_RDATA_tmp,  -- ufix32
              AXI4_Lite_RRESP => AXI4_Lite_RRESP_tmp,  -- ufix2
              AXI4_Lite_RVALID => AXI4_Lite_RVALID,  -- ufix1
              write_axi_enable => write_axi_enable,  -- ufix1
              write_packet_size_axi4_stream_i_master => write_packet_size_axi4_stream_i_master,  -- ufix32
              write_packet_size_axi4_stream_q_master => write_packet_size_axi4_stream_q_master,  -- ufix32
              write_extdatasel_in => write_extdatasel_in,  -- sfix32
              reset_internal => reset_internal  -- ufix1
              );

  u_LTE_DOWNS_ip_axi4_stream_q_master_inst : LTE_DOWNS_ip_axi4_stream_q_master
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_x => reset_x,
              enb => const_1_1,
              AXI4_Stream_Q_Master_TREADY => AXI4_Stream_Q_Master_TREADY,  -- ufix1
              user_data => txQ_data_sig,  -- ufix16
              user_valid => txQ_valid_sig,  -- ufix1
              write_packet_size_axi4_stream_q_master => write_packet_size_axi4_stream_q_master,  -- ufix32
              AXI4_Stream_Q_Master_TDATA => AXI4_Stream_Q_Master_TDATA_tmp,  -- ufix16
              AXI4_Stream_Q_Master_TVALID => AXI4_Stream_Q_Master_TVALID,  -- ufix1
              AXI4_Stream_Q_Master_TLAST => AXI4_Stream_Q_Master_TLAST,  -- ufix1
              user_ready => top_user_ready  -- ufix1
              );

  u_LTE_DOWNS_ip_axi4_stream_q_slave_inst : LTE_DOWNS_ip_axi4_stream_q_slave
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_x => reset_x,
              enb => const_1_1,
              AXI4_Stream_Q_Slave_TDATA => AXI4_Stream_Q_Slave_TDATA,  -- ufix128
              AXI4_Stream_Q_Slave_TVALID => AXI4_Stream_Q_Slave_TVALID,  -- ufix1
              user_ready => rxQ_ready_sig,  -- ufix1
              AXI4_Stream_Q_Slave_TREADY => AXI4_Stream_Q_Slave_TREADY,  -- ufix1
              user_data => top_user_data,  -- ufix128
              user_valid => top_user_valid  -- ufix1
              );

  u_LTE_DOWNS_ip_axi4_stream_i_slave_inst : LTE_DOWNS_ip_axi4_stream_i_slave
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_x => reset_x,
              enb => const_1_1,
              AXI4_Stream_I_Slave_TDATA => AXI4_Stream_I_Slave_TDATA,  -- ufix128
              AXI4_Stream_I_Slave_TVALID => AXI4_Stream_I_Slave_TVALID,  -- ufix1
              user_ready => rxI_ready_sig,  -- ufix1
              AXI4_Stream_I_Slave_TREADY => AXI4_Stream_I_Slave_TREADY,  -- ufix1
              user_data => top_user_data_1,  -- ufix128
              user_valid => top_user_valid_1  -- ufix1
              );

  u_LTE_DOWNS_ip_dut_inst : LTE_DOWNS_ip_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_x => reset_x,
              dut_enable => write_axi_enable,  -- ufix1
              rxdatai_in => top_user_data_1,  -- ufix128
              rxdataq_in => top_user_data,  -- ufix128
              rxdatai_valid => top_user_valid_1,  -- ufix1
              rxdataq_valid => top_user_valid,  -- ufix1
              txdatai_ready => top_user_ready_1,  -- ufix1
              txdataq_ready => top_user_ready,  -- ufix1
              extdatasel_in => write_extdatasel_in,  -- sfix32
              ce_out_0 => ce_out_0_sig,  -- ufix1
              ce_out_1 => ce_out_1_sig,  -- ufix1
              txI_data => txI_data_sig,  -- ufix16
              txQ_data => txQ_data_sig,  -- ufix16
              txI_valid => txI_valid_sig,  -- ufix1
              txQ_valid => txQ_valid_sig,  -- ufix1
              rxI_ready => rxI_ready_sig,  -- ufix1
              rxQ_ready => rxQ_ready_sig  -- ufix1
              );

  u_LTE_DOWNS_ip_axi4_stream_i_master_inst : LTE_DOWNS_ip_axi4_stream_i_master
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_x => reset_x,
              enb => const_1_1,
              AXI4_Stream_I_Master_TREADY => AXI4_Stream_I_Master_TREADY,  -- ufix1
              user_data => txI_data_sig,  -- ufix16
              user_valid => txI_valid_sig,  -- ufix1
              write_packet_size_axi4_stream_i_master => write_packet_size_axi4_stream_i_master,  -- ufix32
              AXI4_Stream_I_Master_TDATA => AXI4_Stream_I_Master_TDATA_tmp,  -- ufix16
              AXI4_Stream_I_Master_TVALID => AXI4_Stream_I_Master_TVALID,  -- ufix1
              AXI4_Stream_I_Master_TLAST => AXI4_Stream_I_Master_TLAST,  -- ufix1
              user_ready => top_user_ready_1  -- ufix1
              );

  ip_timestamp <= unsigned'(X"837177E3");

  reset_cm <=  NOT IPCORE_RESETN;

  reset_before_sync <= reset_cm OR reset_internal;

  const_1_1 <= '1';

  AXI4_Stream_I_Master_TDATA <= AXI4_Stream_I_Master_TDATA_tmp;

  AXI4_Stream_Q_Master_TDATA <= AXI4_Stream_Q_Master_TDATA_tmp;

  AXI4_Lite_BRESP <= AXI4_Lite_BRESP_tmp;

  AXI4_Lite_RDATA <= AXI4_Lite_RDATA_tmp;

  AXI4_Lite_RRESP <= AXI4_Lite_RRESP_tmp;

END rtl;

