----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2024 14:29:30
-- Design Name: 
-- Module Name: XOR - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_Gate is
    Port (
        A : in  STD_LOGIC; -- Input A
        B : in  STD_LOGIC; -- Input B
        Y : out STD_LOGIC  -- Output Y
    );
end XOR_Gate;

architecture Behavioral of XOR_Gate is
begin
    Y <= A XOR B; -- XOR operation
end Behavioral;

