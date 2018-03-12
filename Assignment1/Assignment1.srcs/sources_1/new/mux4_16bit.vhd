----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 03:47:50 PM
-- Design Name: 
-- Module Name: mux4_16bit - Behavioral
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

entity mux4_16bit is
    Port ( A0 : in STD_LOGIC_VECTOR (15 downto 0);
           A1 : in STD_LOGIC_VECTOR (15 downto 0);
           A2 : in STD_LOGIC_VECTOR (15 downto 0);
           A3 : in STD_LOGIC_VECTOR (15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0));
end mux4_16bit;

architecture Behavioral of mux4_16bit is
    component mux2_16bit
         Port ( A0 : in STD_LOGIC_VECTOR(15 downto 0);
              A1 : in STD_LOGIC_VECTOR(15 downto 0);
              S0 : in STD_LOGIC;
              Z : out STD_LOGIC_VECTOR(15 downto 0));
          end component;
          
          signal m0: STD_LOGIC_VECTOR(15 downto 0);
          signal m1: STD_LOGIC_VECTOR(15 downto 0);
begin
    mx2a :  mux2_16bit port map(A0, A1, S0, m0);
    mx2b :  mux2_16bit port map(A2, A3, S0, m1);
    mx2c :  mux2_16bit port map(m0, m1, S1, Z);

end Behavioral;
