library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.rez.all;

entity UC is
    port ( CLK : in STD_LOGIC;
           clkb: in std_logic;
           hPos:in natural;
           vPos:in natural;
	       BTNU: in STD_LOGIC;
	       BTND: in STD_LOGIC;
	       BTNL: in STD_LOGIC;
	       BTNR: in STD_LOGIC;
	       BTNM: in STD_LOGIC;
	       IMAGE: in STD_LOGIC_VECTOR(1 downto 0);
	       MODE: in STD_LOGIC;
	       VGA_RED_I : in STD_LOGIC_VECTOR (3 downto 0);
 		   VGA_BLUE_I : in STD_LOGIC_VECTOR (3 downto 0);
 		   VGA_GREEN_I : in STD_LOGIC_VECTOR (3 downto 0);
		   VGA_HS_O : out STD_LOGIC;
 	 	   VGA_VS_O : out STD_LOGIC;
 		   VGA_RED_O : out STD_LOGIC_VECTOR (3 downto 0);
 		   VGA_BLUE_O : out STD_LOGIC_VECTOR (3 downto 0);
 		   VGA_GREEN_O : out STD_LOGIC_VECTOR (3 downto 0));
end UC;

architecture Behavioral of UC is

component horizontal_sync is
    port(clk: in std_logic;
    hPos: in natural;
    HS: out std_logic);
end component;

component vertical_sync is
    port(clk: in std_logic;
    vPos:in natural;
    VS:out std_logic);
end component;

component button_manager is
    port(clk,mode,btnm,btnl,btnr,btnd,btnu: in std_logic;
    xval,yval: out natural);
end component;

component AfisareImagine is
    port ( CLK:in std_logic;
           vPos: in natural;
           hPos: in natural;
           xPos: in natural;
           yPos: in natural;
	       IMAGE: in STD_LOGIC_VECTOR(1 downto 0);
	       MODE: in STD_LOGIC;
	       VGA_RED_I : in STD_LOGIC_VECTOR (3 downto 0);
 		   VGA_BLUE_I : in STD_LOGIC_VECTOR (3 downto 0);
 		   VGA_GREEN_I : in STD_LOGIC_VECTOR (3 downto 0);
 		   VGA_RED_O : out STD_LOGIC_VECTOR (3 downto 0);
 		   VGA_BLUE_O : out STD_LOGIC_VECTOR (3 downto 0);
 		   VGA_GREEN_O : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal xPos,yPos: natural;
begin
    hs:horizontal_sync port map(clk,hPos,VGA_HS_O);
    vs:vertical_sync port map(clk,vPos,VGA_VS_O);
    bm: button_manager port map(clkb,mode,btnm,btnl,btnr,btnd,btnu,xPos,yPos);
    ai:AfisareImagine port map(clk,vPos,hPos,xPos,yPos,image,mode,vga_red_i,vga_blue_i,vga_green_i,vga_red_o,vga_blue_o,vga_green_o);

end Behavioral;
