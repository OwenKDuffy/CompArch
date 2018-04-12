----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2018 01:20:01
-- Design Name: 
-- Module Name: decoder4to9 - Behavioral
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

entity decoder4to9 is
    Port ( sel : in STD_LOGIC_VECTOR (3 downto 0);
           z0 : out STD_LOGIC;
           z1 : out STD_LOGIC;
           z2 : out STD_LOGIC;
           z3 : out STD_LOGIC;
           z4 : out STD_LOGIC;
           z5 : out STD_LOGIC;
           z6 : out STD_LOGIC;
           z7 : out STD_LOGIC;
           z8 : out STD_LOGIC
           );
end decoder4to9;

architecture Behavioral of decoder4to9 is

begin
           z0 <= '1' when sel = "0000" else '0' after 5ns;
           z1 <= '1' when sel = "0001" else '0' after 5ns;
           z2 <= '1' when sel = "0010" else '0' after 5ns;
           z3 <= '1' when sel = "0011" else '0' after 5ns;
           z4 <= '1' when sel = "0100" else '0' after 5ns;
           z5 <= '1' when sel = "0101" else '0' after 5ns;
           z6 <= '1' when sel = "0110" else '0' after 5ns;
           z7 <= '1' when sel = "0111" else '0' after 5ns;
           z8 <= '1' when sel = "1000" else '0' after 5ns;

end Behavioral;
