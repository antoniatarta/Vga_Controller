library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.rez.all;

entity vertical_counter is
    port(clk:in std_logic;
    hPos:in natural;
    vPos: out natural);
end vertical_counter;

architecture Behavioral of vertical_counter is

signal vPosc:natural:=0;
begin
         vertical_counter:process (clk)
         begin
           if (rising_edge(clk)) then
             if ((hPos = (HMAX - 1)) and (vPosc = (VMAX - 1))) then
               vPosc <= 0;
             elsif (hPos = (HMAX - 1)) then
               vPosc <= vPosc + 1;
             end if;
           end if;
         end process;
         vPos<=vPosc;
end Behavioral;
