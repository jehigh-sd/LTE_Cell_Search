-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEDecimatorRFSoC2x2\LTE_DOWNS_ip_src_DOWNSAMPLE.vhd
-- Created: 2022-05-25 15:55:22
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_DOWNS_ip_src_DOWNSAMPLE
-- Source Path: zynqRadioHWSWLTEDecimatorRFSoC2x2/LTE_DOWNSAMPLE_HDL/DOWNSAMPLE
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_pac.ALL;

ENTITY LTE_DOWNS_ip_src_DOWNSAMPLE IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_32_1                        :   IN    std_logic;
        enb_1_1_1                         :   IN    std_logic;
        enb_1_8_1                         :   IN    std_logic;
        enb_1_2_1                         :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        enb_1_8_0                         :   IN    std_logic;
        RxI_dataIn                        :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        RxQ_dataIn                        :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        RxI_validIn                       :   IN    std_logic;
        RxQ_validIn                       :   IN    std_logic;
        Data_Select                       :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
        txDataI_Out                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        txDataQ_Out                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        txValidI_Out                      :   OUT   std_logic;
        txValidQ_Out                      :   OUT   std_logic;
        rxReadyI_Out                      :   OUT   std_logic;
        rxReadyQ_Out                      :   OUT   std_logic
        );
END LTE_DOWNS_ip_src_DOWNSAMPLE;


ARCHITECTURE rtl OF LTE_DOWNS_ip_src_DOWNSAMPLE IS

  -- Component Declarations
  COMPONENT LTE_DOWNS_ip_src_Test_Data_Generator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_1_1                       :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
          );
  END COMPONENT;

  COMPONENT LTE_DOWNS_ip_src_Vector_Decimator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataI_in                        :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          dataQ_in                        :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          validIn_I                       :   IN    std_logic;
          validIn_Q                       :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_DOWNS_ip_src_Cascade_Downsampler
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_1_1                       :   IN    std_logic;
          enb_1_8_1                       :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb_1_8_0                       :   IN    std_logic;
          In_re                           :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          In_im                           :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          Out_re                          :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          Out_im                          :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_DOWNS_ip_src_Test_Data_Generator
    USE ENTITY work.LTE_DOWNS_ip_src_Test_Data_Generator(rtl);

  FOR ALL : LTE_DOWNS_ip_src_Vector_Decimator
    USE ENTITY work.LTE_DOWNS_ip_src_Vector_Decimator(rtl);

  FOR ALL : LTE_DOWNS_ip_src_Cascade_Downsampler
    USE ENTITY work.LTE_DOWNS_ip_src_Cascade_Downsampler(rtl);

  -- Signals
  SIGNAL Data_Select_signed               : signed(31 DOWNTO 0);  -- int32
  SIGNAL FixedPoint_Conversion2_out1      : std_logic;
  SIGNAL delayMatch1_reg                  : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL FixedPoint_Conversion2_out1_1    : std_logic;
  SIGNAL Test_Data_Generator_out1_re      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Test_Data_Generator_out1_im      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Test_Data_Generator_out1_re_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Test_Data_Generator_out1_im_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Vector_Decimator_out1_re         : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Vector_Decimator_out1_im         : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Vector_Decimator_out2            : std_logic;
  SIGNAL Vector_Decimator_out1_re_signed  : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Vector_Decimator_out1_im_signed  : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL delayMatch_reg_re                : vector_of_signed16(0 TO 31);  -- sfix16_En15 [32]
  SIGNAL delayMatch_reg_im                : vector_of_signed16(0 TO 31);  -- sfix16_En15 [32]
  SIGNAL Vector_Decimator_out1_re_1       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Vector_Decimator_out1_im_1       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataIn_re                        : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataIn_im                        : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Cascade_Downsampler_out1_re      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Cascade_Downsampler_out1_im      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Cascade_Downsampler_out1_re_unsigned : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Cascade_Downsampler_out1_im_unsigned : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL t_bypass_reg                     : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL Complex_to_Real_Imag_out1        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL t1_bypass_reg                    : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL Complex_to_Real_Imag_out2        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Downsample1_bypass_reg           : std_logic;  -- ufix1
  SIGNAL Downsample1_out1                 : std_logic;
  SIGNAL Constant1_out1                   : std_logic;

BEGIN
  u_Test_Data_Generator : LTE_DOWNS_ip_src_Test_Data_Generator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_32_0 => enb_1_32_0,
              enb => enb,
              enb_1_1_1 => enb_1_1_1,
              dataOut_re => Test_Data_Generator_out1_re,  -- sfix16_En15
              dataOut_im => Test_Data_Generator_out1_im  -- sfix16_En15
              );

  u_Vector_Decimator : LTE_DOWNS_ip_src_Vector_Decimator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataI_in => RxI_dataIn,  -- ufix128
              dataQ_in => RxQ_dataIn,  -- ufix128
              validIn_I => RxI_validIn,
              validIn_Q => RxQ_validIn,
              dataOut_re => Vector_Decimator_out1_re,  -- sfix16_En15
              dataOut_im => Vector_Decimator_out1_im,  -- sfix16_En15
              validOut => Vector_Decimator_out2
              );

  u_Cascade_Downsampler : LTE_DOWNS_ip_src_Cascade_Downsampler
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_32_0 => enb_1_32_0,
              enb => enb,
              enb_1_1_1 => enb_1_1_1,
              enb_1_8_1 => enb_1_8_1,
              enb_1_2_1 => enb_1_2_1,
              enb_1_2_0 => enb_1_2_0,
              enb_1_8_0 => enb_1_8_0,
              In_re => std_logic_vector(dataIn_re),  -- sfix16_En15
              In_im => std_logic_vector(dataIn_im),  -- sfix16_En15
              Out_re => Cascade_Downsampler_out1_re,  -- uint16
              Out_im => Cascade_Downsampler_out1_im  -- uint16
              );

  Data_Select_signed <= signed(Data_Select);

  
  FixedPoint_Conversion2_out1 <= '1' WHEN Data_Select_signed /= to_signed(0, 32) ELSE
      '0';

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch1_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch1_reg(0) <= FixedPoint_Conversion2_out1;
        delayMatch1_reg(1 TO 31) <= delayMatch1_reg(0 TO 30);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  FixedPoint_Conversion2_out1_1 <= delayMatch1_reg(31);

  Test_Data_Generator_out1_re_signed <= signed(Test_Data_Generator_out1_re);

  Test_Data_Generator_out1_im_signed <= signed(Test_Data_Generator_out1_im);

  Vector_Decimator_out1_re_signed <= signed(Vector_Decimator_out1_re);

  Vector_Decimator_out1_im_signed <= signed(Vector_Decimator_out1_im);

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg_re <= (OTHERS => to_signed(16#0000#, 16));
        delayMatch_reg_im <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb = '1' THEN
        delayMatch_reg_im(0) <= Vector_Decimator_out1_im_signed;
        delayMatch_reg_im(1 TO 31) <= delayMatch_reg_im(0 TO 30);
        delayMatch_reg_re(0) <= Vector_Decimator_out1_re_signed;
        delayMatch_reg_re(1 TO 31) <= delayMatch_reg_re(0 TO 30);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  Vector_Decimator_out1_re_1 <= delayMatch_reg_re(31);
  Vector_Decimator_out1_im_1 <= delayMatch_reg_im(31);

  
  dataIn_re <= Test_Data_Generator_out1_re_signed WHEN FixedPoint_Conversion2_out1_1 = '0' ELSE
      Vector_Decimator_out1_re_1;
  
  dataIn_im <= Test_Data_Generator_out1_im_signed WHEN FixedPoint_Conversion2_out1_1 = '0' ELSE
      Vector_Decimator_out1_im_1;

  Cascade_Downsampler_out1_re_unsigned <= unsigned(Cascade_Downsampler_out1_re);

  t_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        t_bypass_reg <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_32_1 = '1' THEN
        t_bypass_reg <= Cascade_Downsampler_out1_re_unsigned;
      END IF;
    END IF;
  END PROCESS t_bypass_process;

  
  Complex_to_Real_Imag_out1 <= Cascade_Downsampler_out1_re_unsigned WHEN enb_1_32_1 = '1' ELSE
      t_bypass_reg;

  txDataI_Out <= std_logic_vector(Complex_to_Real_Imag_out1);

  Cascade_Downsampler_out1_im_unsigned <= unsigned(Cascade_Downsampler_out1_im);

  t1_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        t1_bypass_reg <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_32_1 = '1' THEN
        t1_bypass_reg <= Cascade_Downsampler_out1_im_unsigned;
      END IF;
    END IF;
  END PROCESS t1_bypass_process;

  
  Complex_to_Real_Imag_out2 <= Cascade_Downsampler_out1_im_unsigned WHEN enb_1_32_1 = '1' ELSE
      t1_bypass_reg;

  txDataQ_Out <= std_logic_vector(Complex_to_Real_Imag_out2);

  -- Downsample1: Downsample by 32, Sample offset 0 
  -- Downsample bypass register
  Downsample1_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Downsample1_bypass_reg <= '0';
      ELSIF enb_1_32_1 = '1' THEN
        Downsample1_bypass_reg <= Vector_Decimator_out2;
      END IF;
    END IF;
  END PROCESS Downsample1_bypass_process;

  
  Downsample1_out1 <= Vector_Decimator_out2 WHEN enb_1_32_1 = '1' ELSE
      Downsample1_bypass_reg;

  Constant1_out1 <= '1';

  txValidI_Out <= Downsample1_out1;

  txValidQ_Out <= Downsample1_out1;

  rxReadyI_Out <= Constant1_out1;

  rxReadyQ_Out <= Constant1_out1;

END rtl;
