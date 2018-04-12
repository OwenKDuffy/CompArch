----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2018 00:44:20
-- Design Name: 
-- Module Name: demux2 - Behavioral
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

entity demux2 is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           outputA : out STD_LOGIC_VECTOR (15 downto 0);
           outputB : out STD_LOGIC_VECTOR (15 downto 0));
end demux2;

architecture Behavioral of demux2 is

begin
process ( input, sel)
		begin
		if (sel = '0') then
		outputA <= input;
		
		elsif (sel = '1') then
		outputB <= input;
		end if;
	end process;

end Behavioral;
