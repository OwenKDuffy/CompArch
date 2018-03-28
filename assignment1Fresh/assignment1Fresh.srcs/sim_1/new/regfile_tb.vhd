----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 04:16:46 PM
-- Design Name: 
-- Module Name: regfile_tb - Behavioral
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

entity regfile_tb is
--  Port ( );
end regfile_tb;

architecture Behavioral of regfile_tb is

component regfile 
 Port (    write : in STD_LOGIC;
           dst : in STD_LOGIC_VECTOR(2 downto 0); 
           Asrc : in STD_LOGIC_VECTOR(2 downto 0);
           Bsrc : in STD_LOGIC_VECTOR(2 downto 0);
           clock : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR(15 downto 0);
           Adata : out STD_LOGIC_VECTOR(15 downto 0);
           Bdata : out STD_LOGIC_VECTOR(15 downto 0)    
           );
end component;

signal Asrc, Bsrc, dst : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal RW, clock, dataSrc : STD_LOGIC := '0';
signal data, Aout, Bout: STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";

constant clockperiod : time := 2ns;

begin

uut : regfile port map(RW, dst, Asrc, Bsrc, clock, data, Aout, Bout);
clk_proc: process
    begin
        clock <= not clock;
        wait for clockperiod/2;
    end process;
    
    stim_proc : process
        begin
            --setarbitrary defaults
            Asrc <= "000";
            --load into r1
            dst <= "000";
            dataSrc <= '0';
            data <= "0101010101010101";
            wait for 15ns;
            dst <= "010";
            dataSrc <= '1';
            wait for 15ns;
            dataSrc <= '0';
            dst <= "001";
            data <= "1010101010101010";
            wait for 15ns;
--            dst <= "UUU";
--            wait for 30 ns;
            dataSrc <= '1';
--            src <= "000";
--            dst <= "010";
        end process;        
end Behavioral;
