----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2018 11:51:57 AM
-- Design Name: 
-- Module Name: RCA_tb - Behavioral
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

entity RCA_tb is
--  Port ( );
end RCA_tb;

architecture Behavioral of RCA_tb is

component RippleCarryAdder 
Port ( Aoperand : in STD_LOGIC_VECTOR (15 downto 0);
       Boperand : in STD_LOGIC_VECTOR (15 downto 0);
       CarryIn : in STD_LOGIC;
       Sum : out STD_LOGIC_VECTOR (15 downto 0);
       CarryOut : out STD_LOGIC
       );
end component;

--inputs
signal A, B : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
signal C : STD_LOGIC := '0';
--outputs
signal Z : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
signal Co : STD_LOGIC;
begin
uut : RippleCarryAdder port map(A, B, C, Z, Co);
stim_proc : process
    begin
        A <= "0000000000000001";
        B <= "0000000000000001";
        wait for 15ns;
        C <= '1';
        wait for 15ns;
        A <= "1111111111111111";
        C <= '0';
        wait for 15ns;
    end process;
    

end Behavioral;
