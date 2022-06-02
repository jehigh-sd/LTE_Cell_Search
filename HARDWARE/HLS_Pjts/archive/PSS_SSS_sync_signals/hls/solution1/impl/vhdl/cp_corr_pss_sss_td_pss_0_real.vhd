-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity cp_corr_pss_sss_td_pss_0_real_rom is 
    generic(
             DWIDTH     : integer := 32; 
             AWIDTH     : integer := 7; 
             MEM_SIZE    : integer := 128
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of cp_corr_pss_sss_td_pss_0_real_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111101100101111110001111010010", 
    1 => "00111100101000111100110010001110", 
    2 => "10111101100011110100100000111101", 
    3 => "10111101101000110100110000011011", 
    4 => "10111011000010101101011010001000", 
    5 => "00111101100100110010101011010000", 
    6 => "00111101101000010110001101111000", 
    7 => "00111101000011000001011001011001", 
    8 => "10111100101010100001101101011100", 
    9 => "10111101100000010101101000001000", 
    10 => "10111101101011011010001100111100", 
    11 => "10111101101101110101000100000101", 
    12 => "10111101101111100011100011101011", 
    13 => "10111101110011000010100110111111", 
    14 => "10111101110001010100110101100010", 
    15 => "10111101101001111001010011101010", 
    16 => "10111101100101100001000010101110", 
    17 => "10111101011110000101100101000011", 
    18 => "10111011110101010011010001111010", 
    19 => "00111101100101111100111101011111", 
    20 => "00111101110001000100000011110010", 
    21 => "00111100101100010011001101111111", 
    22 => "10111101011101011001010101111001", 
    23 => "10111101010110011001101110110010", 
    24 => "00111011100101010011000001111110", 
    25 => "00111100011001111110101001100000", 
    26 => "10111100100110000000101100100100", 
    27 => "10111100000010011010100000011111", 
    28 => "00111101001001111110111010010001", 
    29 => "00111100111111000000001010110000", 
    30 => "10111101011010011111010110011101", 
    31 => "10111101110111101110001001000011", 
    32 => "10111101010010011010111111100010", 
    33 => "00111101010010000010011110110111", 
    34 => "00111101101100001010101110110100", 
    35 => "00111101100101000001000001110011", 
    36 => "00111101100011010100100000000010", 
    37 => "00111101101001001110100111000100", 
    38 => "00111101100110111001001110001010", 
    39 => "00111101100000011111010110111110", 
    40 => "00111101100011011100111101000110", 
    41 => "00111101101010111100001001110110", 
    42 => "00111101101010111101011011101001", 
    43 => "00111101100010000010110001101111", 
    44 => "00111100110100101010011000101011", 
    45 => "10111101001111101000011110010000", 
    46 => "10111101110100100100010010100110", 
    47 => "10111101100001101100001100110011", 
    48 => "00111101000110101010011100010110", 
    49 => "00111101100100111001001000011001", 
    50 => "10111100000111111110000000000101", 
    51 => "10111101100100110101010011000001", 
    52 => "10111011111010111110010011000000", 
    53 => "00111101100101101111010101000101", 
    54 => "00111100100001010011111000101101", 
    55 => "10111101110111000100001100101101", 
    56 => "10111101110010100111001111110111", 
    57 => "00111101001111100110100100100111", 
    58 => "00111110000001100110000100101000", 
    59 => "00111101100100110011000110100001", 
    60 => "00111011000110001111011000000110", 
    61 => "00111100100110010100111000011010", 
    62 => "00111101000010000000111010001101", 
    63 => "10111100111010000100100010111111", 
    64 => "10111101100111000101000001001000", 
    65 => "10111100111010000100100010111111", 
    66 => "00111101000010000000111010001101", 
    67 => "00111100100110010100111000011010", 
    68 => "00111011000110001111011000000110", 
    69 => "00111101100100110011000110100001", 
    70 => "00111110000001100110000100101000", 
    71 => "00111101001111100110100100100111", 
    72 => "10111101110010100111001111110111", 
    73 => "10111101110111000100001100101101", 
    74 => "00111100100001010011111000101101", 
    75 => "00111101100101101111010101000101", 
    76 => "10111011111010111110010011000000", 
    77 => "10111101100100110101010011000001", 
    78 => "10111100000111111110000000000101", 
    79 => "00111101100100111001001000011001", 
    80 => "00111101000110101010011100010110", 
    81 => "10111101100001101100001100110011", 
    82 => "10111101110100100100010010100110", 
    83 => "10111101001111101000011110010000", 
    84 => "00111100110100101010011000101011", 
    85 => "00111101100010000010110001101111", 
    86 => "00111101101010111101011011101001", 
    87 => "00111101101010111100001001110110", 
    88 => "00111101100011011100111101000110", 
    89 => "00111101100000011111010110111110", 
    90 => "00111101100110111001001110001010", 
    91 => "00111101101001001110100111000100", 
    92 => "00111101100011010100100000000010", 
    93 => "00111101100101000001000001110011", 
    94 => "00111101101100001010101110110100", 
    95 => "00111101010010000010011110110111", 
    96 => "10111101010010011010111111100010", 
    97 => "10111101110111101110001001000011", 
    98 => "10111101011010011111010110011101", 
    99 => "00111100111111000000001010110000", 
    100 => "00111101001001111110111010010001", 
    101 => "10111100000010011010100000011111", 
    102 => "10111100100110000000101100100100", 
    103 => "00111100011001111110101001100000", 
    104 => "00111011100101010011000001111110", 
    105 => "10111101010110011001101110110010", 
    106 => "10111101011101011001010101111001", 
    107 => "00111100101100010011001101111111", 
    108 => "00111101110001000100000011110010", 
    109 => "00111101100101111100111101011111", 
    110 => "10111011110101010011010001111010", 
    111 => "10111101011110000101100101000011", 
    112 => "10111101100101100001000010101110", 
    113 => "10111101101001111001010011101010", 
    114 => "10111101110001010100110101100010", 
    115 => "10111101110011000010100110111111", 
    116 => "10111101101111100011100011101011", 
    117 => "10111101101101110101000100000101", 
    118 => "10111101101011011010001100111100", 
    119 => "10111101100000010101101000001000", 
    120 => "10111100101010100001101101011100", 
    121 => "00111101000011000001011001011001", 
    122 => "00111101101000010110001101111000", 
    123 => "00111101100100110010101011010000", 
    124 => "10111011000010101101011010001000", 
    125 => "10111101101000110100110000011011", 
    126 => "10111101100011110100100000111101", 
    127 => "00111100101000111100110010001110" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity cp_corr_pss_sss_td_pss_0_real is
    generic (
        DataWidth : INTEGER := 32;
        AddressRange : INTEGER := 128;
        AddressWidth : INTEGER := 7);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of cp_corr_pss_sss_td_pss_0_real is
    component cp_corr_pss_sss_td_pss_0_real_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    cp_corr_pss_sss_td_pss_0_real_rom_U :  component cp_corr_pss_sss_td_pss_0_real_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;

