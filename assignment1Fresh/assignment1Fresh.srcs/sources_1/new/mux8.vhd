----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 11:12:54 AM
-- Design Name: 
-- Module Name: mux8 - Behavioral
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

entity mux8 is
    Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           C : in STD_LOGIC_VECTOR(15 downto 0);
           D : in STD_LOGIC_VECTOR(15 downto 0);
           E : in STD_LOGIC_VECTOR(15 downto 0);
           F : in STD_LOGIC_VECTOR(15 downto 0);
           G : in STD_LOGIC_VECTOR(15 downto 0);
           H : in STD_LOGIC_VECTOR(15 downto 0);           
           S : in STD_LOGIC_VECTOR(2 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0));
end mux8;

architecture Behavioral of mux8 is
component mux4 
    Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           C : in STD_LOGIC_VECTOR(15 downto 0);
           D : in STD_LOGIC_VECTOR(15 downto 0);           
           S : in STD_LOGIC_VECTOR(1 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component mux2 
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal mza : STD_LOGIC_VECTOR(15 downto 0);
signal mzb : STD_LOGIC_VECTOR(15 downto 0);

begin
ma : mux4 port map (A, B, C, D, S(1 downto 0), mza);
mb : mux4 port map (E, F, G, H, S(1 downto 0), mzb);
mc : mux2 port map (mza, mzb, S(2), Z);

end Behavioral;
