----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 12:39:45 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( inA : in STD_LOGIC_VECTOR(15 downto 0);
           inB : in STD_LOGIC_VECTOR(15 downto 0);
           Gselect : in STD_LOGIC_VECTOR(3 downto 0);
           oVerflow : out STD_LOGIC;
           Carry : out STD_LOGIC;
           G : out STD_LOGIC_VECTOR(15 downto 0)
           );
end ALU;

architecture Behavioral of ALU is

component LogicUnit16bit 
    Port ( inputA : in STD_LOGIC_VECTOR (15 downto 0);
           inputB : in STD_LOGIC_VECTOR (15 downto 0);
           selection : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0)
           );
end component;

component ArithmeticUnit16bit
    port(
            inA : in STD_LOGIC_VECTOR(15 downto 0);
            inB : in STD_LOGIC_VECTOR(15 downto 0);
            selector : in STD_LOGIC_VECTOR(1 downto 0);
            output : out STD_LOGIC_VECTOR(15 downto 0);
            carryOut: out STD_LOGIC
    );
end component;
        

component mux2_16bit
    Port ( A0 : in STD_LOGIC_VECTOR(15 downto 0);
              A1 : in STD_LOGIC_VECTOR(15 downto 0);
              S0 : in STD_LOGIC;
              Z : out STD_LOGIC_VECTOR(15 downto 0));
end component;

    signal lToMx :STD_LOGIC_VECTOR(15 downto 0);
    signal aToMx :STD_LOGIC_VECTOR(15 downto 0);
    signal candV : STD_LOGIC;
begin
    
    lu : LogicUnit16bit port map(inA, inB, Gselect(2 downto 1), lToMx);
    au : ArithmeticUnit16bit port map(inA, inB, Gselect(2 downto 1), aToMx, candv);
    mx : mux2_16bit port map( aToMx, lToMx, Gselect(3), G);
    oVerflow <= candV;
    Carry <= candV;

end Behavioral;
