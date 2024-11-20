----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2024 15:20:52
-- Design Name: 
-- Module Name: pulse2 - Behavioral
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
use IEEE.STD_LOGIC_1164.all;
Library UNISIM;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pulse2 is
  port (
    clk_pulse2 : in std_logic;
    resetp2 : in std_logic;
    P2 : in std_logic;
    dc2 : out std_logic;
    en2 : in std_logic
  );
end pulse2;

architecture Behavorial of pulse2 is
 -- signal state : std_logic:='0';
  --signal locked : std_logic;
  signal q_int2: std_logic;
  --signal q_int2: std_logic;
  --signal q_int3: std_logic;

  
  
  
begin
   

--FDCE_inst : FDCE
--    generic map (
--    INIT => '0') -- Initial value of register ('0' or '1')
--    port map (
--    Q => q_int, -- Data output
--    C => P, -- Clock input
--    CE => '1', -- Clock enable input
--    CLR => q_int3, -- Asynchronous clear input
--    D => en -- Data input
--    );
--    FDCE2_inst : FDCE
--    generic map (
--    INIT => '0') -- Initial value of register ('0' or '1')
--    port map (
--    Q => q_int2, -- Data output
--    C => q_int, -- Clock input
--    CE => '1', -- Clock enable input
--    CLR => q_int2, -- Asynchronous clear input
--    D => en -- Data input
--    );
--    FDCE3_inst : FDCE
--    generic map (
--    INIT => '0') -- Initial value of register ('0' or '1')
--    port map (
--    Q => q_int3, -- Data output
--    C => q_int2, -- Clock input
--    CE => '1', -- Clock enable input
--    CLR => q_int3, -- Asynchronous clear input
--    D => en -- Data input
--    );
    
    FDCE_inst : FDCE
    generic map (
    INIT => '0') -- Initial value of register ('0' or '1')
    port map (
    Q => q_int2, -- Data output
    C => P2, -- Clock input
    CE => '1', -- Clock enable input
    CLR => q_int2, -- Asynchronous clear input
    D => en2 -- Data input
    );
--    FDCE2_inst : FDCE
--    generic map (
--    INIT => '0') -- Initial value of register ('0' or '1')
--    port map (
--    Q => q_int2, -- Data output
--    C => q_int, -- Clock input
--    CE => '1', -- Clock enable input
--    CLR => q_int2, -- Asynchronous clear input
--    D => en -- Data input
--    );
--    FDCE3_inst : FDCE
--    generic map (
--    INIT => '0') -- Initial value of register ('0' or '1')
--    port map (
--    Q => q_int3, -- Data output
--    C => q_int2, -- Clock input
--    CE => '1', -- Clock enable input
--    CLR => q_int3, -- Asynchronous clear input
--    D => en -- Data input
--    );
    dc2 <=not(q_int2);

end Behavorial;
