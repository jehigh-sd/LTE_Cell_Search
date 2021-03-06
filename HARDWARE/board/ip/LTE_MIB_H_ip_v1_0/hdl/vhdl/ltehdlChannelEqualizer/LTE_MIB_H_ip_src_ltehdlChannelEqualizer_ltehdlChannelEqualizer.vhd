-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlChannelEqualizer\LTE_MIB_H_ip_src_ltehdlChannelEqualizer_ltehdlChannelEqualizer.vhd
-- Created: 2022-05-23 17:26:43
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlChannelEqualizer_ltehdlChannelEqualizer
-- Source Path: ltehdlChannelEqualizer
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work_ltehdlChannelEqualizer;
USE work.LTE_MIB_H_ip_src_ltehdlChannelEqualizer_ltehdlChannelEqualizer_pac.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlChannelEqualizer_ltehdlChannelEqualizer IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        enb_1_2_1                         :   IN    std_logic;
        cellDetected                      :   IN    std_logic;
        NCellID                           :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
        NSubframe                         :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        NDLRB                             :   IN    std_logic_vector(6 DOWNTO 0);  -- ufix7
        gridData_gridData_re              :   IN    std_logic_vector(15 DOWNTO 0);  -- record {sfix16_En15 (c),boolean}
        gridData_gridData_im              :   IN    std_logic_vector(15 DOWNTO 0);  -- record {sfix16_En15 (c),boolean}
        gridData_gridDataValid            :   IN    std_logic;  -- record {sfix16_En15 (c),boolean}
        hestRdAddr                        :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
        gridWriteDone                     :   IN    std_logic;
        eqSymbols_eqSymbols_re            :   OUT   std_logic_vector(17 DOWNTO 0);  -- record {sfix18_En17 (c),boolean}
        eqSymbols_eqSymbols_im            :   OUT   std_logic_vector(17 DOWNTO 0);  -- record {sfix18_En17 (c),boolean}
        eqSymbols_eqSymbolsValid          :   OUT   std_logic  -- record {sfix18_En17 (c),boolean}
        );
END LTE_MIB_H_ip_src_ltehdlChannelEqualizer_ltehdlChannelEqualizer;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlChannelEqualizer_ltehdlChannelEqualizer IS

  -- Component Declarations
  COMPONENT LTE_MIB_H_ip_src_ltehdlChannelEqualizer_rsBankSymbolCount
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          rsValid                         :   IN    std_logic;
          reset                           :   IN    std_logic;
          rsBank                          :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          rsCount                         :   OUT   std_logic_vector(8 DOWNTO 0)  -- ufix9
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlChannelEqualizer_cellRefGen
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          Nsubframe                       :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          ofdmSymb                        :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          NcellID                         :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
          enGold                          :   IN    std_logic;
          cellDetected                    :   IN    std_logic;
          cellRef_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          cellRef_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          outValid                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlChannelEqualizer_chEst
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          rxRS_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          rxRS_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          refRS_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          refRS_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          rsValid                         :   IN    std_logic;
          rsbank                          :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          rscount                         :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
          cellID                          :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
          ndlrb                           :   IN    std_logic_vector(6 DOWNTO 0);  -- ufix7
          hestRdAddr                      :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
          hestRdEnable                    :   IN    std_logic;
          reset                           :   IN    std_logic;
          hEst_a0_re                      :   OUT   std_logic_vector(16 DOWNTO 0);  -- sfix17_En16
          hEst_a0_im                      :   OUT   std_logic_vector(16 DOWNTO 0);  -- sfix17_En16
          hEst_a1_re                      :   OUT   std_logic_vector(16 DOWNTO 0);  -- sfix17_En16
          hEst_a1_im                      :   OUT   std_logic_vector(16 DOWNTO 0);  -- sfix17_En16
          hEstValid                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_MIB_H_ip_src_ltehdlChannelEqualizer_TxDivDecode
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          gridData_re                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          gridData_im                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          A_re                            :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En16
          A_im                            :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En16
          B_re                            :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En16
          B_im                            :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En16
          dataValid                       :   IN    std_logic;
          resetCount                      :   IN    std_logic;
          S_re                            :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En17
          S_im                            :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En17
          SValid                          :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_MIB_H_ip_src_ltehdlChannelEqualizer_rsBankSymbolCount
    USE ENTITY work_ltehdlChannelEqualizer.LTE_MIB_H_ip_src_ltehdlChannelEqualizer_rsBankSymbolCount(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlChannelEqualizer_cellRefGen
    USE ENTITY work_ltehdlChannelEqualizer.LTE_MIB_H_ip_src_ltehdlChannelEqualizer_cellRefGen(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlChannelEqualizer_chEst
    USE ENTITY work_ltehdlChannelEqualizer.LTE_MIB_H_ip_src_ltehdlChannelEqualizer_chEst(rtl);

  FOR ALL : LTE_MIB_H_ip_src_ltehdlChannelEqualizer_TxDivDecode
    USE ENTITY work_ltehdlChannelEqualizer.LTE_MIB_H_ip_src_ltehdlChannelEqualizer_TxDivDecode(rtl);

  -- Signals
  SIGNAL gridData_re                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL gridData_im                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay12_reg_re                   : vector_of_signed16(0 TO 11);  -- sfix16_En15 [12]
  SIGNAL Delay12_reg_im                   : vector_of_signed16(0 TO 11);  -- sfix16_En15 [12]
  SIGNAL Delay12_out1_re                  : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay12_out1_im                  : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay7_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay7_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay2_reg_re                    : vector_of_signed16(0 TO 3);  -- sfix16_En15 [4]
  SIGNAL Delay2_reg_im                    : vector_of_signed16(0 TO 3);  -- sfix16_En15 [4]
  SIGNAL Delay2_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay2_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL gridDataValid                    : std_logic;
  SIGNAL Constant1_out1                   : std_logic;
  SIGNAL rsValid                          : std_logic;
  SIGNAL rsBankSymbolCount_out1           : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL rsBankSymbolCount_out2           : std_logic_vector(8 DOWNTO 0);  -- ufix9
  SIGNAL alphacellRefGen_out1_re          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL alphacellRefGen_out1_im          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL alphacellRefGen_out2             : std_logic;
  SIGNAL rsBankSymbolCount_out1_unsigned  : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay10_reg                      : vector_of_unsigned4(0 TO 3);  -- ufix4 [4]
  SIGNAL rsbank                           : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL rsBankSymbolCount_out2_unsigned  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Delay11_reg                      : vector_of_unsigned9(0 TO 3);  -- ufix9 [4]
  SIGNAL rscount                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Constant2_out1                   : std_logic;
  SIGNAL dataValid                        : std_logic;
  SIGNAL chEst_out1_re                    : std_logic_vector(16 DOWNTO 0);  -- ufix17
  SIGNAL chEst_out1_im                    : std_logic_vector(16 DOWNTO 0);  -- ufix17
  SIGNAL chEst_out2_re                    : std_logic_vector(16 DOWNTO 0);  -- ufix17
  SIGNAL chEst_out2_im                    : std_logic_vector(16 DOWNTO 0);  -- ufix17
  SIGNAL chEst_out3                       : std_logic;
  SIGNAL chEst_out1_re_signed             : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL chEst_out1_im_signed             : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL Delay1_out1_re                   : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL Delay1_out1_im                   : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL chEst_out2_re_signed             : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL chEst_out2_im_signed             : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL Delay3_out1_re                   : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL Delay3_out1_im                   : signed(16 DOWNTO 0);  -- sfix17_En16
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL eqSymbols_re                     : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL eqSymbols_im                     : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL eqSymbolsValid                   : std_logic;
  SIGNAL eqSymbols_re_signed              : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL eqSymbols_im_signed              : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL Delay5_out1_eqSymbols_re         : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL Delay5_out1_eqSymbols_im         : signed(17 DOWNTO 0);  -- sfix18_En17
  SIGNAL Delay5_out1_eqSymbolsValid       : std_logic;

BEGIN
  u_rsBankSymbolCount : LTE_MIB_H_ip_src_ltehdlChannelEqualizer_rsBankSymbolCount
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              rsValid => rsValid,
              reset => cellDetected,
              rsBank => rsBankSymbolCount_out1,  -- ufix4
              rsCount => rsBankSymbolCount_out2  -- ufix9
              );

  u_cellRefGen : LTE_MIB_H_ip_src_ltehdlChannelEqualizer_cellRefGen
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_2_0 => enb_1_2_0,
              enb_1_2_1 => enb_1_2_1,
              Nsubframe => NSubframe,  -- ufix4
              ofdmSymb => rsBankSymbolCount_out1,  -- ufix4
              NcellID => NCellID,  -- ufix9
              enGold => rsValid,
              cellDetected => cellDetected,
              cellRef_re => alphacellRefGen_out1_re,  -- sfix16_En15
              cellRef_im => alphacellRefGen_out1_im,  -- sfix16_En15
              outValid => alphacellRefGen_out2
              );

  u_chEst : LTE_MIB_H_ip_src_ltehdlChannelEqualizer_chEst
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              rxRS_re => std_logic_vector(Delay2_out1_re),  -- sfix16_En15
              rxRS_im => std_logic_vector(Delay2_out1_im),  -- sfix16_En15
              refRS_re => alphacellRefGen_out1_re,  -- sfix16_En15
              refRS_im => alphacellRefGen_out1_im,  -- sfix16_En15
              rsValid => alphacellRefGen_out2,
              rsbank => std_logic_vector(rsbank),  -- ufix4
              rscount => std_logic_vector(rscount),  -- ufix9
              cellID => NCellID,  -- ufix9
              ndlrb => NDLRB,  -- ufix7
              hestRdAddr => hestRdAddr,  -- ufix11
              hestRdEnable => dataValid,
              reset => cellDetected,
              hEst_a0_re => chEst_out1_re,  -- sfix17_En16
              hEst_a0_im => chEst_out1_im,  -- sfix17_En16
              hEst_a1_re => chEst_out2_re,  -- sfix17_En16
              hEst_a1_im => chEst_out2_im,  -- sfix17_En16
              hEstValid => chEst_out3
              );

  u_TxDivDecode : LTE_MIB_H_ip_src_ltehdlChannelEqualizer_TxDivDecode
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              gridData_re => std_logic_vector(Delay7_out1_re),  -- sfix16_En15
              gridData_im => std_logic_vector(Delay7_out1_im),  -- sfix16_En15
              A_re => std_logic_vector(Delay1_out1_re),  -- sfix17_En16
              A_im => std_logic_vector(Delay1_out1_im),  -- sfix17_En16
              B_re => std_logic_vector(Delay3_out1_re),  -- sfix17_En16
              B_im => std_logic_vector(Delay3_out1_im),  -- sfix17_En16
              dataValid => Delay4_out1,
              resetCount => cellDetected,
              S_re => eqSymbols_re,  -- sfix18_En17
              S_im => eqSymbols_im,  -- sfix18_En17
              SValid => eqSymbolsValid
              );

  gridData_re <= signed(gridData_gridData_re);

  gridData_im <= signed(gridData_gridData_im);

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_reg_re <= (OTHERS => to_signed(16#0000#, 16));
        Delay12_reg_im <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb_1_2_0 = '1' THEN
        Delay12_reg_im(0) <= gridData_im;
        Delay12_reg_im(1 TO 11) <= Delay12_reg_im(0 TO 10);
        Delay12_reg_re(0) <= gridData_re;
        Delay12_reg_re(1 TO 11) <= Delay12_reg_re(0 TO 10);
      END IF;
    END IF;
  END PROCESS Delay12_process;

  Delay12_out1_re <= Delay12_reg_re(11);
  Delay12_out1_im <= Delay12_reg_im(11);

  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_out1_re <= to_signed(16#0000#, 16);
        Delay7_out1_im <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        Delay7_out1_re <= Delay12_out1_re;
        Delay7_out1_im <= Delay12_out1_im;
      END IF;
    END IF;
  END PROCESS Delay7_process;


  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_reg_re <= (OTHERS => to_signed(16#0000#, 16));
        Delay2_reg_im <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb_1_2_0 = '1' THEN
        Delay2_reg_im(0) <= gridData_im;
        Delay2_reg_im(1 TO 3) <= Delay2_reg_im(0 TO 2);
        Delay2_reg_re(0) <= gridData_re;
        Delay2_reg_re(1 TO 3) <= Delay2_reg_re(0 TO 2);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  Delay2_out1_re <= Delay2_reg_re(3);
  Delay2_out1_im <= Delay2_reg_im(3);

  gridDataValid <= gridData_gridDataValid;

  Constant1_out1 <= '0';

  
  rsValid <= gridDataValid WHEN gridWriteDone = '0' ELSE
      Constant1_out1;

  rsBankSymbolCount_out1_unsigned <= unsigned(rsBankSymbolCount_out1);

  Delay10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay10_reg <= (OTHERS => to_unsigned(16#0#, 4));
      ELSIF enb_1_2_0 = '1' THEN
        Delay10_reg(0) <= rsBankSymbolCount_out1_unsigned;
        Delay10_reg(1 TO 3) <= Delay10_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS Delay10_process;

  rsbank <= Delay10_reg(3);

  rsBankSymbolCount_out2_unsigned <= unsigned(rsBankSymbolCount_out2);

  Delay11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay11_reg <= (OTHERS => to_unsigned(16#000#, 9));
      ELSIF enb_1_2_0 = '1' THEN
        Delay11_reg(0) <= rsBankSymbolCount_out2_unsigned;
        Delay11_reg(1 TO 3) <= Delay11_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS Delay11_process;

  rscount <= Delay11_reg(3);

  Constant2_out1 <= '0';

  
  dataValid <= Constant2_out1 WHEN gridWriteDone = '0' ELSE
      gridDataValid;

  chEst_out1_re_signed <= signed(chEst_out1_re);

  chEst_out1_im_signed <= signed(chEst_out1_im);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1_re <= to_signed(16#00000#, 17);
        Delay1_out1_im <= to_signed(16#00000#, 17);
      ELSIF enb_1_2_0 = '1' THEN
        Delay1_out1_re <= chEst_out1_re_signed;
        Delay1_out1_im <= chEst_out1_im_signed;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  chEst_out2_re_signed <= signed(chEst_out2_re);

  chEst_out2_im_signed <= signed(chEst_out2_im);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1_re <= to_signed(16#00000#, 17);
        Delay3_out1_im <= to_signed(16#00000#, 17);
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_out1_re <= chEst_out2_re_signed;
        Delay3_out1_im <= chEst_out2_im_signed;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay4_out1 <= chEst_out3;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  eqSymbols_re_signed <= signed(eqSymbols_re);

  eqSymbols_im_signed <= signed(eqSymbols_im);

  c_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1_eqSymbols_re <= to_signed(16#00000#, 18);
        Delay5_out1_eqSymbols_im <= to_signed(16#00000#, 18);
      ELSIF enb_1_2_0 = '1' THEN
        Delay5_out1_eqSymbols_re <= eqSymbols_re_signed;
        Delay5_out1_eqSymbols_im <= eqSymbols_im_signed;
      END IF;
    END IF;
  END PROCESS c_process;


  eqSymbols_eqSymbols_re <= std_logic_vector(Delay5_out1_eqSymbols_re);

  eqSymbols_eqSymbols_im <= std_logic_vector(Delay5_out1_eqSymbols_im);

  c_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1_eqSymbolsValid <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay5_out1_eqSymbolsValid <= eqSymbolsValid;
      END IF;
    END IF;
  END PROCESS c_1_process;


  eqSymbols_eqSymbolsValid <= Delay5_out1_eqSymbolsValid;

END rtl;

