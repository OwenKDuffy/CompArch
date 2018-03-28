----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 12:39:45 PM
-- Design Name: 
-- Module Name: Shifter - Behavioral
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

entity Shifter is
Port (   Hselect : in STD_LOGIC_VECTOR(1 downto 0);
         input : in STD_LOGIC_VECTOR(15 downto 0);
         h_out : out STD_LOGIC_VECTOR(15 downto 0)
         );
end Shifter;

architecture Behavioral of Shifter is

component mux4_1bit
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;           
           S : in STD_LOGIC_VECTOR(1 downto 0);
           Z : out STD_LOGIC);
end component;
begin
m00 : mux4_1bit port map(input(0), '0', input(1), 'U', Hselect, h_out(0));
m01 : mux4_1bit port map(input(1), input(0), input(2), 'U', Hselect, h_out(1));
m02 : mux4_1bit port map(input(2), input(1), input(3), 'U', Hselect, h_out(2));
m03 : mux4_1bit port map(input(3), input(2), input(4), 'U', Hselect, h_out(3));
m04 : mux4_1bit port map(input(4), input(3), input(5), 'U', Hselect, h_out(4));
m05 : mux4_1bit port map(input(5), input(4), input(6), 'U', Hselect, h_out(5));
m06 : mux4_1bit port map(input(6), input(5), input(7), 'U', Hselect, h_out(6));
m07 : mux4_1bit port map(input(7), input(6), input(8), 'U', Hselect, h_out(7));
m08 : mux4_1bit port map(input(8), input(7), input(9), 'U', Hselect, h_out(8));
m09 : mux4_1bit port map(input(9), input(8), input(10), 'U', Hselect, h_out(9));
m10 : mux4_1bit port map(input(10), input(9), input(11), 'U', Hselect, h_out(10));
m11 : mux4_1bit port map(input(11), input(10), input(12), 'U', Hselect, h_out(11));
m12 : mux4_1bit port map(input(12), input(11), input(13), 'U', Hselect, h_out(12));
m13 : mux4_1bit port map(input(13), input(12), input(14), 'U', Hselect, h_out(13));
m14 : mux4_1bit port map(input(14), input(13), input(15), 'U', Hselect, h_out(14));
m15 : mux4_1bit port map(input(15), input(14), '0', 'U', Hselect, h_out(15));

end Behavioral;
