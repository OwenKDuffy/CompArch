----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 01:12:04 PM
-- Design Name: 
-- Module Name: ArithmeticUnit16bit - Behavioral
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

entity ArithmeticUnit16bit is
Port (inA : in STD_LOGIC_VECTOR(15 downto 0);
            inB : in STD_LOGIC_VECTOR(15 downto 0);
            selector : in STD_LOGIC_VECTOR(1 downto 0);
            output : out STD_LOGIC_VECTOR(15 downto 0);
            carryOut :out STD_LOGIC
     );
end ArithmeticUnit16bit;

architecture Behavioral of ArithmeticUnit16bit is

component RippleCarryAdder 
Port ( Aoperand : in STD_LOGIC_VECTOR (15 downto 0);
       Boperand : in STD_LOGIC_VECTOR (15 downto 0);
       CarryIn : in STD_LOGIC;
       Sum : out STD_LOGIC_VECTOR (15 downto 0);
       CarryOut : out STD_LOGIC
       );
end component;

component B_input_Logic 
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           selector : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0)
           );
end component;
    signal signalB: STD_LOGIC_VECTOR(15 downto 0);
    
begin
    
    bLogic : B_input_Logic port map (inB, selector, signalB);
    RCA : RippleCarryAdder port map (inA, signalB,selector(0), output, carryOut);
    
    
end Behavioral;
