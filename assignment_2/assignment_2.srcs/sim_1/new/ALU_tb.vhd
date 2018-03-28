----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2018 20:46:09
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

entity ALU_tb is
--  Port ( );
end ALU_tb;

architecture Behavioral of ALU_tb is
component  ALU 
   Port ( inA : in STD_LOGIC_VECTOR(15 downto 0);
          inB : in STD_LOGIC_VECTOR(15 downto 0);
          Gselect : in STD_LOGIC_VECTOR(3 downto 0);
          oVerflow : out STD_LOGIC;
          Carry : out STD_LOGIC;
          G : out STD_LOGIC_VECTOR(15 downto 0)
          );
end component;

signal A, B : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
signal selector : STD_LOGIC_VECTOR(3 downto 0) := "0000";

signal V, C : STD_LOGIC;
signal G : STD_LOGIC_VECTOR(15 downto 0);
begin
uut : ALU port map (A, B, selector, V, C, G);
stim_proc : process
    begin
        A <= "0000000000000001";
        B <= "0000000000000001";
        selector <= "0010";
        wait for 15ns;
    end process;


end Behavioral;
