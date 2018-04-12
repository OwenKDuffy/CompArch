----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2018 00:58:49
-- Design Name: 
-- Module Name: decoder1to2 - Behavioral
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

entity decoder1to2 is
    Port ( input : in STD_LOGIC;
           outputA : out STD_LOGIC;
           outputB : out STD_LOGIC
           );
end decoder1to2;

architecture Behavioral of decoder1to2 is

begin
        outputA <= (not input) after 1ns;
	    outputB <= input after 1ns;

end Behavioral;
