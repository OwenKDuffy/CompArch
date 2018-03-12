----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2018 11:16:53 AM
-- Design Name: 
-- Module Name: decoder_2to4 - Behavioral
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

entity decoder_2to4 is
    Port ( E : in STD_LOGIC;
           A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC);
end decoder_2to4;

architecture structural_1 of decoder_2to4 is



begin
    Q0 <= NOT (E AND (NOT A0) AND (NOT A1));
    Q1 <= NOT (E AND A0 AND (NOT A1));
    Q2 <= NOT (E AND (NOT A0) AND A1);
    Q3 <= NOT (E AND A0 AND A1);

end structural_1;
