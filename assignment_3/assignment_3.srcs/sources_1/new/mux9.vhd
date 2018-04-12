----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2018 01:27:21
-- Design Name: 
-- Module Name: mux9 - Behavioral
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

entity mux9 is
Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           C : in STD_LOGIC_VECTOR(15 downto 0);
           D : in STD_LOGIC_VECTOR(15 downto 0);
           E : in STD_LOGIC_VECTOR(15 downto 0);
           F : in STD_LOGIC_VECTOR(15 downto 0);
           G : in STD_LOGIC_VECTOR(15 downto 0);
           H : in STD_LOGIC_VECTOR(15 downto 0); 
           I : in STD_LOGIC_VECTOR(15 downto 0);          
           S : in STD_LOGIC_VECTOR(3 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0));
end mux9;

architecture Behavioral of mux9 is

begin
    process ( A, B, C, D, E, F, G, H, I, S)
		begin
		case  S is
			when "0000" => Z <= A;
			when "0001" => Z <= B;
			when "0010" => Z <= C;
			when "0011" => Z <= D;
			when "0100" => Z <= E;
			when "0101" => Z <= F;
			when "0110" => Z <= G;
			when "0111" => Z <= H;
			when "1000" => Z <= I;
			when others => Z <= A;
		end case;
	end process;

end Behavioral;
