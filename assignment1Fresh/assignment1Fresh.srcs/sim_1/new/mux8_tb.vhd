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

entity mux8_tb is
--  Port ( );
end mux8_tb;

architecture Behavioral of mux8_tb is

component mux8 is
    Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           C : in STD_LOGIC_VECTOR(15 downto 0);
           D : in STD_LOGIC_VECTOR(15 downto 0);
           E : in STD_LOGIC_VECTOR(15 downto 0);
           F : in STD_LOGIC_VECTOR(15 downto 0);
           G : in STD_LOGIC_VECTOR(15 downto 0);
           H : in STD_LOGIC_VECTOR(15 downto 0);           
           S : in STD_LOGIC_VECTOR(2 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0));
end component;

signal A : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal B : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal C : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal D : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal E : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal F : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal G : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal H : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal S : STD_LOGIC_VECTOR(2 downto 0):= (others => '0');
signal Z : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
begin

uut : mux8 port map(A, B, C, D, E, F, G, H, S, Z);
stim_proc : process

    begin
        A <= "0101010101010101";
        B <= "1010101010101010";
        C <= "0011001100110011";
        D <= "1100110011001100";
        E <= "0000111100001111";
        F <= "1111000011110000";
        G <= "0000000011111111";
        H <= "1111111100000000";
        wait for 5ns;
        S <= "000";
        wait for 5ns;
        S <= "001";
        wait for 5ns;
        S <= "010";
        wait for 5ns;
        S <= "011";
        wait for 5ns;
        S <= "100";
        wait for 5ns;
        S <= "101";
        wait for 5ns;
        S <= "110";
        wait for 5ns;
        S <= "111";
        wait for 5ns;
        
    end process;      

end Behavioral;
