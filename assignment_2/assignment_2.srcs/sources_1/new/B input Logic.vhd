----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2018 03:53:01 PM
-- Design Name: 
-- Module Name: B input Logic - Behavioral
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

entity B_input_Logic is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           selector : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end B_input_Logic;

architecture Behavioral of B_input_Logic is

begin
process ( input, selector)
		begin
		case  selector is
			when "00" => output <= "0000000000000000";
			when "01" => output <= input;
			when "10" => output <= not input;
			when "11" => output <= "1111111111111111";
			when others => output <= input;
		end case;
	end process;


end Behavioral;
