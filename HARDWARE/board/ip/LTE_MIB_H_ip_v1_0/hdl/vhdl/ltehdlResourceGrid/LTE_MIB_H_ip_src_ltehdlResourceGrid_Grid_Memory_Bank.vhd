-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlResourceGrid\LTE_MIB_H_ip_src_ltehdlResourceGrid_Grid_Memory_Bank.vhd
-- Created: 2022-05-23 17:26:46
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlResourceGrid_Grid_Memory_Bank
-- Source Path: ltehdlResourceGrid/Grid Memory Bank
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlResourceGrid;
USE work.LTE_MIB_H_ip_src_ltehdlResourceGrid_ltehdlResourceGrid_pac.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlResourceGrid_Grid_Memory_Bank IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        data_in_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        wr_addr                           :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
        wr_en                             :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        rd_addr                           :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
        nbank                             :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        valid                             :   IN    std_logic;
        gridData_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        gridData_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataValid                         :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlResourceGrid_Grid_Memory_Bank;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlResourceGrid_Grid_Memory_Bank IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlResourceGrid_Memory_Bank
    PORT( clk                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_in_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          wr_addr                         :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
          wr_en                           :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
          rd_addr                         :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
          data_out_re_0                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_1                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_2                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_3                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_4                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_5                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_6                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_7                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_8                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_9                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_10                  :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_11                  :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_12                  :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re_13                  :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_0                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_1                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_2                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_3                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_4                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_5                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_6                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_7                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_8                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_9                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_10                  :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_11                  :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_12                  :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_im_13                  :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlResourceGrid_gridBankSelect
    PORT( dataIn_re_0                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_1                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_2                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_3                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_4                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_5                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_6                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_7                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_8                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_9                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_10                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_11                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_12                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_re_13                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_0                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_1                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_2                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_3                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_4                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_5                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_6                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_7                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_8                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_9                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_10                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_11                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_12                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im_13                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          nbank                           :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          valid                           :   IN    std_logic;
          data_re                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_im                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_valid                      :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlResourceGrid_Memory_Bank
    USE ENTITY work_ltehdlResourceGrid.LTE_MIB_H_ip_src_ltehdlResourceGrid_Memory_Bank(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlResourceGrid_gridBankSelect
    USE ENTITY work_ltehdlResourceGrid.LTE_MIB_H_ip_src_ltehdlResourceGrid_gridBankSelect(rtl);

  -- Signals
  SIGNAL Memory_Bank_out1_re_0            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_1            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_2            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_3            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_4            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_5            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_6            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_7            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_8            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_9            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_10           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_11           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_12           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re_13           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_0            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_1            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_2            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_3            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_4            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_5            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_6            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_7            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_8            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_9            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_10           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_11           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_12           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_im_13           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Memory_Bank_out1_re              : vector_of_signed16(0 TO 13);  -- sfix16_En15 [14]
  SIGNAL Memory_Bank_out1_im              : vector_of_signed16(0 TO 13);  -- sfix16_En15 [14]
  SIGNAL Delay16_out1_re                  : vector_of_signed16(0 TO 13);  -- sfix16_En15 [14]
  SIGNAL Delay16_out1_im                  : vector_of_signed16(0 TO 13);  -- sfix16_En15 [14]
  SIGNAL nbank_unsigned                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay10_reg                      : vector_of_unsigned4(0 TO 1);  -- ufix4 [2]
  SIGNAL Delay10_out1                     : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay11_reg                      : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Delay11_out1                     : std_logic;
  SIGNAL gridData_re_tmp                  : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL gridData_im_tmp                  : std_logic_vector(15 DOWNTO 0);  -- ufix16

BEGIN
  u_Memory_Bank : LTE_MIB_H_ip_src_ltehdlResourceGrid_Memory_Bank
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              data_in_re => data_in_re,  -- sfix16_En15
              data_in_im => data_in_im,  -- sfix16_En15
              wr_addr => wr_addr,  -- ufix11
              wr_en => wr_en,  -- ufix14
              rd_addr => rd_addr,  -- ufix11
              data_out_re_0 => Memory_Bank_out1_re_0,  -- sfix16_En15
              data_out_re_1 => Memory_Bank_out1_re_1,  -- sfix16_En15
              data_out_re_2 => Memory_Bank_out1_re_2,  -- sfix16_En15
              data_out_re_3 => Memory_Bank_out1_re_3,  -- sfix16_En15
              data_out_re_4 => Memory_Bank_out1_re_4,  -- sfix16_En15
              data_out_re_5 => Memory_Bank_out1_re_5,  -- sfix16_En15
              data_out_re_6 => Memory_Bank_out1_re_6,  -- sfix16_En15
              data_out_re_7 => Memory_Bank_out1_re_7,  -- sfix16_En15
              data_out_re_8 => Memory_Bank_out1_re_8,  -- sfix16_En15
              data_out_re_9 => Memory_Bank_out1_re_9,  -- sfix16_En15
              data_out_re_10 => Memory_Bank_out1_re_10,  -- sfix16_En15
              data_out_re_11 => Memory_Bank_out1_re_11,  -- sfix16_En15
              data_out_re_12 => Memory_Bank_out1_re_12,  -- sfix16_En15
              data_out_re_13 => Memory_Bank_out1_re_13,  -- sfix16_En15
              data_out_im_0 => Memory_Bank_out1_im_0,  -- sfix16_En15
              data_out_im_1 => Memory_Bank_out1_im_1,  -- sfix16_En15
              data_out_im_2 => Memory_Bank_out1_im_2,  -- sfix16_En15
              data_out_im_3 => Memory_Bank_out1_im_3,  -- sfix16_En15
              data_out_im_4 => Memory_Bank_out1_im_4,  -- sfix16_En15
              data_out_im_5 => Memory_Bank_out1_im_5,  -- sfix16_En15
              data_out_im_6 => Memory_Bank_out1_im_6,  -- sfix16_En15
              data_out_im_7 => Memory_Bank_out1_im_7,  -- sfix16_En15
              data_out_im_8 => Memory_Bank_out1_im_8,  -- sfix16_En15
              data_out_im_9 => Memory_Bank_out1_im_9,  -- sfix16_En15
              data_out_im_10 => Memory_Bank_out1_im_10,  -- sfix16_En15
              data_out_im_11 => Memory_Bank_out1_im_11,  -- sfix16_En15
              data_out_im_12 => Memory_Bank_out1_im_12,  -- sfix16_En15
              data_out_im_13 => Memory_Bank_out1_im_13  -- sfix16_En15
              );

  u_gridBankSelect : LTE_MIB_H_ip_src_ltehdlResourceGrid_gridBankSelect
    PORT MAP( dataIn_re_0 => std_logic_vector(Delay16_out1_re(0)),  -- sfix16_En15
              dataIn_re_1 => std_logic_vector(Delay16_out1_re(1)),  -- sfix16_En15
              dataIn_re_2 => std_logic_vector(Delay16_out1_re(2)),  -- sfix16_En15
              dataIn_re_3 => std_logic_vector(Delay16_out1_re(3)),  -- sfix16_En15
              dataIn_re_4 => std_logic_vector(Delay16_out1_re(4)),  -- sfix16_En15
              dataIn_re_5 => std_logic_vector(Delay16_out1_re(5)),  -- sfix16_En15
              dataIn_re_6 => std_logic_vector(Delay16_out1_re(6)),  -- sfix16_En15
              dataIn_re_7 => std_logic_vector(Delay16_out1_re(7)),  -- sfix16_En15
              dataIn_re_8 => std_logic_vector(Delay16_out1_re(8)),  -- sfix16_En15
              dataIn_re_9 => std_logic_vector(Delay16_out1_re(9)),  -- sfix16_En15
              dataIn_re_10 => std_logic_vector(Delay16_out1_re(10)),  -- sfix16_En15
              dataIn_re_11 => std_logic_vector(Delay16_out1_re(11)),  -- sfix16_En15
              dataIn_re_12 => std_logic_vector(Delay16_out1_re(12)),  -- sfix16_En15
              dataIn_re_13 => std_logic_vector(Delay16_out1_re(13)),  -- sfix16_En15
              dataIn_im_0 => std_logic_vector(Delay16_out1_im(0)),  -- sfix16_En15
              dataIn_im_1 => std_logic_vector(Delay16_out1_im(1)),  -- sfix16_En15
              dataIn_im_2 => std_logic_vector(Delay16_out1_im(2)),  -- sfix16_En15
              dataIn_im_3 => std_logic_vector(Delay16_out1_im(3)),  -- sfix16_En15
              dataIn_im_4 => std_logic_vector(Delay16_out1_im(4)),  -- sfix16_En15
              dataIn_im_5 => std_logic_vector(Delay16_out1_im(5)),  -- sfix16_En15
              dataIn_im_6 => std_logic_vector(Delay16_out1_im(6)),  -- sfix16_En15
              dataIn_im_7 => std_logic_vector(Delay16_out1_im(7)),  -- sfix16_En15
              dataIn_im_8 => std_logic_vector(Delay16_out1_im(8)),  -- sfix16_En15
              dataIn_im_9 => std_logic_vector(Delay16_out1_im(9)),  -- sfix16_En15
              dataIn_im_10 => std_logic_vector(Delay16_out1_im(10)),  -- sfix16_En15
              dataIn_im_11 => std_logic_vector(Delay16_out1_im(11)),  -- sfix16_En15
              dataIn_im_12 => std_logic_vector(Delay16_out1_im(12)),  -- sfix16_En15
              dataIn_im_13 => std_logic_vector(Delay16_out1_im(13)),  -- sfix16_En15
              nbank => std_logic_vector(Delay10_out1),  -- ufix4
              valid => Delay11_out1,
              data_re => gridData_re_tmp,  -- sfix16_En15
              data_im => gridData_im_tmp,  -- sfix16_En15
              data_valid => dataValid
              );

  Memory_Bank_out1_re(0) <= signed(Memory_Bank_out1_re_0);
  Memory_Bank_out1_re(1) <= signed(Memory_Bank_out1_re_1);
  Memory_Bank_out1_re(2) <= signed(Memory_Bank_out1_re_2);
  Memory_Bank_out1_re(3) <= signed(Memory_Bank_out1_re_3);
  Memory_Bank_out1_re(4) <= signed(Memory_Bank_out1_re_4);
  Memory_Bank_out1_re(5) <= signed(Memory_Bank_out1_re_5);
  Memory_Bank_out1_re(6) <= signed(Memory_Bank_out1_re_6);
  Memory_Bank_out1_re(7) <= signed(Memory_Bank_out1_re_7);
  Memory_Bank_out1_re(8) <= signed(Memory_Bank_out1_re_8);
  Memory_Bank_out1_re(9) <= signed(Memory_Bank_out1_re_9);
  Memory_Bank_out1_re(10) <= signed(Memory_Bank_out1_re_10);
  Memory_Bank_out1_re(11) <= signed(Memory_Bank_out1_re_11);
  Memory_Bank_out1_re(12) <= signed(Memory_Bank_out1_re_12);
  Memory_Bank_out1_re(13) <= signed(Memory_Bank_out1_re_13);

  Memory_Bank_out1_im(0) <= signed(Memory_Bank_out1_im_0);
  Memory_Bank_out1_im(1) <= signed(Memory_Bank_out1_im_1);
  Memory_Bank_out1_im(2) <= signed(Memory_Bank_out1_im_2);
  Memory_Bank_out1_im(3) <= signed(Memory_Bank_out1_im_3);
  Memory_Bank_out1_im(4) <= signed(Memory_Bank_out1_im_4);
  Memory_Bank_out1_im(5) <= signed(Memory_Bank_out1_im_5);
  Memory_Bank_out1_im(6) <= signed(Memory_Bank_out1_im_6);
  Memory_Bank_out1_im(7) <= signed(Memory_Bank_out1_im_7);
  Memory_Bank_out1_im(8) <= signed(Memory_Bank_out1_im_8);
  Memory_Bank_out1_im(9) <= signed(Memory_Bank_out1_im_9);
  Memory_Bank_out1_im(10) <= signed(Memory_Bank_out1_im_10);
  Memory_Bank_out1_im(11) <= signed(Memory_Bank_out1_im_11);
  Memory_Bank_out1_im(12) <= signed(Memory_Bank_out1_im_12);
  Memory_Bank_out1_im(13) <= signed(Memory_Bank_out1_im_13);

  Delay16_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay16_out1_re <= (OTHERS => to_signed(16#0000#, 16));
        Delay16_out1_im <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb_1_2_0 = '1' THEN
        Delay16_out1_re <= Memory_Bank_out1_re;
        Delay16_out1_im <= Memory_Bank_out1_im;
      END IF;
    END IF;
  END PROCESS Delay16_process;


  nbank_unsigned <= unsigned(nbank);

  Delay10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay10_reg <= (OTHERS => to_unsigned(16#0#, 4));
      ELSIF enb_1_2_0 = '1' THEN
        Delay10_reg(0) <= nbank_unsigned;
        Delay10_reg(1) <= Delay10_reg(0);
      END IF;
    END IF;
  END PROCESS Delay10_process;

  Delay10_out1 <= Delay10_reg(1);

  Delay11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay11_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay11_reg(0) <= valid;
        Delay11_reg(1) <= Delay11_reg(0);
      END IF;
    END IF;
  END PROCESS Delay11_process;

  Delay11_out1 <= Delay11_reg(1);

  gridData_re <= gridData_re_tmp;

  gridData_im <= gridData_im_tmp;

END rtl;
