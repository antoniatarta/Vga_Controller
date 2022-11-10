library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.rez.all;

entity horizontal_sync is
    port(clk: in std_logic;
    hPos: in natural;
    HS: out std_logic);
end horizontal_sync;

architecture Behavioral of horizontal_sync is

begin
         horizontal_sync:process (clk)
         begin
           if (rising_edge(clk)) then
                 if (hPos >= (HFP + HD - 1)) and (hPos < (HFP + HD + HSP - 1)) then
                   HS <= H_POL;
                 else
                   HS <= not(H_POL);
                 end if;
           end if;
         end process;

end Behavioral;
