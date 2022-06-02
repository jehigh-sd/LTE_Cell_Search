-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\LTE_MIB_H_ip_axi4_stream_i_slave.vhd
-- Created: 2022-05-23 17:29:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_axi4_stream_i_slave
-- Source Path: LTE_MIB_H_ip/LTE_MIB_H_ip_axi4_stream_i_slave
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_MIB_H_ip_axi4_stream_i_slave IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        AXI4_Stream_I_Slave_TDATA         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        AXI4_Stream_I_Slave_TVALID        :   IN    std_logic;  -- ufix1
        user_ready                        :   IN    std_logic;  -- ufix1
        AXI4_Stream_I_Slave_TREADY        :   OUT   std_logic;  -- ufix1
        user_data                         :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        user_valid                        :   OUT   std_logic  -- ufix1
        );
END LTE_MIB_H_ip_axi4_stream_i_slave;


ARCHITECTURE rtl OF LTE_MIB_H_ip_axi4_stream_i_slave IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_fifo_data
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          Push                            :   IN    std_logic;  -- ufix1
          Pop                             :   IN    std_logic;  -- ufix1
          Out_rsvd                        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          Empty                           :   OUT   std_logic;  -- ufix1
          Full                            :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_fifo_data
    USE ENTITY work.LTE_MIB_H_ip_fifo_data(rtl);

  -- Signals
  SIGNAL fifo_rd_ack                      : std_logic;  -- ufix1
  SIGNAL stream_in_fifo_user_data         : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL fifo_empty                       : std_logic;  -- ufix1
  SIGNAL fifo_full                        : std_logic;  -- ufix1
  SIGNAL fifo_empty_neg                   : std_logic;  -- ufix1
  SIGNAL stream_in_user_valid             : std_logic;  -- ufix1

BEGIN
  u_LTE_MIB_H_ip_fifo_data_inst : LTE_MIB_H_ip_fifo_data
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              In_rsvd => AXI4_Stream_I_Slave_TDATA,  -- ufix128
              Push => AXI4_Stream_I_Slave_TVALID,  -- ufix1
              Pop => fifo_rd_ack,  -- ufix1
              Out_rsvd => stream_in_fifo_user_data,  -- ufix128
              Empty => fifo_empty,  -- ufix1
              Full => fifo_full  -- ufix1
              );

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        fifo_rd_ack <= '0';
      ELSIF enb = '1' THEN
        fifo_rd_ack <= user_ready;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  AXI4_Stream_I_Slave_TREADY <=  NOT fifo_full;

  fifo_empty_neg <=  NOT fifo_empty;

  stream_in_user_valid <= fifo_empty_neg AND fifo_rd_ack;

  user_data <= stream_in_fifo_user_data;

  user_valid <= stream_in_user_valid;

END rtl;
