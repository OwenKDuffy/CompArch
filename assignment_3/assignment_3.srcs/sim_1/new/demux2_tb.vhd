----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2018 00:46:36
-- Design Name: 
-- Module Name: demux2_tb - Behavioral
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

entity demux2_tb is
--  Port ( );
end demux2_tb;

architecture Behavioral of demux2_tb is
component demux2 
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           outputA : out STD_LOGIC_VECTOR (15 downto 0);
           outputB : out STD_LOGIC_VECTOR (15 downto 0));
end component;
signal input, A, B: STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
signal sel : STD_LOGIC := '0';
begin
uut: demux2 port map(input, sel, A, B);
stim_proc : process
begin
    input <= "1111111111111111";
    sel <= '0';
    wait for 15ns;
    sel <= '1';
    wait for 15ns;
end process;

end Behavioral;
