----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 03:41:35 PM
-- Design Name: 
-- Module Name: mux8_16bit - Behavioral
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

entity mux8_16bit is
    Port ( in0 : in STD_LOGIC_VECTOR(15 downto 0);
           in1 : in STD_LOGIC_VECTOR(15 downto 0);
           in2 : in STD_LOGIC_VECTOR(15 downto 0);
           in3 : in STD_LOGIC_VECTOR(15 downto 0);
           in4 : in STD_LOGIC_VECTOR(15 downto 0);
           in5 : in STD_LOGIC_VECTOR(15 downto 0);
           in6 : in STD_LOGIC_VECTOR(15 downto 0);
           in7 : in STD_LOGIC_VECTOR(15 downto 0);
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           s2 : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR(15 downto 0)
           );
end mux8_16bit;

architecture Behavioral of mux8_16bit is
    component mux4_16bit
        Port ( A0 : in STD_LOGIC_VECTOR(15 downto 0);
               A1 : in STD_LOGIC_VECTOR(15 downto 0);
               A2 : in STD_LOGIC_VECTOR(15 downto 0);
               A3 : in STD_LOGIC_VECTOR(15 downto 0);
               S0 : in STD_LOGIC;
               S1 : in STD_LOGIC;
               Z : out STD_LOGIC_VECTOR(15 downto 0));
       end component;

    component mux2_16bit
         Port ( A0 : in STD_LOGIC_VECTOR(15 downto 0);
              A1 : in STD_LOGIC_VECTOR(15 downto 0);
              S0 : in STD_LOGIC;
              Z : out STD_LOGIC_VECTOR(15 downto 0));
          end component;
        
        signal m0: STD_LOGIC_VECTOR(15 downto 0);
        signal m1: STD_LOGIC_VECTOR(15 downto 0);
begin
    mx4a    :  mux4_16bit port map(in0, in1, in2, in3, s0, s1, m0);
    mx4b    :  mux4_16bit port map(in4, in5, in6, in7, s0, s1, m1);
    mx2     :  mux2_16bit port map(m0, m1, s2);

end Behavioral;
