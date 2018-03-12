----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 12:39:45 PM
-- Design Name: 
-- Module Name: Shifter - Behavioral
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

entity Shifter is
Port ( Hselect : in STD_LOGIC_VECTOR(1 downto 0);
         B : in STD_LOGIC_VECTOR(15 downto 0);
         h_out : out STD_LOGIC_VECTOR(15 downto 0)
         );
end Shifter;

architecture Behavioral of Shifter is

component mux2_16bit
        Port ( A0 : in STD_LOGIC_VECTOR(15 downto 0);
                  A1 : in STD_LOGIC_VECTOR(15 downto 0);
                  S0 : in STD_LOGIC;
                  Z : out STD_LOGIC_VECTOR(15 downto 0));
        end component;
begin

end Behavioral;
