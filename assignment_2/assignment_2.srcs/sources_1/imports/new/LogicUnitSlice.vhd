----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 01:31:33 PM
-- Design Name: 
-- Module Name: LogicUnitSlice - Behavioral
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

entity LogicUnitSlice is
    Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           Z : out STD_LOGIC);
end LogicUnitSlice;

architecture Behavioral of LogicUnitSlice is

component mux4_1bit
        Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (1 downto 0);
           Z : out STD_LOGIC);
end component;
    signal andGate : STD_LOGIC;
    signal orGate : STD_LOGIC;
    signal xorGate : STD_LOGIC;
    signal notGate : STD_LOGIC;
begin
    andGate <= A and B;
    orGate <= A or B;
    xorGate <= A xor B;
    notGate <= not A;
    
    mx : mux4_1bit port map(andGate, orGate , xorGate, notGate , S, Z);
end Behavioral;
