library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.rez.all;

entity button_manager is
    port(clk,mode,BTNM,BTNL,BTNR,BTND,BTNU: in std_logic;
    xval,yval: out natural);
end button_manager;

architecture Behavioral of button_manager is

signal xPos,yPos: natural:=0;

begin
        clk_buttons:process(clk)
		begin
		if (rising_edge(clk)) then
		        if BTNM='1' then
		          xPos<=0;
		          yPos<=0;
		        end if;
		        if MODE='0' then
		            if xPos>HD-400 then
		              xPos<=0;
		            end if;
		            
		            if yPos>VD-400 then
		              yPos<=0;
		            end if;
		            
		            if BTND='1' and (yPos<VD-400) then
                       yPos<=yPos+1;
                    end if;
                    
                    if BTNU='1' and yPos>0 then
                       yPos<=yPos-1;
                    end if;
                    
                    if BTNR='1' and (xPos<HD-400) then
                       xPos<=xPos+1;
                    end if;
                    
                    if BTNL='1' and xPos>0 then
                       xPos<=xPos-1;
                    end if;
		        else
		            if BTND='1' and (yPos<VD-40) then
                       yPos<=yPos+1;
                    end if;
                    
                    if BTNU='1' and yPos>0 then
                       yPos<=yPos-1;
                    end if;
                    
                    if BTNR='1' and (xPos<HD-40) then
                       xPos<=xPos+1;
                    end if;
                    
                    if BTNL='1' and xPos>0 then
                       xPos<=xPos-1;
                    end if;
		        end if;
       	end if;
		end process;
		xval<=xPos;
		yval<=yPos;
end Behavioral;
