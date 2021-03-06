-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlResourceGrid\LTE_MIB_H_ip_src_ltehdlResourceGrid_ltehdlResourceGrid.vhd
-- Created: 2022-05-23 17:26:46
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlResourceGrid_ltehdlResourceGrid
-- Source Path: ltehdlResourceGrid
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlResourceGrid;
USE work.LTE_MIB_H_ip_src_ltehdlResourceGrid_ltehdlResourceGrid_pac.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlResourceGrid_ltehdlResourceGrid IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        rst                               :   IN    std_logic;
        OFDMdata_gridData_re              :   IN    std_logic_vector(15 DOWNTO 0);  -- record {sfix16_En15 (c),boolean}
        OFDMdata_gridData_im              :   IN    std_logic_vector(15 DOWNTO 0);  -- record {sfix16_En15 (c),boolean}
        OFDMdata_gridDataValid            :   IN    std_logic;  -- record {sfix16_En15 (c),boolean}
        writeSubframe                     :   IN    std_logic;
        NcellID                           :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
        NDLRB                             :   IN    std_logic_vector(6 DOWNTO 0);  -- ufix7
        rd_bus_rd_addr                    :   IN    std_logic_vector(10 DOWNTO 0);  -- record {ufix11,ufix4,boolean}
        rd_bus_rd_bank                    :   IN    std_logic_vector(3 DOWNTO 0);  -- record {ufix11,ufix4,boolean}
        rd_bus_rd_en                      :   IN    std_logic;  -- record {ufix11,ufix4,boolean}
        gridData_gridData_re              :   OUT   std_logic_vector(15 DOWNTO 0);  -- record {sfix16_En15 (c),boolean}
        gridData_gridData_im              :   OUT   std_logic_vector(15 DOWNTO 0);  -- record {sfix16_En15 (c),boolean}
        gridData_gridDataValid            :   OUT   std_logic;  -- record {sfix16_En15 (c),boolean}
        hestReadAddr                      :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
        gridWriteDone                     :   OUT   std_logic
        );
END LTE_MIB_H_ip_src_ltehdlResourceGrid_ltehdlResourceGrid;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlResourceGrid_ltehdlResourceGrid IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlResourceGrid_MemoryBank_Write_Controller
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          rst                             :   IN    std_logic;
          ofdmData_gridData_re            :   IN    std_logic_vector(15 DOWNTO 0);  -- record {sfix16_En15 (c),boolean}
          ofdmData_gridData_im            :   IN    std_logic_vector(15 DOWNTO 0);  -- record {sfix16_En15 (c),boolean}
          ofdmData_gridDataValid          :   IN    std_logic;  -- record {sfix16_En15 (c),boolean}
          writeSubframe                   :   IN    std_logic;
          data_in_mem_re                  :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_in_mem_im                  :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          wr_addr                         :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
          wr_en_flag                      :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix14
          wr_done                         :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlResourceGrid_rsOutputGen
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          wrData_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          wrData_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          wr_en_flag                      :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
          wrAddr                          :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
          cellID                          :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
          rsData_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          rsData_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          rsValid                         :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlResourceGrid_lst2hw
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          lst_index                       :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
          nBank                           :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          valid_in                        :   IN    std_logic;
          NDLRB                           :   IN    std_logic_vector(6 DOWNTO 0);  -- ufix7
          hw_index                        :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
          rd_bank                         :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          eq_index                        :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
          valid_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlResourceGrid_Grid_Memory_Bank
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_in_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          wr_addr                         :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
          wr_en                           :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
          rd_addr                         :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
          nbank                           :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          valid                           :   IN    std_logic;
          gridData_re                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          gridData_im                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataValid                       :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlResourceGrid_MemoryBank_Write_Controller
    USE ENTITY work_ltehdlResourceGrid.LTE_MIB_H_ip_src_ltehdlResourceGrid_MemoryBank_Write_Controller(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlResourceGrid_rsOutputGen
    USE ENTITY work_ltehdlResourceGrid.LTE_MIB_H_ip_src_ltehdlResourceGrid_rsOutputGen(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlResourceGrid_lst2hw
    USE ENTITY work_ltehdlResourceGrid.LTE_MIB_H_ip_src_ltehdlResourceGrid_lst2hw(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlResourceGrid_Grid_Memory_Bank
    USE ENTITY work_ltehdlResourceGrid.LTE_MIB_H_ip_src_ltehdlResourceGrid_Grid_Memory_Bank(rtl);

  -- Signals
  SIGNAL MemoryBank_Write_Controller_out1_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL MemoryBank_Write_Controller_out1_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL wr_addr                          : std_logic_vector(10 DOWNTO 0);  -- ufix11
  SIGNAL wr_en                            : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL MemoryBank_Write_Controller_out4 : std_logic;
  SIGNAL gridData_re                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL gridData_im                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL rsValid                          : std_logic;
  SIGNAL gridData_re_signed               : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL gridData_im_signed               : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL rd_addr                          : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL rd_addr_1                        : std_logic_vector(10 DOWNTO 0);  -- ufix11
  SIGNAL rd_bank                          : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL rd_bank_1                        : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL rd_en                            : std_logic;
  SIGNAL rd_index                         : std_logic_vector(10 DOWNTO 0);  -- ufix11
  SIGNAL rd_bank_2                        : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL lst2hw_out3                      : std_logic_vector(10 DOWNTO 0);  -- ufix11
  SIGNAL valid_out                        : std_logic;
  SIGNAL rd_index_unsigned                : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay8_out1                      : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL rd_bank_unsigned                 : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay14_out1                     : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay13_out1                     : std_logic;
  SIGNAL data_sel_re                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL data_sel_im                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Grid_Memory_Bank_out2            : std_logic;
  SIGNAL data_sel_re_signed               : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL data_sel_im_signed               : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL gridData_re_1                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL gridData_im_1                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL gridDataValid                    : std_logic;
  SIGNAL lst2hw_out3_unsigned             : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay12_out1                     : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Delay15_reg                      : vector_of_unsigned11(0 TO 1);  -- ufix11 [2]
  SIGNAL Delay15_out1                     : unsigned(10 DOWNTO 0);  -- ufix11

BEGIN
  u_MemoryBank_Write_Controller : LTE_MIB_H_ip_src_ltehdlResourceGrid_MemoryBank_Write_Controller
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              rst => rst,
              ofdmData_gridData_re => OFDMdata_gridData_re,  -- record {sfix16_En15 (c),boolean}
              ofdmData_gridData_im => OFDMdata_gridData_im,  -- record {sfix16_En15 (c),boolean}
              ofdmData_gridDataValid => OFDMdata_gridDataValid,  -- record {sfix16_En15 (c),boolean}
              writeSubframe => writeSubframe,
              data_in_mem_re => MemoryBank_Write_Controller_out1_re,  -- sfix16_En15
              data_in_mem_im => MemoryBank_Write_Controller_out1_im,  -- sfix16_En15
              wr_addr => wr_addr,  -- ufix11
              wr_en_flag => wr_en,  -- ufix14
              wr_done => MemoryBank_Write_Controller_out4
              );

  u_rsOutputGen : LTE_MIB_H_ip_src_ltehdlResourceGrid_rsOutputGen
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              wrData_re => MemoryBank_Write_Controller_out1_re,  -- sfix16_En15
              wrData_im => MemoryBank_Write_Controller_out1_im,  -- sfix16_En15
              wr_en_flag => wr_en,  -- ufix14
              wrAddr => wr_addr,  -- ufix11
              cellID => NcellID,  -- ufix9
              rsData_re => gridData_re,  -- sfix16_En15
              rsData_im => gridData_im,  -- sfix16_En15
              rsValid => rsValid
              );

  u_lst2hw : LTE_MIB_H_ip_src_ltehdlResourceGrid_lst2hw
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              lst_index => rd_addr_1,  -- ufix11
              nBank => rd_bank_1,  -- ufix4
              valid_in => rd_en,
              NDLRB => NDLRB,  -- ufix7
              hw_index => rd_index,  -- ufix11
              rd_bank => rd_bank_2,  -- ufix4
              eq_index => lst2hw_out3,  -- ufix11
              valid_out => valid_out
              );

  u_Grid_Memory_Bank : LTE_MIB_H_ip_src_ltehdlResourceGrid_Grid_Memory_Bank
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_in_re => MemoryBank_Write_Controller_out1_re,  -- sfix16_En15
              data_in_im => MemoryBank_Write_Controller_out1_im,  -- sfix16_En15
              wr_addr => wr_addr,  -- ufix11
              wr_en => wr_en,  -- ufix14
              rd_addr => std_logic_vector(Delay8_out1),  -- ufix11
              nbank => std_logic_vector(Delay14_out1),  -- ufix4
              valid => Delay13_out1,
              gridData_re => data_sel_re,  -- sfix16_En15
              gridData_im => data_sel_im,  -- sfix16_En15
              dataValid => Grid_Memory_Bank_out2
              );

  gridData_re_signed <= signed(gridData_re);

  gridData_im_signed <= signed(gridData_im);

  rd_addr <= unsigned(rd_bus_rd_addr);

  rd_addr_1 <= std_logic_vector(rd_addr);

  rd_bank <= unsigned(rd_bus_rd_bank);

  rd_bank_1 <= std_logic_vector(rd_bank);

  rd_en <= rd_bus_rd_en;

  rd_index_unsigned <= unsigned(rd_index);

  Delay8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb_1_2_0 = '1' THEN
        Delay8_out1 <= rd_index_unsigned;
      END IF;
    END IF;
  END PROCESS Delay8_process;


  rd_bank_unsigned <= unsigned(rd_bank_2);

  Delay14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_out1 <= to_unsigned(16#0#, 4);
      ELSIF enb_1_2_0 = '1' THEN
        Delay14_out1 <= rd_bank_unsigned;
      END IF;
    END IF;
  END PROCESS Delay14_process;


  Delay13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay13_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay13_out1 <= valid_out;
      END IF;
    END IF;
  END PROCESS Delay13_process;


  data_sel_re_signed <= signed(data_sel_re);

  data_sel_im_signed <= signed(data_sel_im);

  
  gridData_re_1 <= gridData_re_signed WHEN MemoryBank_Write_Controller_out4 = '0' ELSE
      data_sel_re_signed;
  
  gridData_im_1 <= gridData_im_signed WHEN MemoryBank_Write_Controller_out4 = '0' ELSE
      data_sel_im_signed;

  gridData_gridData_re <= std_logic_vector(gridData_re_1);

  gridData_gridData_im <= std_logic_vector(gridData_im_1);

  
  gridDataValid <= rsValid WHEN MemoryBank_Write_Controller_out4 = '0' ELSE
      Grid_Memory_Bank_out2;

  lst2hw_out3_unsigned <= unsigned(lst2hw_out3);

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_out1 <= to_unsigned(16#000#, 11);
      ELSIF enb_1_2_0 = '1' THEN
        Delay12_out1 <= lst2hw_out3_unsigned;
      END IF;
    END IF;
  END PROCESS Delay12_process;


  Delay15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay15_reg <= (OTHERS => to_unsigned(16#000#, 11));
      ELSIF enb_1_2_0 = '1' THEN
        Delay15_reg(0) <= Delay12_out1;
        Delay15_reg(1) <= Delay15_reg(0);
      END IF;
    END IF;
  END PROCESS Delay15_process;

  Delay15_out1 <= Delay15_reg(1);

  hestReadAddr <= std_logic_vector(Delay15_out1);

  gridData_gridDataValid <= gridDataValid;

  gridWriteDone <= MemoryBank_Write_Controller_out4;

END rtl;

