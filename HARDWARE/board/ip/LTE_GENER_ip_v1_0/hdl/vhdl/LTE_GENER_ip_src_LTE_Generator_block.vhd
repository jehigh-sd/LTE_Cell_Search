-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2\LTE_GENER_ip_src_LTE_Generator_block.vhd
-- Created: 2022-05-23 17:12:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_GENER_ip_src_LTE_Generator_block
-- Source Path: zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2/LTE_GENERATOR/LTE_Generator
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LTE_GENER_ip_src_LTE_GENERATOR_pac.ALL;

ENTITY LTE_GENER_ip_src_LTE_Generator_block IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        enb_1_1_1                         :   IN    std_logic;
        testSelect                        :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
        txDataOutI                        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        txDataOutQ                        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        txValidOutI                       :   OUT   std_logic;
        txValidOutQ                       :   OUT   std_logic
        );
END LTE_GENER_ip_src_LTE_Generator_block;


ARCHITECTURE rtl OF LTE_GENER_ip_src_LTE_Generator_block IS

  -- Component Declarations
  COMPONENT LTE_GENER_ip_src_Test_Data_Generator0
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          enb_1_1_1                       :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_Test_Data_Generator1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          enb_1_1_1                       :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_Test_Data_Generator2
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          enb_1_1_1                       :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_Vector_Interpolator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          txDataI                         :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          txDataQ                         :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          txValidI                        :   OUT   std_logic;
          txValidQ                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_GENER_ip_src_Test_Data_Generator0
    USE ENTITY work.LTE_GENER_ip_src_Test_Data_Generator0(rtl);

  FOR ALL : LTE_GENER_ip_src_Test_Data_Generator1
    USE ENTITY work.LTE_GENER_ip_src_Test_Data_Generator1(rtl);

  FOR ALL : LTE_GENER_ip_src_Test_Data_Generator2
    USE ENTITY work.LTE_GENER_ip_src_Test_Data_Generator2(rtl);

  FOR ALL : LTE_GENER_ip_src_Vector_Interpolator
    USE ENTITY work.LTE_GENER_ip_src_Vector_Interpolator(rtl);

  -- Signals
  SIGNAL testSelect_signed                : signed(31 DOWNTO 0);  -- int32
  SIGNAL delayMatch_reg                   : vector_of_signed32(0 TO 31);  -- sfix32 [32]
  SIGNAL testSelect_1                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL Test_Data_Generator0_out1_re     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Test_Data_Generator0_out1_im     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Test_Data_Generator0_out1_re_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Test_Data_Generator0_out1_im_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Test_Data_Generator1_out1_re     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Test_Data_Generator1_out1_im     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Test_Data_Generator1_out1_re_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Test_Data_Generator1_out1_im_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Test_Data_Generator2_out1_re     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Test_Data_Generator2_out1_im     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Test_Data_Generator2_out1_re_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Test_Data_Generator2_out1_im_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Multiport_Switch_out1_re         : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Multiport_Switch_out1_im         : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Vector_Interpolator_out1         : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL Vector_Interpolator_out2         : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL Vector_Interpolator_out3         : std_logic;
  SIGNAL Vector_Interpolator_out4         : std_logic;

BEGIN
  u_Test_Data_Generator0 : LTE_GENER_ip_src_Test_Data_Generator0
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_32_0 => enb_1_32_0,
              enb_1_1_1 => enb_1_1_1,
              dataOut_re => Test_Data_Generator0_out1_re,  -- sfix16_En15
              dataOut_im => Test_Data_Generator0_out1_im  -- sfix16_En15
              );

  u_Test_Data_Generator1 : LTE_GENER_ip_src_Test_Data_Generator1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_32_0 => enb_1_32_0,
              enb_1_1_1 => enb_1_1_1,
              dataOut_re => Test_Data_Generator1_out1_re,  -- sfix16_En15
              dataOut_im => Test_Data_Generator1_out1_im  -- sfix16_En15
              );

  u_Test_Data_Generator2 : LTE_GENER_ip_src_Test_Data_Generator2
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_32_0 => enb_1_32_0,
              enb_1_1_1 => enb_1_1_1,
              dataOut_re => Test_Data_Generator2_out1_re,  -- sfix16_En15
              dataOut_im => Test_Data_Generator2_out1_im  -- sfix16_En15
              );

  u_Vector_Interpolator : LTE_GENER_ip_src_Vector_Interpolator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => std_logic_vector(Multiport_Switch_out1_re),  -- sfix16_En15
              dataIn_im => std_logic_vector(Multiport_Switch_out1_im),  -- sfix16_En15
              txDataI => Vector_Interpolator_out1,  -- ufix128
              txDataQ => Vector_Interpolator_out2,  -- ufix128
              txValidI => Vector_Interpolator_out3,
              txValidQ => Vector_Interpolator_out4
              );

  testSelect_signed <= signed(testSelect);

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        delayMatch_reg(0) <= testSelect_signed;
        delayMatch_reg(1 TO 31) <= delayMatch_reg(0 TO 30);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  testSelect_1 <= delayMatch_reg(31);

  Test_Data_Generator0_out1_re_signed <= signed(Test_Data_Generator0_out1_re);

  Test_Data_Generator0_out1_im_signed <= signed(Test_Data_Generator0_out1_im);

  Test_Data_Generator1_out1_re_signed <= signed(Test_Data_Generator1_out1_re);

  Test_Data_Generator1_out1_im_signed <= signed(Test_Data_Generator1_out1_im);

  Test_Data_Generator2_out1_re_signed <= signed(Test_Data_Generator2_out1_re);

  Test_Data_Generator2_out1_im_signed <= signed(Test_Data_Generator2_out1_im);

  
  Multiport_Switch_out1_re <= Test_Data_Generator0_out1_re_signed WHEN testSelect_1 = to_signed(0, 32) ELSE
      Test_Data_Generator1_out1_re_signed WHEN testSelect_1 = to_signed(1, 32) ELSE
      Test_Data_Generator2_out1_re_signed;
  
  Multiport_Switch_out1_im <= Test_Data_Generator0_out1_im_signed WHEN testSelect_1 = to_signed(0, 32) ELSE
      Test_Data_Generator1_out1_im_signed WHEN testSelect_1 = to_signed(1, 32) ELSE
      Test_Data_Generator2_out1_im_signed;

  txDataOutI <= Vector_Interpolator_out1;

  txDataOutQ <= Vector_Interpolator_out2;

  txValidOutI <= Vector_Interpolator_out3;

  txValidOutQ <= Vector_Interpolator_out4;

END rtl;

