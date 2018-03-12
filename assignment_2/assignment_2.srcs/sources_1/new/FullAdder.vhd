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

entity FullAdder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           CarryIn: in STD_LOGIC;
           Sum : out STD_LOGIC;
           CarryOut : out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is

begin

   Sum <= (A xor B) xor CarryIn;
   CarryOut <= (A and B) or ((A xor B) and CarryIn);
   


end Behavioral;
