-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEDecimatorRFSoC2x2\LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_tc.vhd
-- Created: 2022-05-25 15:55:22
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_tc
-- Source Path: LTE_DOWNSAMPLE_HDL_tc
-- Hierarchy Level: 1
-- 
-- Master clock enable input: clk_enable
-- 
-- enb         : identical to clk_enable
-- enb_1_1_1   : identical to clk_enable
-- enb_1_2_0   : 2x slower than clk with last phase
-- enb_1_2_1   : 2x slower than clk with phase 1
-- enb_1_8_0   : 8x slower than clk with last phase
-- enb_1_8_1   : 8x slower than clk with phase 1
-- enb_1_32_0  : 32x slower than clk with last phase
-- enb_1_32_1  : 32x slower than clk with phase 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_tc IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        enb                               :   OUT   std_logic;
        enb_1_1_1                         :   OUT   std_logic;
        enb_1_2_0                         :   OUT   std_logic;
        enb_1_2_1                         :   OUT   std_logic;
        enb_1_8_0                         :   OUT   std_logic;
        enb_1_8_1                         :   OUT   std_logic;
        enb_1_32_0                        :   OUT   std_logic;
        enb_1_32_1                        :   OUT   std_logic
        );
END LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_tc;


ARCHITECTURE rtl OF LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_tc IS

  -- Signals
  SIGNAL count2                           : std_logic;  -- ufix1
  SIGNAL phase_0                          : std_logic;
  SIGNAL phase_0_tmp                      : std_logic;
  SIGNAL phase_1                          : std_logic;
  SIGNAL phase_1_tmp                      : std_logic;
  SIGNAL count8                           : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL phase_0_1                        : std_logic;
  SIGNAL phase_0_tmp_1                    : std_logic;
  SIGNAL phase_1_1                        : std_logic;
  SIGNAL phase_1_tmp_1                    : std_logic;
  SIGNAL count32                          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL phase_all                        : std_logic;
  SIGNAL phase_0_2                        : std_logic;
  SIGNAL phase_0_tmp_2                    : std_logic;
  SIGNAL phase_1_2                        : std_logic;
  SIGNAL phase_1_tmp_2                    : std_logic;

BEGIN
  Counter2 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset_x = '1' THEN
        count2 <= '1';
      ELSIF clk_enable = '1' THEN
          count2 <= NOT count2;
      END IF;
    END IF; 
  END PROCESS Counter2;

  temp_process267 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset_x = '1' THEN
        phase_0 <= '0';
      ELSIF clk_enable = '1' THEN
        phase_0 <= phase_0_tmp;
      END IF;
    END IF; 
  END PROCESS temp_process267;

  phase_0_tmp <= '1' WHEN count2 = '1' AND clk_enable = '1' ELSE '0';

  temp_process268 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset_x = '1' THEN
        phase_1 <= '1';
      ELSIF clk_enable = '1' THEN
        phase_1 <= phase_1_tmp;
      END IF;
    END IF; 
  END PROCESS temp_process268;

  phase_1_tmp <= '1' WHEN count2 = '0' AND clk_enable = '1' ELSE '0';

  Counter8 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset_x = '1' THEN
        count8 <= to_unsigned(1, 3);
      ELSIF clk_enable = '1' THEN
        IF count8 >= to_unsigned(7, 3) THEN
          count8 <= to_unsigned(0, 3);
        ELSE
          count8 <= count8 + to_unsigned(1, 3);
        END IF;
      END IF;
    END IF; 
  END PROCESS Counter8;

  temp_process269 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset_x = '1' THEN
        phase_0_1 <= '0';
      ELSIF clk_enable = '1' THEN
        phase_0_1 <= phase_0_tmp_1;
      END IF;
    END IF; 
  END PROCESS temp_process269;

  phase_0_tmp_1 <= '1' WHEN count8 = to_unsigned(7, 3) AND clk_enable = '1' ELSE '0';

  temp_process270 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset_x = '1' THEN
        phase_1_1 <= '1';
      ELSIF clk_enable = '1' THEN
        phase_1_1 <= phase_1_tmp_1;
      END IF;
    END IF; 
  END PROCESS temp_process270;

  phase_1_tmp_1 <= '1' WHEN count8 = to_unsigned(0, 3) AND clk_enable = '1' ELSE '0';

  Counter32 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset_x = '1' THEN
        count32 <= to_unsigned(1, 5);
      ELSIF clk_enable = '1' THEN
        IF count32 >= to_unsigned(31, 5) THEN
          count32 <= to_unsigned(0, 5);
        ELSE
          count32 <= count32 + to_unsigned(1, 5);
        END IF;
      END IF;
    END IF; 
  END PROCESS Counter32;

  phase_all <= '1' WHEN clk_enable = '1' ELSE '0';

  temp_process271 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset_x = '1' THEN
        phase_0_2 <= '0';
      ELSIF clk_enable = '1' THEN
        phase_0_2 <= phase_0_tmp_2;
      END IF;
    END IF; 
  END PROCESS temp_process271;

  phase_0_tmp_2 <= '1' WHEN count32 = to_unsigned(31, 5) AND clk_enable = '1' ELSE '0';

  temp_process272 : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset_x = '1' THEN
        phase_1_2 <= '1';
      ELSIF clk_enable = '1' THEN
        phase_1_2 <= phase_1_tmp_2;
      END IF;
    END IF; 
  END PROCESS temp_process272;

  phase_1_tmp_2 <= '1' WHEN count32 = to_unsigned(0, 5) AND clk_enable = '1' ELSE '0';

  enb <=  phase_all AND clk_enable;

  enb_1_1_1 <=  phase_all AND clk_enable;

  enb_1_2_0 <=  phase_0 AND clk_enable;

  enb_1_2_1 <=  phase_1 AND clk_enable;

  enb_1_8_0 <=  phase_0_1 AND clk_enable;

  enb_1_8_1 <=  phase_1_1 AND clk_enable;

  enb_1_32_0 <=  phase_0_2 AND clk_enable;

  enb_1_32_1 <=  phase_1_2 AND clk_enable;


END rtl;

