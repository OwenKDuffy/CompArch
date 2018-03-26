----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 11:32:39 AM
-- Design Name: 
-- Module Name: mux2_tb - Behavioral
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

entity mux2_tb is
--  Port ( );
end mux2_tb;

architecture Behavioral of mux2_tb is

component mux2 
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal A : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal B : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal S : STD_LOGIC := '0';
signal Z : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
begin

uut : mux2 port map(A, B, S, Z);
stim_proc : process

    begin
        A <= "0101010101010101";
        B <= "1010101010101010";
        wait for 10ns;
        S <= '0';
        wait for 5ns;
        S <= '1';
        wait for 5ns;
    end process;      

end Behavioral;
