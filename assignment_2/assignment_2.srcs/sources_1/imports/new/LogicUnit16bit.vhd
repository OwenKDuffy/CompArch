----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 01:12:04 PM
-- Design Name: 
-- Module Name: LogicUnit16bit - Behavioral
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

entity LogicUnit16bit is
    Port ( inputA : in STD_LOGIC_VECTOR (15 downto 0);
           inputB : in STD_LOGIC_VECTOR (15 downto 0);
           selection : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end LogicUnit16bit;


architecture Behavioral of LogicUnit16bit is

component LogicUnitSlice 
    Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           Z : out STD_LOGIC
           );
end component;
begin
    A : LogicUnitSlice port map(selection, inputA(15), inputB(15), output(15));
    B : LogicUnitSlice port map(selection, inputA(14), inputB(14), output(14));
    C : LogicUnitSlice port map(selection, inputA(13), inputB(13), output(13));
    D : LogicUnitSlice port map(selection, inputA(12), inputB(12), output(12));
    E : LogicUnitSlice port map(selection, inputA(11), inputB(11), output(11));
    F : LogicUnitSlice port map(selection, inputA(10), inputB(10), output(10));
    G : LogicUnitSlice port map(selection, inputA(9), inputB(9), output(9));
    H : LogicUnitSlice port map(selection, inputA(8), inputB(8), output(8));
    I : LogicUnitSlice port map(selection, inputA(7), inputB(7), output(7));
    J : LogicUnitSlice port map(selection, inputA(6), inputB(6), output(6));
    K : LogicUnitSlice port map(selection, inputA(5), inputB(5), output(5));
    L : LogicUnitSlice port map(selection, inputA(4), inputB(4), output(4));
    M : LogicUnitSlice port map(selection, inputA(3), inputB(3), output(3));
    N : LogicUnitSlice port map(selection, inputA(2), inputB(2), output(2));
    O : LogicUnitSlice port map(selection, inputA(1), inputB(1), output(1));
    P : LogicUnitSlice port map(selection, inputA(0), inputB(0), output(0));

end Behavioral;
