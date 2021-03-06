-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\zynqRadioHWSWLTEMIBDetectorRFSoC2x2\ltehdlDownlinkSyncDemod\LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_TWDLROM.vhd
-- Created: 2022-05-23 17:26:44
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_TWDLROM
-- Source Path: ltehdlDownlinkSyncDemod/Sync Signal Search/SSS Searcher/FFT HDL Optimized/TWDLROM
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_ltehdlDownlinkSyncDemod_pac.ALL;

ENTITY LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_TWDLROM IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dMemOutDly_vld                    :   IN    std_logic;
        stage                             :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        initIC                            :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        twdl_re                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        twdl_im                           :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16
        );
END LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_TWDLROM;


ARCHITECTURE rtl OF LTE_MIB_H_ip_src_ltehdlDownlinkSyncDemod_TWDLROM IS

  -- Constants
  CONSTANT Twiddle_re_table_data          : vector_of_signed16(0 TO 15) := 
    (to_signed(16#4000#, 16), to_signed(16#3FEC#, 16), to_signed(16#3FB1#, 16), to_signed(16#3F4F#, 16),
     to_signed(16#3EC5#, 16), to_signed(16#3E15#, 16), to_signed(16#3D3F#, 16), to_signed(16#3C42#, 16),
     to_signed(16#3B21#, 16), to_signed(16#39DB#, 16), to_signed(16#3871#, 16), to_signed(16#36E5#, 16),
     to_signed(16#3537#, 16), to_signed(16#3368#, 16), to_signed(16#3179#, 16), to_signed(16#2F6C#, 16));  -- sfix16 [16]
  CONSTANT Twiddle_im_table_data          : vector_of_signed16(0 TO 15) := 
    (to_signed(16#0000#, 16), to_signed(-16#0324#, 16), to_signed(-16#0646#, 16), to_signed(-16#0964#, 16),
     to_signed(-16#0C7C#, 16), to_signed(-16#0F8D#, 16), to_signed(-16#1294#, 16), to_signed(-16#1590#, 16),
     to_signed(-16#187E#, 16), to_signed(-16#1B5D#, 16), to_signed(-16#1E2B#, 16), to_signed(-16#20E7#, 16),
     to_signed(-16#238E#, 16), to_signed(-16#2620#, 16), to_signed(-16#289A#, 16), to_signed(-16#2AFB#, 16));  -- sfix16 [16]

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL stage_unsigned                   : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL minResRX2FFTTwdlMapping_baseAddr : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL minResRX2FFTTwdlMapping_cnt      : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL minResRX2FFTTwdlMapping_octantReg1 : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL minResRX2FFTTwdlMapping_twdlAddr_raw : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL minResRX2FFTTwdlMapping_twdlAddrMap : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL minResRX2FFTTwdlMapping_twdl45Reg : std_logic;
  SIGNAL minResRX2FFTTwdlMapping_dvldReg1 : std_logic;
  SIGNAL minResRX2FFTTwdlMapping_dvldReg2 : std_logic;
  SIGNAL minResRX2FFTTwdlMapping_maxCnt   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL minResRX2FFTTwdlMapping_baseAddr_next : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL minResRX2FFTTwdlMapping_cnt_next : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL minResRX2FFTTwdlMapping_octantReg1_next : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL minResRX2FFTTwdlMapping_twdlAddr_raw_next : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL minResRX2FFTTwdlMapping_twdlAddrMap_next : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL minResRX2FFTTwdlMapping_twdl45Reg_next : std_logic;
  SIGNAL minResRX2FFTTwdlMapping_dvldReg1_next : std_logic;
  SIGNAL minResRX2FFTTwdlMapping_dvldReg2_next : std_logic;
  SIGNAL minResRX2FFTTwdlMapping_maxCnt_next : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL twdlAddr                         : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL twdlAddrVld                      : std_logic;
  SIGNAL twdlOctant                       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL twdl45                           : std_logic;
  SIGNAL twiddleS_re                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twiddleReg_re                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twiddleS_im                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twiddleReg_im                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twdlOctantReg                    : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL twdl45Reg                        : std_logic;
  SIGNAL twdl_re_tmp                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twdl_im_tmp                      : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  stage_unsigned <= unsigned(stage);

  -- minResRX2FFTTwdlMapping
  minResRX2FFTTwdlMapping_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        minResRX2FFTTwdlMapping_octantReg1 <= to_unsigned(16#0#, 3);
        minResRX2FFTTwdlMapping_twdlAddr_raw <= to_unsigned(16#00#, 7);
        minResRX2FFTTwdlMapping_twdlAddrMap <= to_unsigned(16#0#, 4);
        minResRX2FFTTwdlMapping_twdl45Reg <= '0';
        minResRX2FFTTwdlMapping_dvldReg1 <= '0';
        minResRX2FFTTwdlMapping_dvldReg2 <= '0';
        minResRX2FFTTwdlMapping_baseAddr <= to_unsigned(16#00#, 6);
        minResRX2FFTTwdlMapping_cnt <= to_unsigned(16#3F#, 6);
        minResRX2FFTTwdlMapping_maxCnt <= to_unsigned(16#00#, 6);
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          minResRX2FFTTwdlMapping_octantReg1 <= to_unsigned(16#0#, 3);
          minResRX2FFTTwdlMapping_twdlAddr_raw <= to_unsigned(16#00#, 7);
          minResRX2FFTTwdlMapping_twdlAddrMap <= to_unsigned(16#0#, 4);
          minResRX2FFTTwdlMapping_twdl45Reg <= '0';
          minResRX2FFTTwdlMapping_dvldReg1 <= '0';
          minResRX2FFTTwdlMapping_dvldReg2 <= '0';
          minResRX2FFTTwdlMapping_baseAddr <= to_unsigned(16#00#, 6);
          minResRX2FFTTwdlMapping_cnt <= to_unsigned(16#3F#, 6);
          minResRX2FFTTwdlMapping_maxCnt <= to_unsigned(16#00#, 6);
        ELSE 
          minResRX2FFTTwdlMapping_baseAddr <= minResRX2FFTTwdlMapping_baseAddr_next;
          minResRX2FFTTwdlMapping_cnt <= minResRX2FFTTwdlMapping_cnt_next;
          minResRX2FFTTwdlMapping_octantReg1 <= minResRX2FFTTwdlMapping_octantReg1_next;
          minResRX2FFTTwdlMapping_twdlAddr_raw <= minResRX2FFTTwdlMapping_twdlAddr_raw_next;
          minResRX2FFTTwdlMapping_twdlAddrMap <= minResRX2FFTTwdlMapping_twdlAddrMap_next;
          minResRX2FFTTwdlMapping_twdl45Reg <= minResRX2FFTTwdlMapping_twdl45Reg_next;
          minResRX2FFTTwdlMapping_dvldReg1 <= minResRX2FFTTwdlMapping_dvldReg1_next;
          minResRX2FFTTwdlMapping_dvldReg2 <= minResRX2FFTTwdlMapping_dvldReg2_next;
          minResRX2FFTTwdlMapping_maxCnt <= minResRX2FFTTwdlMapping_maxCnt_next;
        END IF;
      END IF;
    END IF;
  END PROCESS minResRX2FFTTwdlMapping_process;

  minResRX2FFTTwdlMapping_output : PROCESS (dMemOutDly_vld, initIC, minResRX2FFTTwdlMapping_baseAddr,
       minResRX2FFTTwdlMapping_cnt, minResRX2FFTTwdlMapping_dvldReg1,
       minResRX2FFTTwdlMapping_dvldReg2, minResRX2FFTTwdlMapping_maxCnt,
       minResRX2FFTTwdlMapping_octantReg1, minResRX2FFTTwdlMapping_twdl45Reg,
       minResRX2FFTTwdlMapping_twdlAddrMap,
       minResRX2FFTTwdlMapping_twdlAddr_raw, stage_unsigned)
    VARIABLE octant : unsigned(2 DOWNTO 0);
    VARIABLE sub_cast : signed(15 DOWNTO 0);
    VARIABLE sub_temp : signed(15 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(8 DOWNTO 0);
    VARIABLE sub_temp_0 : signed(8 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(8 DOWNTO 0);
    VARIABLE sub_temp_1 : signed(8 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(15 DOWNTO 0);
    VARIABLE sub_temp_2 : signed(15 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(15 DOWNTO 0);
    VARIABLE sub_temp_3 : signed(15 DOWNTO 0);
  BEGIN
    sub_temp := to_signed(16#0000#, 16);
    sub_temp_0 := to_signed(16#000#, 9);
    sub_temp_1 := to_signed(16#000#, 9);
    sub_temp_2 := to_signed(16#0000#, 16);
    sub_temp_3 := to_signed(16#0000#, 16);
    sub_cast := to_signed(16#0000#, 16);
    sub_cast_0 := to_signed(16#000#, 9);
    sub_cast_1 := to_signed(16#000#, 9);
    sub_cast_2 := to_signed(16#0000#, 16);
    sub_cast_3 := to_signed(16#0000#, 16);
    minResRX2FFTTwdlMapping_baseAddr_next <= minResRX2FFTTwdlMapping_baseAddr;
    minResRX2FFTTwdlMapping_cnt_next <= minResRX2FFTTwdlMapping_cnt;
    minResRX2FFTTwdlMapping_twdlAddrMap_next <= minResRX2FFTTwdlMapping_twdlAddrMap;
    minResRX2FFTTwdlMapping_twdl45Reg_next <= minResRX2FFTTwdlMapping_twdl45Reg;
    minResRX2FFTTwdlMapping_maxCnt_next <= minResRX2FFTTwdlMapping_maxCnt;
    minResRX2FFTTwdlMapping_dvldReg2_next <= minResRX2FFTTwdlMapping_dvldReg1;
    minResRX2FFTTwdlMapping_dvldReg1_next <= dMemOutDly_vld;
    CASE minResRX2FFTTwdlMapping_twdlAddr_raw IS
      WHEN "0010000" =>
        octant := to_unsigned(16#0#, 3);
        minResRX2FFTTwdlMapping_twdl45Reg_next <= '1';
      WHEN "0100000" =>
        octant := to_unsigned(16#1#, 3);
        minResRX2FFTTwdlMapping_twdl45Reg_next <= '0';
      WHEN "0110000" =>
        octant := to_unsigned(16#2#, 3);
        minResRX2FFTTwdlMapping_twdl45Reg_next <= '1';
      WHEN "1000000" =>
        octant := to_unsigned(16#3#, 3);
        minResRX2FFTTwdlMapping_twdl45Reg_next <= '0';
      WHEN "1010000" =>
        octant := to_unsigned(16#4#, 3);
        minResRX2FFTTwdlMapping_twdl45Reg_next <= '1';
      WHEN OTHERS => 
        octant := minResRX2FFTTwdlMapping_twdlAddr_raw(6 DOWNTO 4);
        minResRX2FFTTwdlMapping_twdl45Reg_next <= '0';
    END CASE;
    minResRX2FFTTwdlMapping_octantReg1_next <= octant;
    CASE octant IS
      WHEN "000" =>
        minResRX2FFTTwdlMapping_twdlAddrMap_next <= minResRX2FFTTwdlMapping_twdlAddr_raw(3 DOWNTO 0);
      WHEN "001" =>
        sub_cast_0 := signed(resize(minResRX2FFTTwdlMapping_twdlAddr_raw, 9));
        sub_temp_0 := to_signed(16#020#, 9) - sub_cast_0;
        minResRX2FFTTwdlMapping_twdlAddrMap_next <= unsigned(sub_temp_0(3 DOWNTO 0));
      WHEN "010" =>
        sub_cast_1 := signed(resize(minResRX2FFTTwdlMapping_twdlAddr_raw, 9));
        sub_temp_1 := sub_cast_1 - to_signed(16#020#, 9);
        minResRX2FFTTwdlMapping_twdlAddrMap_next <= unsigned(sub_temp_1(3 DOWNTO 0));
      WHEN "011" =>
        sub_cast_2 := signed(resize(minResRX2FFTTwdlMapping_twdlAddr_raw & '0' & '0' & '0' & '0', 16));
        sub_temp_2 := to_signed(16#0400#, 16) - sub_cast_2;
        minResRX2FFTTwdlMapping_twdlAddrMap_next <= unsigned(sub_temp_2(7 DOWNTO 4));
      WHEN "100" =>
        sub_cast_3 := signed(resize(minResRX2FFTTwdlMapping_twdlAddr_raw & '0' & '0' & '0' & '0', 16));
        sub_temp_3 := sub_cast_3 - to_signed(16#0400#, 16);
        minResRX2FFTTwdlMapping_twdlAddrMap_next <= unsigned(sub_temp_3(7 DOWNTO 4));
      WHEN OTHERS => 
        sub_cast := signed(resize(minResRX2FFTTwdlMapping_twdlAddr_raw & '0' & '0' & '0' & '0', 16));
        sub_temp := to_signed(16#0600#, 16) - sub_cast;
        minResRX2FFTTwdlMapping_twdlAddrMap_next <= unsigned(sub_temp(7 DOWNTO 4));
    END CASE;
    minResRX2FFTTwdlMapping_twdlAddr_raw_next <= resize(unsigned'(minResRX2FFTTwdlMapping_baseAddr(0) & minResRX2FFTTwdlMapping_baseAddr(1) & minResRX2FFTTwdlMapping_baseAddr(2) & minResRX2FFTTwdlMapping_baseAddr(3) & minResRX2FFTTwdlMapping_baseAddr(4) & minResRX2FFTTwdlMapping_baseAddr(5)), 7);
    IF ( NOT initIC) = '1' THEN 
      IF (dMemOutDly_vld AND hdlcoder_to_stdlogic(minResRX2FFTTwdlMapping_cnt = to_unsigned(16#00#, 6))) = '1' THEN 
        minResRX2FFTTwdlMapping_baseAddr_next <= minResRX2FFTTwdlMapping_baseAddr + to_unsigned(16#01#, 6);
      END IF;
    ELSE 
      minResRX2FFTTwdlMapping_baseAddr_next <= to_unsigned(16#00#, 6);
    END IF;
    IF ( NOT initIC) = '1' THEN 
      IF dMemOutDly_vld = '1' THEN 
        IF minResRX2FFTTwdlMapping_cnt = to_unsigned(16#00#, 6) THEN 
          minResRX2FFTTwdlMapping_cnt_next <= minResRX2FFTTwdlMapping_maxCnt;
        ELSE 
          minResRX2FFTTwdlMapping_cnt_next <= minResRX2FFTTwdlMapping_cnt - to_unsigned(16#01#, 6);
        END IF;
      END IF;
    ELSIF stage_unsigned = to_unsigned(16#0#, 3) THEN 
      minResRX2FFTTwdlMapping_maxCnt_next <= to_unsigned(16#3F#, 6);
      minResRX2FFTTwdlMapping_cnt_next <= to_unsigned(16#3F#, 6);
    ELSE 
      minResRX2FFTTwdlMapping_cnt_next <= minResRX2FFTTwdlMapping_maxCnt srl 1;
      minResRX2FFTTwdlMapping_maxCnt_next <= minResRX2FFTTwdlMapping_maxCnt srl 1;
    END IF;
    twdlAddr <= minResRX2FFTTwdlMapping_twdlAddrMap;
    twdlAddrVld <= minResRX2FFTTwdlMapping_dvldReg2;
    twdlOctant <= minResRX2FFTTwdlMapping_octantReg1;
    twdl45 <= minResRX2FFTTwdlMapping_twdl45Reg;
  END PROCESS minResRX2FFTTwdlMapping_output;


  -- Twiddle ROM1
  twiddleS_re <= Twiddle_re_table_data(to_integer(twdlAddr));

  TWIDDLEROM_RE_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        twiddleReg_re <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        twiddleReg_re <= twiddleS_re;
      END IF;
    END IF;
  END PROCESS TWIDDLEROM_RE_process;


  -- Twiddle ROM2
  twiddleS_im <= Twiddle_im_table_data(to_integer(twdlAddr));

  TWIDDLEROM_IM_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        twiddleReg_im <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        twiddleReg_im <= twiddleS_im;
      END IF;
    END IF;
  END PROCESS TWIDDLEROM_IM_process;


  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        twdlOctantReg <= to_unsigned(16#0#, 3);
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          twdlOctantReg <= to_unsigned(16#0#, 3);
        ELSE 
          twdlOctantReg <= twdlOctant;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  intdelay_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        twdl45Reg <= '0';
      ELSIF enb = '1' THEN
        IF syncReset = '1' THEN
          twdl45Reg <= '0';
        ELSE 
          twdl45Reg <= twdl45;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  -- Radix22TwdlOctCorr
  Radix22TwdlOctCorr_output : PROCESS (twdl45Reg, twdlOctantReg, twiddleReg_im, twiddleReg_re)
    VARIABLE twdlIn_re : signed(15 DOWNTO 0);
    VARIABLE twdlIn_im : signed(15 DOWNTO 0);
    VARIABLE cast : signed(16 DOWNTO 0);
    VARIABLE cast_0 : signed(16 DOWNTO 0);
    VARIABLE cast_1 : signed(16 DOWNTO 0);
    VARIABLE cast_2 : signed(16 DOWNTO 0);
    VARIABLE cast_3 : signed(16 DOWNTO 0);
    VARIABLE cast_4 : signed(16 DOWNTO 0);
    VARIABLE cast_5 : signed(16 DOWNTO 0);
    VARIABLE cast_6 : signed(16 DOWNTO 0);
    VARIABLE cast_7 : signed(16 DOWNTO 0);
    VARIABLE cast_8 : signed(16 DOWNTO 0);
    VARIABLE cast_9 : signed(16 DOWNTO 0);
    VARIABLE cast_10 : signed(16 DOWNTO 0);
  BEGIN
    cast_0 := to_signed(16#00000#, 17);
    cast_2 := to_signed(16#00000#, 17);
    cast_4 := to_signed(16#00000#, 17);
    cast_6 := to_signed(16#00000#, 17);
    cast_8 := to_signed(16#00000#, 17);
    cast_10 := to_signed(16#00000#, 17);
    cast := to_signed(16#00000#, 17);
    cast_1 := to_signed(16#00000#, 17);
    cast_3 := to_signed(16#00000#, 17);
    cast_5 := to_signed(16#00000#, 17);
    cast_7 := to_signed(16#00000#, 17);
    cast_9 := to_signed(16#00000#, 17);
    twdlIn_re := twiddleReg_re;
    twdlIn_im := twiddleReg_im;
    IF twdl45Reg = '1' THEN 
      CASE twdlOctantReg IS
        WHEN "000" =>
          twdlIn_re := to_signed(16#2D41#, 16);
          twdlIn_im := to_signed(-16#2D41#, 16);
        WHEN "010" =>
          twdlIn_re := to_signed(-16#2D41#, 16);
          twdlIn_im := to_signed(-16#2D41#, 16);
        WHEN "100" =>
          twdlIn_re := to_signed(-16#2D41#, 16);
          twdlIn_im := to_signed(16#2D41#, 16);
        WHEN OTHERS => 
          twdlIn_re := to_signed(16#2D41#, 16);
          twdlIn_im := to_signed(-16#2D41#, 16);
      END CASE;
    ELSE 
      CASE twdlOctantReg IS
        WHEN "000" =>
          NULL;
        WHEN "001" =>
          cast := resize(twiddleReg_im, 17);
          cast_0 :=  - (cast);
          twdlIn_re := cast_0(15 DOWNTO 0);
          cast_5 := resize(twiddleReg_re, 17);
          cast_6 :=  - (cast_5);
          twdlIn_im := cast_6(15 DOWNTO 0);
        WHEN "010" =>
          twdlIn_re := twiddleReg_im;
          cast_7 := resize(twiddleReg_re, 17);
          cast_8 :=  - (cast_7);
          twdlIn_im := cast_8(15 DOWNTO 0);
        WHEN "011" =>
          cast_1 := resize(twiddleReg_re, 17);
          cast_2 :=  - (cast_1);
          twdlIn_re := cast_2(15 DOWNTO 0);
          twdlIn_im := twiddleReg_im;
        WHEN "100" =>
          cast_3 := resize(twiddleReg_re, 17);
          cast_4 :=  - (cast_3);
          twdlIn_re := cast_4(15 DOWNTO 0);
          cast_9 := resize(twiddleReg_im, 17);
          cast_10 :=  - (cast_9);
          twdlIn_im := cast_10(15 DOWNTO 0);
        WHEN OTHERS => 
          twdlIn_re := twiddleReg_im;
          twdlIn_im := twiddleReg_re;
      END CASE;
    END IF;
    twdl_re_tmp <= twdlIn_re;
    twdl_im_tmp <= twdlIn_im;
  END PROCESS Radix22TwdlOctCorr_output;


  twdl_re <= std_logic_vector(twdl_re_tmp);

  twdl_im <= std_logic_vector(twdl_im_tmp);

END rtl;

