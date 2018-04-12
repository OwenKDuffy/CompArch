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

entity entirety_tb is
--  Port ( );
end entirety_tb;

architecture Behavioral of entirety_tb is
    component entirety 
        Port (
           dst : in STD_LOGIC_VECTOR(2 downto 0); 
           selectA : in STD_LOGIC_VECTOR(2 downto 0);
           selectB : in STD_LOGIC_VECTOR(2 downto 0);
           mBSelect : in STD_LOGIC;
           fs : in STD_LOGIC_VECTOR(4 downto 0);
           mDSelect : in STD_LOGIC;
           RW : in STD_LOGIC;
--           src : in STD_LOGIC_VECTOR(2 downto 0);
           clock : in STD_LOGIC;
--           dataSrc : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR(15 downto 0);
           constant_In : in STD_LOGIC_VECTOR(15 downto 0);
           AddressOut : out STD_LOGIC_VECTOR(15 downto 0);
           DataOut : out STD_LOGIC_VECTOR(15 downto 0);
           v : out STD_LOGIC; 
           c: out STD_LOGIC; 
           n: out STD_LOGIC; 
           z : out STD_LOGIC
     );
     end component;
     
     signal clock : STD_LOGIC := '0';
     signal ControlWord : STD_LOGIC_VECTOR(16 downto 0) := "00000000000000000";
     signal dataIn, constantIn, AdrOut, DataOut : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";   
     signal v, c, n, z : STD_LOGIC := '0';
     
     constant clockperiod : time := 2ns;

begin
    uut : entirety port map(ControlWord(16 downto 14), 
                            ControlWord(13 downto 11), 
                            ControlWord(10 downto 8),
                            ControlWord(7),
                            ControlWord(6 downto 2),
                            ControlWord(1),
                            ControlWord(0),
                            clock,
                            dataIn,
                            constantIn,
                            AdrOut,
                            DataOut,
                            v, c, n, z);
                             
    clk_proc: process
        begin
            clock <= not clock;
            wait for clockperiod/2;
        end process;
           
    stim_proc : process
        begin
            ControlWord <= "00000000000000011"; -- ldr r0, dataIn
            DataIn <= "0000000000001000"; --dataIn = 8
            wait for 15ns;
            ControlWord <= "00000000000000011"; -- ldr r0, dataIn
            DataIn <= "0000000000001000"; --dataIn = 8
        end process;

end Behavioral;
