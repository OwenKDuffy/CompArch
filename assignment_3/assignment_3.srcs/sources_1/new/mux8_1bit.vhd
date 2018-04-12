----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2018 02:48:29
-- Design Name: 
-- Module Name: mux8_1bit - Behavioral
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

entity mux8_1bit is
Port (     A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           E : in STD_LOGIC;
           F : in STD_LOGIC;
           G : in STD_LOGIC;
           H : in STD_LOGIC;           
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Z : out STD_LOGIC
           );
end mux8_1bit;

architecture Behavioral of mux8_1bit is

begin
    process ( A, B, C, D, E, F, G, H, S)
		begin
		case  S is
			when "000" => Z <= A;
			when "001" => Z <= B;
			when "010" => Z <= C;
			when "011" => Z <= D;
			when "100" => Z <= E;
			when "101" => Z <= F;
			when "110" => Z <= G;
			when "111" => Z <= H;
			when others => Z <= A;
		end case;
	end process;



end Behavioral;
