----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2018 12:49:59 PM
-- Design Name: 
-- Module Name: B_Logic_tb - Behavioral
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

entity shifter_tb is
--  Port ( );
end shifter_tb;

architecture Behavioral of shifter_tb is
component Shifter 
  Port ( Hselect : in STD_LOGIC_VECTOR(1 downto 0);
         input : in STD_LOGIC_VECTOR(15 downto 0);
         h_out : out STD_LOGIC_VECTOR(15 downto 0)
         );
 end component;
 
 signal H : STD_LOGIC_VECTOR(1 downto 0) := "00";
 signal input : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
 signal output : STD_LOGIC_VECTOR(15 downto 0);

begin
uut : Shifter port map(H, input, output);
stim_proc : process
    begin
    input <= "0000001111000000";
    H <= "00";
    wait for 15ns;
    H <= "01";
    wait for 15ns;
    H <= "10";
    wait for 15ns;
    end process;


end Behavioral;
