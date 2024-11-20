

library IEEE;
use IEEE.STD_LOGIC_1164.all;
Library UNISIM;
use UNISIM.vcomponents.all;

entity debouncer is
  port (
    clk : in std_logic;
    reset : in std_logic;
    P : in std_logic;
    dc : out std_logic;
    en : in std_logic
  );
end debouncer;

architecture Behavorial of debouncer is
  signal state : std_logic:='0';
  signal locked : std_logic;
  signal q_int: std_logic;
  signal q_int2: std_logic;
  signal q_int3: std_logic;

  
  
  
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
    Q => q_int, -- Data output
    C => P, -- Clock input
    CE => '1', -- Clock enable input
    CLR => q_int, -- Asynchronous clear input
    D => en -- Data input
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
    dc <=not(q_int);





end Behavorial;