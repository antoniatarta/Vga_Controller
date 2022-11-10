library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.rez.all;

entity horizontal_counter is
    port(clk:in std_logic;
    hPos: out natural);
end horizontal_counter;

architecture Behavioral of horizontal_counter is

signal hPosc: natural:=0;
begin
         horizontal_counter:process (clk)
         begin
           if (rising_edge(clk)) then
             if (hPosc = (HMAX - 1)) then
               hPosc <= 0;
             else
               hPosc <= hPosc + 1;
             end if;
           end if;
         end process;
         hPos<=hPosc;
end Behavioral;
