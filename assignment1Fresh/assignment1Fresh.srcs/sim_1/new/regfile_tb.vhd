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
    Port ( src : in STD_LOGIC_VECTOR(2 downto 0);
           dst : in STD_LOGIC_VECTOR(2 downto 0); 
           clock : in STD_LOGIC;
           dataSrc : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR(15 downto 0);
           reg_out_0 : out STD_LOGIC_VECTOR(15 downto 0);
           reg_out_1 : out STD_LOGIC_VECTOR(15 downto 0);
           reg_out_2 : out STD_LOGIC_VECTOR(15 downto 0);
           reg_out_3 : out STD_LOGIC_VECTOR(15 downto 0);
           reg_out_4 : out STD_LOGIC_VECTOR(15 downto 0);
           reg_out_5 : out STD_LOGIC_VECTOR(15 downto 0);
           reg_out_6 : out STD_LOGIC_VECTOR(15 downto 0);
           reg_out_7 : out STD_LOGIC_VECTOR(15 downto 0)
           );
end component;

signal src, dst : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal clock, dataSrc : STD_LOGIC := '0';
signal data, ro0, ro1, ro2, ro3, ro4, ro5, ro6, ro7 : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";

constant clockperiod : time := 2ns;

begin

uut : regfile port map(src, dst, clock, dataSrc, data, ro0, ro1, ro2, ro3, ro4, ro5, ro6, ro7);
clk_proc: process
    begin
        clock <= not clock;
        wait for clockperiod/2;
    end process;
    
    stim_proc : process
        begin
            --setarbitrary defaults
            src <= "000";
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
