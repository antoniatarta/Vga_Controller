library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;
use ieee.math_real.all;

library work;
use work.rez.all;

entity vga_controller is 
	Port ( CLK_100 : in STD_LOGIC;
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
end vga_controller;

architecture Behavioral of vga_controller is


component UE is
    port(clk_100,btnm,btnl,btnr,btnd,btnu:in std_logic;
    vPos,hPos: out natural;
    btnmc,btnlc,btnrc,btndc,btnuc: out std_logic;
    clkb,clk: out std_logic);
end component;

component UC is
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
end component;

signal hPos : natural := 0;
signal vPos : natural := 0;


signal clk: std_logic:='0';
signal clkb: std_logic;

signal BTNUC: std_logic:='0';
signal BTNDC: std_logic:='0';
signal BTNLC: std_logic:='0';
signal BTNRC: std_logic:='0';
signal BTNMC: std_logic:='0';

signal xPos : natural:=0;
signal yPos : natural:=0;

begin   
		ueee:ue port map(clk_100,BTNM,BTNL,BTNR,BTND,BTNU,vPos,hPos,BTNMC,BTNLC,BTNRC,BTNDC,BTNUC,clkb,clk);
		uccc:uc port map(clk,clkb,hPos,vPos,btnuc,btndc,btnlc,btnrc,btnmc,image,mode,vga_red_i,vga_blue_i,vga_green_i,vga_hs_o,vga_vs_o,vga_red_o,vga_blue_o,vga_green_o);
end architecture;