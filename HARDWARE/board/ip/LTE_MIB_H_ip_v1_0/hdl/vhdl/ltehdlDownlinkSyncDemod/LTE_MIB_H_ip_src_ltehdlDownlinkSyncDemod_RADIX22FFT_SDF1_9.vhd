-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_RADIX22FFT_SDF1_9.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_RADIX22FFT_SDF1_9
-- Source Path: ltehdlDownlinkSyncDemod/OFDM Demodulation/FFT HDL Optimized/RADIX22FFT_SDF1_9
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlDownlinkSyncDemod;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_RADIX22FFT_SDF1_9 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        din_9_1_re_dly                    :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        din_9_1_im_dly                    :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        din_9_vld_dly                     :   IN    std_logic;
        rd_9_Addr                         :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        rd_9_Enb                          :   IN    std_logic;
        twdl_9_1_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        twdl_9_1_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        proc_9_enb                        :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        dout_9_1_re                       :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
        dout_9_1_im                       :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
        dout_9_1_vld                      :   OUT   std_logic;
        dinXTwdl_9_1_vld                  :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_RADIX22FFT_SDF1_9;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_RADIX22FFT_SDF1_9 IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Complex3Multiply_block2
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          din_re                          :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          din_im                          :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          din_9_vld_dly                   :   IN    std_logic;
          twdl_9_1_re                     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          twdl_9_1_im                     :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          syncReset                       :   IN    std_logic;
          dinXTwdl_re                     :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
          dinXTwdl_im                     :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
          dinXTwdl_9_1_vld                :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SimpleDualPortRAM_generic_block
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SDFCommutator9
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          din_9_vld_dly                   :   IN    std_logic;
          xf_re                           :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          xf_im                           :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          xf_vld                          :   IN    std_logic;
          dinXTwdlf_re                    :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          dinXTwdlf_im                    :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          dinxTwdlf_vld                   :   IN    std_logic;
          btf1_re                         :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          btf1_im                         :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          btf2_re                         :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          btf2_im                         :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          btf_vld                         :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          wrData_re                       :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
          wrData_im                       :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
          wrAddr                          :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          wrEnb                           :   OUT   std_logic;
          dout_9_1_re                     :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
          dout_9_1_im                     :   OUT   std_logic_vector(24 DOWNTO 0);  -- ufix25
          dout_9_1_vld                    :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Complex3Multiply_block2
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Complex3Multiply_block2(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SimpleDualPortRAM_generic_block
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SimpleDualPortRAM_generic_block(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SDFCommutator9
    USE ENTITY work_ltehdlDownlinkSyncDemod.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SDFCommutator9(rtl);

  -- Signals
  SIGNAL din_9_1_re_dly_signed            : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL din_re                           : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL din_9_1_im_dly_signed            : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL din_im                           : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL dinXTwdl_re                      : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL dinXTwdl_im                      : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL dinXTwdl_9_1_vld_1               : std_logic;
  SIGNAL dinXTwdl_re_signed               : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL dinXTwdl_im_signed               : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL x_vld                            : std_logic;
  SIGNAL btf2_im                          : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL btf2_re                          : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL btf1_im                          : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL btf1_re                          : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL dinXTwdlf_im                     : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL dinXTwdlf_re                     : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL xf_im                            : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL wrData_im                        : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL wrAddr                           : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL wrEnb                            : std_logic;
  SIGNAL x_im                             : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL x_im_signed                      : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL wrData_re                        : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL x_re                             : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL x_re_signed                      : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL Radix22ButterflyG1_btf1_re_reg   : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL Radix22ButterflyG1_btf1_im_reg   : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL Radix22ButterflyG1_btf2_re_reg   : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL Radix22ButterflyG1_btf2_im_reg   : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL Radix22ButterflyG1_x_re_dly1     : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG1_x_im_dly1     : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG1_x_vld_dly1    : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly1 : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly1 : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly2 : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly2 : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly1 : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly2 : std_logic;
  SIGNAL Radix22ButterflyG1_btf1_re_reg_next : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_btf1_im_reg_next : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_btf2_re_reg_next : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_btf2_im_reg_next : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_add_cast      : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_add_cast_1    : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_sub_cast      : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_sub_cast_1    : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_add_cast_2    : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_add_cast_3    : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_sub_cast_2    : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_sub_cast_3    : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL xf_re                            : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinxTwdlf_vld                    : std_logic;
  SIGNAL btf_vld                          : std_logic;
  SIGNAL dout_9_1_re_tmp                  : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL dout_9_1_im_tmp                  : std_logic_vector(24 DOWNTO 0);  -- ufix25

BEGIN
  u_MUL3 : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_Complex3Multiply_block2
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              din_re => std_logic_vector(din_re),  -- ufix25
              din_im => std_logic_vector(din_im),  -- ufix25
              din_9_vld_dly => din_9_vld_dly,
              twdl_9_1_re => twdl_9_1_re,  -- ufix16
              twdl_9_1_im => twdl_9_1_im,  -- ufix16
              syncReset => syncReset,
              dinXTwdl_re => dinXTwdl_re,  -- ufix25
              dinXTwdl_im => dinXTwdl_im,  -- ufix25
              dinXTwdl_9_1_vld => dinXTwdl_9_1_vld_1
              );

  u_dataMEM_im_0_9 : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 2,
                 DataWidth => 25
                 )
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              wr_din => wrData_im,
              wr_addr => wrAddr,
              wr_en => wrEnb,
              rd_addr => rd_9_Addr,
              rd_dout => x_im
              );

  u_dataMEM_re_0_9 : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 2,
                 DataWidth => 25
                 )
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              wr_din => wrData_re,
              wr_addr => wrAddr,
              wr_en => wrEnb,
              rd_addr => rd_9_Addr,
              rd_dout => x_re
              );

  u_SDFCOMMUTATOR_9 : LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_SDFCommutator9
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              din_9_vld_dly => din_9_vld_dly,
              xf_re => std_logic_vector(xf_re),  -- ufix25
              xf_im => std_logic_vector(xf_im),  -- ufix25
              xf_vld => xf_vld,
              dinXTwdlf_re => std_logic_vector(dinXTwdlf_re),  -- ufix25
              dinXTwdlf_im => std_logic_vector(dinXTwdlf_im),  -- ufix25
              dinxTwdlf_vld => dinxTwdlf_vld,
              btf1_re => std_logic_vector(btf1_re),  -- ufix25
              btf1_im => std_logic_vector(btf1_im),  -- ufix25
              btf2_re => std_logic_vector(btf2_re),  -- ufix25
              btf2_im => std_logic_vector(btf2_im),  -- ufix25
              btf_vld => btf_vld,
              syncReset => syncReset,
              wrData_re => wrData_re,  -- ufix25
              wrData_im => wrData_im,  -- ufix25
              wrAddr => wrAddr,  -- ufix2
              wrEnb => wrEnb,
              dout_9_1_re => dout_9_1_re_tmp,  -- ufix25
              dout_9_1_im => dout_9_1_im_tmp,  -- ufix25
              dout_9_1_vld => dout_9_1_vld
              );

  din_9_1_re_dly_signed <= signed(din_9_1_re_dly);

  din_re <= resize(din_9_1_re_dly_signed, 25);

  din_9_1_im_dly_signed <= signed(din_9_1_im_dly);

  din_im <= resize(din_9_1_im_dly_signed, 25);

  dinXTwdl_re_signed <= signed(dinXTwdl_re);

  dinXTwdl_im_signed <= signed(dinXTwdl_im);

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        x_vld <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          x_vld <= '0';
        ELSE 
          x_vld <= rd_9_Enb;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  x_im_signed <= signed(x_im);

  x_re_signed <= signed(x_re);

  -- Radix22ButterflyG1
  Radix22ButterflyG1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Radix22ButterflyG1_btf1_re_reg <= to_signed(16#0000000#, 26);
        Radix22ButterflyG1_btf1_im_reg <= to_signed(16#0000000#, 26);
        Radix22ButterflyG1_btf2_re_reg <= to_signed(16#0000000#, 26);
        Radix22ButterflyG1_btf2_im_reg <= to_signed(16#0000000#, 26);
        Radix22ButterflyG1_x_re_dly1 <= to_signed(16#0000000#, 25);
        Radix22ButterflyG1_x_im_dly1 <= to_signed(16#0000000#, 25);
        Radix22ButterflyG1_x_vld_dly1 <= '0';
        xf_re <= to_signed(16#0000000#, 25);
        xf_im <= to_signed(16#0000000#, 25);
        xf_vld <= '0';
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= to_signed(16#0000000#, 25);
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= to_signed(16#0000000#, 25);
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= to_signed(16#0000000#, 25);
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= to_signed(16#0000000#, 25);
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= '0';
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= '0';
        btf_vld <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          Radix22ButterflyG1_btf1_re_reg <= to_signed(16#0000000#, 26);
          Radix22ButterflyG1_btf1_im_reg <= to_signed(16#0000000#, 26);
          Radix22ButterflyG1_btf2_re_reg <= to_signed(16#0000000#, 26);
          Radix22ButterflyG1_btf2_im_reg <= to_signed(16#0000000#, 26);
          Radix22ButterflyG1_x_re_dly1 <= to_signed(16#0000000#, 25);
          Radix22ButterflyG1_x_im_dly1 <= to_signed(16#0000000#, 25);
          Radix22ButterflyG1_x_vld_dly1 <= '0';
          xf_re <= to_signed(16#0000000#, 25);
          xf_im <= to_signed(16#0000000#, 25);
          xf_vld <= '0';
          Radix22ButterflyG1_dinXtwdl_re_dly1 <= to_signed(16#0000000#, 25);
          Radix22ButterflyG1_dinXtwdl_im_dly1 <= to_signed(16#0000000#, 25);
          Radix22ButterflyG1_dinXtwdl_re_dly2 <= to_signed(16#0000000#, 25);
          Radix22ButterflyG1_dinXtwdl_im_dly2 <= to_signed(16#0000000#, 25);
          Radix22ButterflyG1_dinXtwdl_vld_dly1 <= '0';
          Radix22ButterflyG1_dinXtwdl_vld_dly2 <= '0';
          btf_vld <= '0';
        ELSE 
          Radix22ButterflyG1_btf1_re_reg <= Radix22ButterflyG1_btf1_re_reg_next;
          Radix22ButterflyG1_btf1_im_reg <= Radix22ButterflyG1_btf1_im_reg_next;
          Radix22ButterflyG1_btf2_re_reg <= Radix22ButterflyG1_btf2_re_reg_next;
          Radix22ButterflyG1_btf2_im_reg <= Radix22ButterflyG1_btf2_im_reg_next;
          xf_re <= Radix22ButterflyG1_x_re_dly1;
          xf_im <= Radix22ButterflyG1_x_im_dly1;
          xf_vld <= Radix22ButterflyG1_x_vld_dly1;
          btf_vld <= Radix22ButterflyG1_dinXtwdl_vld_dly2;
          Radix22ButterflyG1_dinXtwdl_vld_dly2 <= Radix22ButterflyG1_dinXtwdl_vld_dly1;
          Radix22ButterflyG1_dinXtwdl_re_dly2 <= Radix22ButterflyG1_dinXtwdl_re_dly1;
          Radix22ButterflyG1_dinXtwdl_im_dly2 <= Radix22ButterflyG1_dinXtwdl_im_dly1;
          Radix22ButterflyG1_dinXtwdl_re_dly1 <= dinXTwdl_re_signed;
          Radix22ButterflyG1_dinXtwdl_im_dly1 <= dinXTwdl_im_signed;
          Radix22ButterflyG1_x_re_dly1 <= x_re_signed;
          Radix22ButterflyG1_x_im_dly1 <= x_im_signed;
          Radix22ButterflyG1_x_vld_dly1 <= x_vld;
          Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_9_enb AND dinXTwdl_9_1_vld_1;
        END IF;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG1_process;

  dinxTwdlf_vld <= ( NOT proc_9_enb) AND dinXTwdl_9_1_vld_1;
  Radix22ButterflyG1_add_cast <= resize(Radix22ButterflyG1_x_re_dly1, 26);
  Radix22ButterflyG1_add_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 26);
  Radix22ButterflyG1_btf1_re_reg_next <= Radix22ButterflyG1_add_cast + Radix22ButterflyG1_add_cast_1;
  Radix22ButterflyG1_sub_cast <= resize(Radix22ButterflyG1_x_re_dly1, 26);
  Radix22ButterflyG1_sub_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 26);
  Radix22ButterflyG1_btf2_re_reg_next <= Radix22ButterflyG1_sub_cast - Radix22ButterflyG1_sub_cast_1;
  Radix22ButterflyG1_add_cast_2 <= resize(Radix22ButterflyG1_x_im_dly1, 26);
  Radix22ButterflyG1_add_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 26);
  Radix22ButterflyG1_btf1_im_reg_next <= Radix22ButterflyG1_add_cast_2 + Radix22ButterflyG1_add_cast_3;
  Radix22ButterflyG1_sub_cast_2 <= resize(Radix22ButterflyG1_x_im_dly1, 26);
  Radix22ButterflyG1_sub_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 26);
  Radix22ButterflyG1_btf2_im_reg_next <= Radix22ButterflyG1_sub_cast_2 - Radix22ButterflyG1_sub_cast_3;
  dinXTwdlf_re <= dinXTwdl_re_signed;
  dinXTwdlf_im <= dinXTwdl_im_signed;
  btf1_re <= Radix22ButterflyG1_btf1_re_reg(24 DOWNTO 0);
  btf1_im <= Radix22ButterflyG1_btf1_im_reg(24 DOWNTO 0);
  btf2_re <= Radix22ButterflyG1_btf2_re_reg(24 DOWNTO 0);
  btf2_im <= Radix22ButterflyG1_btf2_im_reg(24 DOWNTO 0);

  dout_9_1_re <= dout_9_1_re_tmp;

  dout_9_1_im <= dout_9_1_im_tmp;

  dinXTwdl_9_1_vld <= dinXTwdl_9_1_vld_1;

END rtl;

