----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2024 12:42:38
-- Design Name: 
-- Module Name: DRDL - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DRDL is
Port ( dcbar1: in std_logic;
x1: in std_logic_vector(3 downto 0);
f_out1: out std_logic;
fbar_out1: out std_logic
--postable : in std_logic_vector(31 downto 0)
--negtable : in std_logic_vector(31 downto 0)
);
end DRDL;

architecture Behavioral of DRDL is
signal pc_int1:std_logic;
signal x_int1:std_logic_vector(3 downto 0);
signal f_int1:std_logic;
signal fbar_int1:std_logic;

signal table: bit_vector(63 downto 0);

begin
pc_int1 <= dcbar1;
x_int1 <= x1;
f_out1 <= f_int1;
fbar_out1 <= fbar_int1;


-- LUT6_2: 6-input 2 output Look-Up Table
-- 7 Series
-- Xilinx HDL Libraries Guide, version 2012.2
LUT6_2_inst : LUT6_2
generic map (
INIT => X"800000007FFF0000") -- Specify LUT Contents
port map (
O6 => f_int1, -- 6/5-LUT output (1-bit)
O5 => fbar_int1, -- 5-LUT output (1-bit)
I0 => x_int1(0), -- LUT input (1-bit)
I1 => x_int1(1), -- LUT input (1-bit)
I2 => x_int1(2), -- LUT input (1-bit)
I3 => x_int1(3), -- LUT input (1-bit)
I4 => pc_int1, -- LUT input (1-bit)
I5 => '1'-- LUT input (1-bit)
);
--dual rail anpassen mehr 1-en bei der 0 noch rein und 3-er


end Behavioral;