library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.rez.all;

entity vertical_sync is
    port(clk: in std_logic;
    vPos:in natural;
    VS:out std_logic);
end vertical_sync;

architecture Behavioral of vertical_sync is

begin

         vertical_sync:process (clk)
         begin
           if (rising_edge(clk)) then
                 if (vPos >= (VFP + VD - 1)) and (vPos < (VFP + VD + VSP - 1)) then
                    VS <= V_POL;
                 else
                    VS <= not(V_POL);
                 end if;
           end if; 
        end process;
end Behavioral;
