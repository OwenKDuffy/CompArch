----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 03:48:58 PM
-- Design Name: 
-- Module Name: mux2_16bit - Behavioral
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

entity mux2_16bit is
    Port ( A0 : in STD_LOGIC_VECTOR(15 downto 0);
           A1 : in STD_LOGIC_VECTOR(15 downto 0);
           S0 : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR(15 downto 0));
end mux2_16bit;

architecture Behavioral of mux2_16bit is

begin
process ( A0, A1, S0)
		begin
		case  S0 is
			when '0' => z <= A0;
			when '1' => z <= A1;
			when others => z <= A0;
		end case;
	end process;


end Behavioral;
