----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2018 22:16:09
-- Design Name: 
-- Module Name: au_tb - Behavioral
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

entity au_tb is
--  Port ( );
end au_tb;

architecture Behavioral of au_tb is
component ArithmeticUnit16bit
    port(
            inA : in STD_LOGIC_VECTOR(15 downto 0);
            inB : in STD_LOGIC_VECTOR(15 downto 0);
            selector : in STD_LOGIC_VECTOR(2 downto 0);
            output : out STD_LOGIC_VECTOR(15 downto 0);
            carryOut: out STD_LOGIC
    );
end component;
signal A, B : STD_LOGIC_VECTOR (15 downto 0);
signal selection : STD_LOGIC_VECTOR(2 downto 0);
signal Z : STD_LOGIC_VECTOR(15 downto 0);
signal c : STD_LOGIC;
begin
uut : ArithmeticUnit16bit port map (A, B, selection, Z, c);
stim_proc : process
    begin
        A <= "0000000000000001";
        B <= "0000000000000001";
        -- A
        selection <= "000";
        wait for 15ns;
        -- A++
        selection <= "001";
        wait for 15ns;
        -- A + B
        selection <= "010";
        wait for 15ns;
        -- A + B + C = ?
        selection <= "011";
        wait for 15ns;
        -- A + B'
        selection <= "100";
        wait for 15ns;
        -- A - B
        selection <= "101";
        wait for 15ns;
        -- A--
        selection <= "110";
        wait for 15ns;
        -- A
        selection <= "111";
        wait for 15ns;
    end process;

end Behavioral;
