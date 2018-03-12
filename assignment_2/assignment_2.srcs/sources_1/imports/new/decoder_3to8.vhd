----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 02:42:45 PM
-- Design Name: 
-- Module Name: decoder_3to8 - Behavioral
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

entity decoder_3to8 is
  Port (x0, x1, x2: in std_logic;
        z0, z1, z2, z3, z4, z5, z6, z7: out STD_LOGIC);
        
end decoder_3to8;

architecture behavioral of decoder_3to8 is
    component decoder_2to4 is 
        port(  E : in STD_LOGIC;
               A0 : in STD_LOGIC;
               A1 : in STD_LOGIC;
               Q0 : out STD_LOGIC;
               Q1 : out STD_LOGIC;
               Q2 : out STD_LOGIC;
               Q3 : out STD_LOGIC);
        end component;
        
        signal m0: STD_LOGIC;
        signal m1: STD_LOGIC;
        
begin
    dc1: decoder_2to4
         port map(
                A0 => x0,
                A1 => x1,
                E => m0,
                Q0 => z0,
                Q1 => z1,
                Q2 => z2,
                Q3 => z3
                );
    dc2: decoder_2to4 port map(m1, x0, x1, z4, z5, z6, z7);
    m0 <= (not x2); 
    m1 <= x2;

end behavioral;
