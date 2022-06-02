-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2\LTE_GENER_ip_src_FIR_Vector_Interp.vhd
-- Created: 2022-05-23 17:12:03
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_GENER_ip_src_FIR_Vector_Interp
-- Source Path: zynqRadioHWSWLTEPBCHGeneratorRFSoC2x2/LTE_GENERATOR/LTE_Generator/Vector Interpolator/FIR_Vector_Interp
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LTE_GENER_ip_src_LTE_GENERATOR_pac.ALL;

ENTITY LTE_GENER_ip_src_FIR_Vector_Interp IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        DataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        DataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        ValidIn                           :   IN    std_logic;
        DataOut_re_0                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_re_1                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_re_2                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_re_3                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_re_4                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_re_5                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_re_6                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_re_7                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_im_0                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_im_1                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_im_2                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_im_3                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_im_4                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_im_5                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_im_6                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        DataOut_im_7                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        ValidOut                          :   OUT   std_logic
        );
END LTE_GENER_ip_src_FIR_Vector_Interp;


ARCHITECTURE rtl OF LTE_GENER_ip_src_FIR_Vector_Interp IS

  -- Component Declarations
  COMPONENT LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized2
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized3
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized4
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized5
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized6
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized7
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized
    USE ENTITY work.LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized(rtl);

  FOR ALL : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized1
    USE ENTITY work.LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized1(rtl);

  FOR ALL : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized2
    USE ENTITY work.LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized2(rtl);

  FOR ALL : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized3
    USE ENTITY work.LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized3(rtl);

  FOR ALL : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized4
    USE ENTITY work.LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized4(rtl);

  FOR ALL : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized5
    USE ENTITY work.LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized5(rtl);

  FOR ALL : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized6
    USE ENTITY work.LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized6(rtl);

  FOR ALL : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized7
    USE ENTITY work.LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized7(rtl);

  -- Signals
  SIGNAL reduced_reg                      : std_logic_vector(0 TO 31);  -- ufix1 [32]
  SIGNAL ValidIn_1                        : std_logic;
  SIGNAL Discrete_FIR_Filter_HDL_Optimized_out1_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized_out1_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized_out2 : std_logic;
  SIGNAL Discrete_FIR_Filter_HDL_Optimized_out1_re_signed : signed(15 DOWNTO 0);  -- int16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized_out1_im_signed : signed(15 DOWNTO 0);  -- int16
  SIGNAL Delay2_bypass_delay_re           : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Delay2_bypass_delay_im           : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Delay2_reg_re                    : vector_of_signed16(0 TO 13);  -- sfix16 [14]
  SIGNAL Delay2_reg_im                    : vector_of_signed16(0 TO 13);  -- sfix16 [14]
  SIGNAL Delay2_out1_re                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL Delay2_out1_im                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized1_out1_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized1_out1_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized1_out2 : std_logic;
  SIGNAL Discrete_FIR_Filter_HDL_Optimized2_out1_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized2_out1_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized2_out2 : std_logic;
  SIGNAL Discrete_FIR_Filter_HDL_Optimized3_out1_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized3_out1_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized3_out2 : std_logic;
  SIGNAL Discrete_FIR_Filter_HDL_Optimized4_out1_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized4_out1_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized4_out2 : std_logic;
  SIGNAL Discrete_FIR_Filter_HDL_Optimized4_out1_re_signed : signed(15 DOWNTO 0);  -- int16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized4_out1_im_signed : signed(15 DOWNTO 0);  -- int16
  SIGNAL Delay1_bypass_delay_re           : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Delay1_bypass_delay_im           : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Delay1_reg_re                    : vector_of_signed16(0 TO 14);  -- sfix16 [15]
  SIGNAL Delay1_reg_im                    : vector_of_signed16(0 TO 14);  -- sfix16 [15]
  SIGNAL Delay1_out1_re                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL Delay1_out1_im                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized5_out1_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized5_out1_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized5_out2 : std_logic;
  SIGNAL Discrete_FIR_Filter_HDL_Optimized6_out1_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized6_out1_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized6_out2 : std_logic;
  SIGNAL Discrete_FIR_Filter_HDL_Optimized7_out1_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized7_out1_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Discrete_FIR_Filter_HDL_Optimized7_out2 : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;

BEGIN
  u_Discrete_FIR_Filter_HDL_Optimized : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => DataIn_re,  -- int16
              dataIn_im => DataIn_im,  -- int16
              validIn => ValidIn_1,
              dataOut_re => Discrete_FIR_Filter_HDL_Optimized_out1_re,  -- int16
              dataOut_im => Discrete_FIR_Filter_HDL_Optimized_out1_im,  -- int16
              validOut => Discrete_FIR_Filter_HDL_Optimized_out2
              );

  u_Discrete_FIR_Filter_HDL_Optimized1 : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => DataIn_re,  -- int16
              dataIn_im => DataIn_im,  -- int16
              validIn => ValidIn_1,
              dataOut_re => Discrete_FIR_Filter_HDL_Optimized1_out1_re,  -- int16
              dataOut_im => Discrete_FIR_Filter_HDL_Optimized1_out1_im,  -- int16
              validOut => Discrete_FIR_Filter_HDL_Optimized1_out2
              );

  u_Discrete_FIR_Filter_HDL_Optimized2 : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized2
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => DataIn_re,  -- int16
              dataIn_im => DataIn_im,  -- int16
              validIn => ValidIn_1,
              dataOut_re => Discrete_FIR_Filter_HDL_Optimized2_out1_re,  -- int16
              dataOut_im => Discrete_FIR_Filter_HDL_Optimized2_out1_im,  -- int16
              validOut => Discrete_FIR_Filter_HDL_Optimized2_out2
              );

  u_Discrete_FIR_Filter_HDL_Optimized3 : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized3
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => DataIn_re,  -- int16
              dataIn_im => DataIn_im,  -- int16
              validIn => ValidIn_1,
              dataOut_re => Discrete_FIR_Filter_HDL_Optimized3_out1_re,  -- int16
              dataOut_im => Discrete_FIR_Filter_HDL_Optimized3_out1_im,  -- int16
              validOut => Discrete_FIR_Filter_HDL_Optimized3_out2
              );

  u_Discrete_FIR_Filter_HDL_Optimized4 : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized4
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => DataIn_re,  -- int16
              dataIn_im => DataIn_im,  -- int16
              validIn => ValidIn_1,
              dataOut_re => Discrete_FIR_Filter_HDL_Optimized4_out1_re,  -- int16
              dataOut_im => Discrete_FIR_Filter_HDL_Optimized4_out1_im,  -- int16
              validOut => Discrete_FIR_Filter_HDL_Optimized4_out2
              );

  u_Discrete_FIR_Filter_HDL_Optimized5 : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized5
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => DataIn_re,  -- int16
              dataIn_im => DataIn_im,  -- int16
              validIn => ValidIn_1,
              dataOut_re => Discrete_FIR_Filter_HDL_Optimized5_out1_re,  -- int16
              dataOut_im => Discrete_FIR_Filter_HDL_Optimized5_out1_im,  -- int16
              validOut => Discrete_FIR_Filter_HDL_Optimized5_out2
              );

  u_Discrete_FIR_Filter_HDL_Optimized6 : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized6
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => DataIn_re,  -- int16
              dataIn_im => DataIn_im,  -- int16
              validIn => ValidIn_1,
              dataOut_re => Discrete_FIR_Filter_HDL_Optimized6_out1_re,  -- int16
              dataOut_im => Discrete_FIR_Filter_HDL_Optimized6_out1_im,  -- int16
              validOut => Discrete_FIR_Filter_HDL_Optimized6_out2
              );

  u_Discrete_FIR_Filter_HDL_Optimized7 : LTE_GENER_ip_src_Discrete_FIR_Filter_HDL_Optimized7
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => DataIn_re,  -- int16
              dataIn_im => DataIn_im,  -- int16
              validIn => ValidIn_1,
              dataOut_re => Discrete_FIR_Filter_HDL_Optimized7_out1_re,  -- int16
              dataOut_im => Discrete_FIR_Filter_HDL_Optimized7_out1_im,  -- int16
              validOut => Discrete_FIR_Filter_HDL_Optimized7_out2
              );

  reduced_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        reduced_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        reduced_reg(0) <= ValidIn;
        reduced_reg(1 TO 31) <= reduced_reg(0 TO 30);
      END IF;
    END IF;
  END PROCESS reduced_process;

  ValidIn_1 <= reduced_reg(31);

  Discrete_FIR_Filter_HDL_Optimized_out1_re_signed <= signed(Discrete_FIR_Filter_HDL_Optimized_out1_re);

  Discrete_FIR_Filter_HDL_Optimized_out1_im_signed <= signed(Discrete_FIR_Filter_HDL_Optimized_out1_im);

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_bypass_delay_re <= to_signed(16#0000#, 16);
        Delay2_bypass_delay_im <= to_signed(16#0000#, 16);
        Delay2_reg_re <= (OTHERS => to_signed(16#0000#, 16));
        Delay2_reg_im <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb = '1' AND Discrete_FIR_Filter_HDL_Optimized_out2 = '1' THEN
        Delay2_bypass_delay_im <= Delay2_reg_im(13);
        Delay2_reg_im(0) <= Discrete_FIR_Filter_HDL_Optimized_out1_im_signed;
        Delay2_reg_im(1 TO 13) <= Delay2_reg_im(0 TO 12);
        Delay2_bypass_delay_re <= Delay2_reg_re(13);
        Delay2_reg_re(0) <= Discrete_FIR_Filter_HDL_Optimized_out1_re_signed;
        Delay2_reg_re(1 TO 13) <= Delay2_reg_re(0 TO 12);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  
  Delay2_out1_re <= Delay2_reg_re(13) WHEN Discrete_FIR_Filter_HDL_Optimized_out2 = '1' ELSE
      Delay2_bypass_delay_re;
  
  Delay2_out1_im <= Delay2_reg_im(13) WHEN Discrete_FIR_Filter_HDL_Optimized_out2 = '1' ELSE
      Delay2_bypass_delay_im;

  DataOut_re_0 <= std_logic_vector(Delay2_out1_re);

  Discrete_FIR_Filter_HDL_Optimized4_out1_re_signed <= signed(Discrete_FIR_Filter_HDL_Optimized4_out1_re);

  Discrete_FIR_Filter_HDL_Optimized4_out1_im_signed <= signed(Discrete_FIR_Filter_HDL_Optimized4_out1_im);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_bypass_delay_re <= to_signed(16#0000#, 16);
        Delay1_bypass_delay_im <= to_signed(16#0000#, 16);
        Delay1_reg_re <= (OTHERS => to_signed(16#0000#, 16));
        Delay1_reg_im <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb = '1' AND Discrete_FIR_Filter_HDL_Optimized4_out2 = '1' THEN
        Delay1_bypass_delay_im <= Delay1_reg_im(14);
        Delay1_reg_im(0) <= Discrete_FIR_Filter_HDL_Optimized4_out1_im_signed;
        Delay1_reg_im(1 TO 14) <= Delay1_reg_im(0 TO 13);
        Delay1_bypass_delay_re <= Delay1_reg_re(14);
        Delay1_reg_re(0) <= Discrete_FIR_Filter_HDL_Optimized4_out1_re_signed;
        Delay1_reg_re(1 TO 14) <= Delay1_reg_re(0 TO 13);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  
  Delay1_out1_re <= Delay1_reg_re(14) WHEN Discrete_FIR_Filter_HDL_Optimized4_out2 = '1' ELSE
      Delay1_bypass_delay_re;
  
  Delay1_out1_im <= Delay1_reg_im(14) WHEN Discrete_FIR_Filter_HDL_Optimized4_out2 = '1' ELSE
      Delay1_bypass_delay_im;

  DataOut_re_4 <= std_logic_vector(Delay1_out1_re);

  DataOut_im_0 <= std_logic_vector(Delay2_out1_im);

  DataOut_im_4 <= std_logic_vector(Delay1_out1_im);

  Logical_Operator_out1 <= Discrete_FIR_Filter_HDL_Optimized7_out2 AND (Discrete_FIR_Filter_HDL_Optimized6_out2 AND (Discrete_FIR_Filter_HDL_Optimized5_out2 AND (Discrete_FIR_Filter_HDL_Optimized4_out2 AND (Discrete_FIR_Filter_HDL_Optimized3_out2 AND (Discrete_FIR_Filter_HDL_Optimized2_out2 AND (Discrete_FIR_Filter_HDL_Optimized_out2 AND Discrete_FIR_Filter_HDL_Optimized1_out2))))));

  DataOut_re_1 <= Discrete_FIR_Filter_HDL_Optimized1_out1_re;

  DataOut_re_2 <= Discrete_FIR_Filter_HDL_Optimized2_out1_re;

  DataOut_re_3 <= Discrete_FIR_Filter_HDL_Optimized3_out1_re;

  DataOut_re_5 <= Discrete_FIR_Filter_HDL_Optimized5_out1_re;

  DataOut_re_6 <= Discrete_FIR_Filter_HDL_Optimized6_out1_re;

  DataOut_re_7 <= Discrete_FIR_Filter_HDL_Optimized7_out1_re;

  DataOut_im_1 <= Discrete_FIR_Filter_HDL_Optimized1_out1_im;

  DataOut_im_2 <= Discrete_FIR_Filter_HDL_Optimized2_out1_im;

  DataOut_im_3 <= Discrete_FIR_Filter_HDL_Optimized3_out1_im;

  DataOut_im_5 <= Discrete_FIR_Filter_HDL_Optimized5_out1_im;

  DataOut_im_6 <= Discrete_FIR_Filter_HDL_Optimized6_out1_im;

  DataOut_im_7 <= Discrete_FIR_Filter_HDL_Optimized7_out1_im;

  ValidOut <= Logical_Operator_out1;

END rtl;
