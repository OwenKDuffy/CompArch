library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux4 is
    Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           C : in STD_LOGIC_VECTOR(15 downto 0);
           D : in STD_LOGIC_VECTOR(15 downto 0);           
           S : in STD_LOGIC_VECTOR(1 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0));
end mux4;

architecture Behavioral of mux4 is
component mux2 
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;


signal mza : STD_LOGIC_VECTOR(15 downto 0);
signal mzb : STD_LOGIC_VECTOR(15 downto 0);

begin
ma : mux2 port map (A, B, S(0), mza);
mb : mux2 port map (C, D, S(0), mzb);
mc : mux2 port map (mza, mzb, S(1), Z);

end Behavioral;