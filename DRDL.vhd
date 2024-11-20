----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.01.2024 11:26:04
-- Design Name: 
-- Module Name: dualRail - Behavioral
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

entity dualRail2 is
Port ( dcbar: in std_logic;
x: in std_logic_vector(3 downto 0);
f_out: out std_logic;
fbar_out: out std_logic
--postable : in std_logic_vector(31 downto 0)
--negtable : in std_logic_vector(31 downto 0)
);
end dualRail2;

architecture Behavioral of dualRail2 is
signal pc_int:std_logic;
signal x_int:std_logic_vector(3 downto 0);
signal f_int:std_logic;
signal fbar_int:std_logic;

signal table: bit_vector(63 downto 0);

begin
pc_int <= dcbar;
x_int <= x;
f_out <= f_int;
fbar_out <= fbar_int;


-- LUT6_2: 6-input 2 output Look-Up Table
-- 7 Series
-- Xilinx HDL Libraries Guide, version 2012.2
LUT6_2_inst : LUT6_2
generic map (
INIT => X"800000007FFF0000") -- Specify LUT Contents
port map (
O6 => f_int, -- 6/5-LUT output (1-bit)
O5 => fbar_int, -- 5-LUT output (1-bit)
I0 => x_int(0), -- LUT input (1-bit)
I1 => x_int(1), -- LUT input (1-bit)
I2 => x_int(2), -- LUT input (1-bit)
I3 => x_int(3), -- LUT input (1-bit)
I4 => pc_int, -- LUT input (1-bit)
I5 => '1'-- LUT input (1-bit)
);
--dual rail anpassen mehr 1-en bei der 0 noch rein und 3-er


end Behavioral;
