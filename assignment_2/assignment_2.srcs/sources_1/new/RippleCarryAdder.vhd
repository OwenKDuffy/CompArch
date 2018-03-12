----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2018 11:38:26 AM
-- Design Name: 
-- Module Name: RippleCarryAdder - Behavioral
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

entity RippleCarryAdder is
    Port ( Aoperand : in STD_LOGIC_VECTOR (15 downto 0);
           Boperand : in STD_LOGIC_VECTOR (15 downto 0);
           CarryIn : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (15 downto 0);
           CarryOut : out STD_LOGIC
           );
end RippleCarryAdder;

architecture Behavioral of RippleCarryAdder is

component FullAdder 
   Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           CarryIn: in STD_LOGIC;
           Sum : out STD_LOGIC;
           CarryOut : out STD_LOGIC
           );
end component;

    signal carry0 : STD_LOGIC;
    signal carry1 : STD_LOGIC;
    signal carry2 : STD_LOGIC;
    signal carry3 : STD_LOGIC;
    signal carry4 : STD_LOGIC;
    signal carry5 : STD_LOGIC;
    signal carry6 : STD_LOGIC;
    signal carry7 : STD_LOGIC;
    signal carry8 : STD_LOGIC;
    signal carry9 : STD_LOGIC;
    signal carryA : STD_LOGIC;
    signal carryB : STD_LOGIC;
    signal carryC : STD_LOGIC;
    signal carryD : STD_LOGIC;
    signal carryE : STD_LOGIC;
    
begin

    FA0 : FullAdder port map (Aoperand(0), Boperand(0), CarryIn , Sum(0), carry0);
    FA1 : FullAdder port map (Aoperand(1), Boperand(1), carry0 , Sum(1), carry1);
    FA2 : FullAdder port map (Aoperand(2), Boperand(2), carry1 , Sum(2), carry2);
    FA3 : FullAdder port map (Aoperand(3), Boperand(3), carry2 , Sum(3), carry3);
    FA4 : FullAdder port map (Aoperand(4), Boperand(4), carry3 , Sum(4), carry4);
    FA5 : FullAdder port map (Aoperand(5), Boperand(5), carry4 , Sum(5), carry5);
    FA6 : FullAdder port map (Aoperand(6), Boperand(6), carry5 , Sum(6), carry6);
    FA7 : FullAdder port map (Aoperand(7), Boperand(7), carry6 , Sum(7), carry7);
    FA8 : FullAdder port map (Aoperand(8), Boperand(8), carry7 , Sum(8), carry8);
    FA9 : FullAdder port map (Aoperand(9), Boperand(9), carry8 , Sum(9), carry9);
    FAA : FullAdder port map (Aoperand(10), Boperand(10), carry9 , Sum(10), carryA);
    FAB : FullAdder port map (Aoperand(11), Boperand(11), carryA , Sum(11), carryB);
    FAC : FullAdder port map (Aoperand(12), Boperand(12), carryB , Sum(12), carryC);
    FAD : FullAdder port map (Aoperand(13), Boperand(13), carryC , Sum(13), carryD);
    FAE : FullAdder port map (Aoperand(14), Boperand(14), carryD , Sum(14), carryE);
    FAF : FullAdder port map (Aoperand(15), Boperand(15), carryE , Sum(15), carryOut);
end Behavioral;
