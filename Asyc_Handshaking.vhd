----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2024 12:28:49
-- Design Name: 
-- Module Name: Asyc_Handshaking - Behavioral
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

entity Asyc_Handshaking is
 Port (
        CLK   : in  std_logic;
        RESET : in  std_logic;
        X     : in std_logic_vector(3 downto 0);
     --   Y     : in std_logic_vector(1 downto 0);
        LED  : out std_logic_vector(3 downto 0);
        TOGGLE: in std_logic
        );
end Asyc_Handshaking;

architecture Behavioral of Asyc_Handshaking is

 signal slow_clk, resetn : std_logic;
 signal dc_out1, f1, fbar1, p1, en1, dc_out2, f2, fbar2, p2, en2: std_logic;
 --signal x_in1, x_in2:std_logic_vector(3 downto 0);
 signal yxor2: std_logic:='0';
 signal yxor1: std_logic:='0';
 signal y1clk: std_logic:='0';
 signal y2clk: std_logic:='0';
 signal start: std_logic:='0';
 
 component Clockworks is
        Generic (
            N : integer := 26  -- Divider ratio (2^N)
        );
        Port (
            clk_in  : in  std_logic;
            resetn  : in  std_logic;
            clk_out : out std_logic
        );
    end component;
    
    component pulse is
   
        Port (
            clk_pulse1 : in std_logic;
            resetp1 : in std_logic;
            P1 : in std_logic;
            dc1 : out std_logic;
            en1 : in std_logic
        );
    end component;
    attribute dont_touch : string;
    attribute dont_touch of pulse : component is "yes";

    
      component DRDL is
       
        Port (
             dcbar1: in std_logic;
             x1: in std_logic_vector(3 downto 0);
             f_out1: out std_logic;
             fbar_out1: out std_logic
        );
    end component;
     attribute dont_touch of DRDL : component is "yes";
    
    component DRDL1 is
       
        Port (
             dcbar2: in std_logic;
             x2: in std_logic_vector(3 downto 0);
             f_out2: out std_logic;
             fbar_out2: out std_logic
        );
    end component;
     attribute dont_touch of DRDL1 : component is "yes";
    
begin
resetn <= not(RESET);
  
    Clockworks_inst : Clockworks
    generic map (
        N => 26 
    )
    port map (
        clk_in  => CLK,
        resetn  => resetn,
        clk_out => slow_clk
    );
    
    pulse_inst : pulse
  
    port map (
        clk_pulse1  => slow_clk,
        resetp1 => resetn,
        p1 => y2clk,
        dc1 => dc_out1,
        en1 => en1
    );
    
    pulse2_inst : pulse
    port map (
        clk_pulse1  => slow_clk,
        resetp1 => resetn,
        p1 => start,
        dc1 => dc_out2,
        en1 => en2
    );
    
      DRDL_inst : DRDL
 
    port map (
        dcbar1  => dc_out1,
        x1  => X,
        f_out1 => f1,
        fbar_out1 => fbar1
    );
    
     DRDL1_inst : DRDL1
 
    port map (
        dcbar2  => dc_out2,
        x2  => X,
        f_out2 => f2,
        fbar_out2 => fbar2
    );
    
    process(f1,fbar1,f2,fbar2)
    begin
    if (f1='1' and fbar1 ='0')or (f1='0' and fbar1 ='1')  then 
    yxor1<='1';
    else
    yxor1<='0';
    end if; 
     if (f2='1' and fbar2 ='0')or (f2='0' and fbar2 ='1') then
    yxor2<='1';
    else
    yxor2<='0';
    end if;
    end process;
    
    process(slow_clk)
    begin 
    if rising_edge(slow_clk) then 
    y1clk<=yxor1;
    y2clk<=yxor2;
    end if;
   end process;
   
    process(slow_clk)
    begin 
    if rising_edge(TOGGLE) or y1clk='1' then 
    start<='1';
    else 
    start<='0';
    end if;
   end process;
   
   led(0)<=f1;
   led(1)<=f2;
   led(2)<=dc_out1;
   led(3)<=dc_out2;
   
    

end Behavioral;
