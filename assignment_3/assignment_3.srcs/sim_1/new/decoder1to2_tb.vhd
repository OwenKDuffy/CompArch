----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2018 01:00:54
-- Design Name: 
-- Module Name: decoder1to2_tb - Behavioral
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

entity decoder1to2_tb is
--  Port ( );
end decoder1to2_tb;

architecture Behavioral of decoder1to2_tb is
component decoder1to2 is
    Port ( input : in STD_LOGIC;
           outputA : out STD_LOGIC;
           outputB : out STD_LOGIC
           );
end component;

signal i, a, b : STD_LOGIC := '0';
begin
uut : decoder1to2 port map (i, a, b);
stim_proc : process
begin
    i <= '0';
    wait for 15ns;
    i <= '1';
    wait for 15ns;
end process;

end Behavioral;
