----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2018 03:29:15
-- Design Name: 
-- Module Name: InstructionRegister - Behavioral
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

entity InstructionRegister is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           load : in STD_LOGIC;
           DR : out STD_LOGIC_VECTOR (2 downto 0);
           SA : out STD_LOGIC_VECTOR (2 downto 0);
           SB : out STD_LOGIC_VECTOR (2 downto 0);
           OpCode : out STD_LOGIC_VECTOR (6 downto 0));
end InstructionRegister;

architecture Behavioral of InstructionRegister is

begin


end Behavioral;
