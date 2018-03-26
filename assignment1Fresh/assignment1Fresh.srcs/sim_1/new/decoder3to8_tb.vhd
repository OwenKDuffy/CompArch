----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 11:59:47 AM
-- Design Name: 
-- Module Name: decoder3to8_tb - Behavioral
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

entity decoder3to8_tb is
--  Port ( );
end decoder3to8_tb;

architecture Behavioral of decoder3to8_tb is

component decoder3to8 
	Port(
			x0, x1, x2 : in STD_LOGIC;
			z0, z1, z2, z3, z4, z5, z6, z7 : out STD_LOGIC
		);
end component;

signal s : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal a, b, c, d, e, f, g, h : STD_LOGIC;
begin

uut: decoder3to8 port map (s(2), s(1), s(0), a, b, c, d, e, f, g, h);
stim_proc : process

    begin
        wait for 15ns;
        S <= "000";
        wait for 15ns;
        S <= "001";
        wait for 15ns;
        S <= "010";
        wait for 15ns;
        S <= "011";
        wait for 15ns;
        S <= "100";
        wait for 15ns;
        S <= "101";
        wait for 15ns;
        S <= "110";
        wait for 15ns;
        S <= "111";
        
end process; 

end Behavioral;
