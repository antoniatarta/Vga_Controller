library IEEE;
use IEEE.std_logic_1164.all;
package rez is 
constant HD : natural := 1280;
constant VD : natural := 1024;

constant HFP : natural := 48; --H front porch width (pixels)
constant HSP : natural := 112; --H sync pulse width (pixels)
constant HMAX : natural := 1688; --H total period (pixels)

constant VFP : natural := 1; --V front porch width (lines)
constant VSP : natural := 3; --V sync pulse width (lines)
constant VMAX : natural := 1066; --V total period (lines)

constant H_POL : std_logic := '1';
constant V_POL : std_logic := '1';
end package rez;
