----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 11:53:33 AM
-- Design Name: 
-- Module Name: reg16_tb - Behavioral
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

entity reg16_tb is
--  Port ( );
end reg16_tb;

architecture Behavioral of reg16_tb is
component reg16
        Port(
            load: in STD_LOGIC;
            D : in STD_LOGIC_VECTOR(15 downto 0);
            clk : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (15 downto 0)
--            directOut : out STD_LOGIC_VECTOR (15 downto 0)
            );
end component;

signal load : STD_LOGIC := '0';
signal data : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal clock : STD_LOGIC := '0';
signal dataOut : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

constant clockperiod : time := 2ns;

Begin

uut : reg16 port map(load, data, clock, dataOut);
clk_proc: process
    begin
        clock <= not clock;
        wait for clockperiod/2;
    end process;
stim_proc : process
    begin
--        dst <= "001";
        load <= '1';
        data <= "0101010101010101";
        wait for 15ns;
        load <= '0';
        wait for 15ns;
    end process;        

end behavioral;