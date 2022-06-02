-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity lteCellSearch_compute_pss_td_pss_imag_V_2_rom is 
    generic(
             DWIDTH     : integer := 22; 
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


architecture rtl of lteCellSearch_compute_pss_td_pss_imag_V_2_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1100111111111111011110", 1 => "1111110000110111000100", 
    2 => "0100010000101111101001", 3 => "0100000111011100000011", 
    4 => "1110111111010111111001", 5 => "1011100000011011011001", 
    6 => "1110101000010011110000", 7 => "0100100101010011000101", 
    8 => "0101011001000000111010", 9 => "1111101011110111100011", 
    10 => "1010111011010101011010", 11 => "1101011011011000111101", 
    12 => "0011111100010000111011", 13 => "0110101010010011111100", 
    14 => "0100000100111000001101", 15 => "0001111001101110101010", 
    16 => "0011101000101000011101", 17 => "0101100101101010011010", 
    18 => "0011010011000001101010", 19 => "1110011010010010101100", 
    20 => "1011101011101010101101", 21 => "1100000110010110100101", 
    22 => "1101001100111100000111", 23 => "1110010110110001010000", 
    24 => "0000110101011110110100", 25 => "0011000111010001100100", 
    26 => "0001010011100101010011", 27 => "1011110011100000101110", 
    28 => "1000111000101100000100", 29 => "1100101111010100000001", 
    30 => "0011001101010000100011", 31 => "0101000011000100100110", 
    32 => "0001001011011001010010", 33 => "1100101101101001100110", 
    34 => "1011010011101100001000", 35 => "1100000010101001100110", 
    36 => "1101101001010011001100", 37 => "0000101110000000101010", 
    38 => "0100001000001100100011", 39 => "0011110001110101110001", 
    40 => "1110010101011000001000", 41 => "1001000010100001001101", 
    42 => "1001101110100111111111", 43 => "1110101101000100101000", 
    44 => "0000111101000110001000", 45 => "1101111100100100110110", 
    46 => "1010100101100101111101", 47 => "1011011100010011001001", 
    48 => "1110011011101011110101", 49 => "1111000010011101010010", 
    50 => "1101100000011110110011", 51 => "1101111010101011101111", 
    52 => "0001100000101000001111", 53 => "0101000011000101001000", 
    54 => "0101110101100101111001", 55 => "0100101111001011000111", 
    56 => "0011001010111100011100", 57 => "0000100000100111110111", 
    58 => "1100100111101110000000", 59 => "1010011101100011101000", 
    60 => "1100111011011000010011", 61 => "0010001011110110101001", 
    62 => "0101011000000001101111", 63 => "0100111010011000000100", 
    64 => "0011111110001010000010", 65 => "0100111010011000000100", 
    66 => "0101011000000001101111", 67 => "0010001011110110101001", 
    68 => "1100111011011000010011", 69 => "1010011101100011101000", 
    70 => "1100100111101110000000", 71 => "0000100000100111110111", 
    72 => "0011001010111100011100", 73 => "0100101111001011000111", 
    74 => "0101110101100101111001", 75 => "0101000011000101001000", 
    76 => "0001100000101000001111", 77 => "1101111010101011101111", 
    78 => "1101100000011110110011", 79 => "1111000010011101010010", 
    80 => "1110011011101011110101", 81 => "1011011100010011001001", 
    82 => "1010100101100101111101", 83 => "1101111100100100110110", 
    84 => "0000111101000110001000", 85 => "1110101101000100101000", 
    86 => "1001101110100111111111", 87 => "1001000010100001001101", 
    88 => "1110010101011000001000", 89 => "0011110001110101110001", 
    90 => "0100001000001100100011", 91 => "0000101110000000101010", 
    92 => "1101101001010011001100", 93 => "1100000010101001100110", 
    94 => "1011010011101100001000", 95 => "1100101101101001100110", 
    96 => "0001001011011001010010", 97 => "0101000011000100100110", 
    98 => "0011001101010000100011", 99 => "1100101111010100000001", 
    100 => "1000111000101100000100", 101 => "1011110011100000101110", 
    102 => "0001010011100101010011", 103 => "0011000111010001100100", 
    104 => "0000110101011110110100", 105 => "1110010110110001010000", 
    106 => "1101001100111100000111", 107 => "1100000110010110100101", 
    108 => "1011101011101010101101", 109 => "1110011010010010101100", 
    110 => "0011010011000001101010", 111 => "0101100101101010011010", 
    112 => "0011101000101000011101", 113 => "0001111001101110101010", 
    114 => "0100000100111000001101", 115 => "0110101010010011111100", 
    116 => "0011111100010000111011", 117 => "1101011011011000111101", 
    118 => "1010111011010101011010", 119 => "1111101011110111100011", 
    120 => "0101011001000000111010", 121 => "0100100101010011000101", 
    122 => "1110101000010011110000", 123 => "1011100000011011011001", 
    124 => "1110111111010111111001", 125 => "0100000111011100000011", 
    126 => "0100010000101111101001", 127 => "1111110000110111000100" );


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

entity lteCellSearch_compute_pss_td_pss_imag_V_2 is
    generic (
        DataWidth : INTEGER := 22;
        AddressRange : INTEGER := 128;
        AddressWidth : INTEGER := 7);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of lteCellSearch_compute_pss_td_pss_imag_V_2 is
    component lteCellSearch_compute_pss_td_pss_imag_V_2_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    lteCellSearch_compute_pss_td_pss_imag_V_2_rom_U :  component lteCellSearch_compute_pss_td_pss_imag_V_2_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


