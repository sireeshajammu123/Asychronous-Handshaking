----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2024 12:31:58
-- Design Name: 
-- Module Name: Clockworks - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clockworks is
    Generic (
        N : integer := 26  -- Divider ratio (2^N)
    );
    Port (
        clk_in  : in  std_logic;
        resetn  : in  std_logic;
        clk_out : out std_logic
    );
end Clockworks;
 
architecture Behavioral of Clockworks is
    signal counter : std_logic_vector(N-1 downto 0) := (others => '0');
begin
 
    process(clk_in, resetn)
    begin
        if resetn = '0' then
            counter <= (others => '0');
            clk_out <= '0';
        elsif rising_edge(clk_in) then
            counter <= counter + 1;
            clk_out <= counter(N-1);
        end if;
    end process;
 
end Behavioral;
