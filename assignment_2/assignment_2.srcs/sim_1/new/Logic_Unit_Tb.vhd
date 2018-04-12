----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2018 12:51:54 PM
-- Design Name: 
-- Module Name: Logic_Unit_Tb - Behavioral
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

entity Logic_Unit_Tb is
--  Port ( );
end Logic_Unit_Tb;

architecture Behavioral of Logic_Unit_Tb is

component LogicUnit16bit 
    Port ( inputA : in STD_LOGIC_VECTOR (15 downto 0);
           inputB : in STD_LOGIC_VECTOR (15 downto 0);
           selection : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0)
           );
end component;
signal A, B : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
signal sel : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal Z : STD_LOGIC_VECTOR(15 downto 0);

begin
uut : LogicUnit16bit port map (A, B, sel, Z);
stim_proc : process
begin
    A <= "1111111111111111";
    B <= "0000000000000000";
    sel <= "00";
    wait for 15ns;
    sel <= "01";
    wait for 15ns;
    sel <= "10";
    wait for 15ns;
    sel <= "11";
    wait for 15ns;
    A <= "1111111111111111";
    B <= "1111111111111111";
    sel <= "00";
    wait for 15ns;
    sel <= "01";
    wait for 15ns;
    sel <= "10";
    wait for 15ns;
    sel <= "11";
    wait for 15ns;
end process;
end Behavioral;
