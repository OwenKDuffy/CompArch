----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 12:39:45 PM
-- Design Name: 
-- Module Name: ZeroDetect - Behavioral
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

entity ZeroDetect is
    Port ( number : in STD_LOGIC_VECTOR(15 downto 0);
           Zero_flag : out STD_LOGIC);
end ZeroDetect;

architecture Behavioral of ZeroDetect is

begin
    process (number)
		begin
		case number is
			when "0000000000000000" => Zero_flag <= '1';
			when others => Zero_flag <= '0';
		end case;
	end process;


end Behavioral;
