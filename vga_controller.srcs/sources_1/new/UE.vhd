library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.rez.all;

entity UE is
    port(clk_100,btnm,btnl,btnr,btnd,btnu:in std_logic;
    vPos,hPos: out natural;
    btnmc,btnlc,btnrc,btndc,btnuc: out std_logic;
    clkb,clk: out std_logic);
end UE;

architecture structurala of UE is

component horizontal_counter is
    port(clk:in std_logic;
    hPos: out natural);
end component;

component vertical_counter is
    port(clk:in std_logic;
    hPos:in natural;
    vPos: out natural);
end component;

component clk_mul is
    port(clk_in1 : in std_logic;
         clk_out1 : out std_logic);
end component;

component debouncer is
    port(CLK: in STD_LOGIC;
         BTN: in STD_LOGIC;
         BTN_NOU: out STD_LOGIC);
end component;
component clk_divider is   
	port(clk100:in std_logic;
	clk1:out std_logic);
end component;

signal clkc:std_logic;
signal clkbutton: std_logic;
signal hPosc,vPosc:natural:=0;

begin

        clk_butons:clk_divider port map(CLK_100,clkbutton);
        clk_modifier : clk_mul port map(CLK_100,clkc);
        debu:debouncer port map(clkc,btnu,btnuc);
        debd:debouncer port map(clkc,btnd,btndc);
        debl:debouncer port map(clkc,btnl,btnlc);
        debr:debouncer port map(clkc,btnr,btnrc);
        debm:debouncer port map(clkc,btnm,btnmc);
        horizontal:horizontal_counter port map(clkc,hPosc);
        vertical:vertical_counter port map(clkc,hPosc,vPosc);
        
        hPos<=hPosc;
        vPos<=vPosc;
        clkb<=clkbutton;
        clk<=clkc;
        

end structurala;
