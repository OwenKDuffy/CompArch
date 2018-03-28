----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 01:01:54 PM
-- Design Name: 
-- Module Name: function_Unit - Behavioral
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

entity function_Unit is
Port ( 
           inA : in STD_LOGIC_VECTOR(15 downto 0);
           inB : in STD_LOGIC_VECTOR(15 downto 0);
           Fselect : in STD_LOGIC_VECTOR(4 downto 0);
           oVerflow : out STD_LOGIC;
           Carry : out STD_LOGIC;
           Z_flag : out STD_LOGIC;
           n_flag : out STD_LOGIC;
           F_Out :out STD_LOGIC_VECTOR(15 downto 0)
           );
end function_Unit;

architecture Behavioral of function_Unit is
    component ALU 
    Port ( inA : in STD_LOGIC_VECTOR(15 downto 0);
           inB : in STD_LOGIC_VECTOR(15 downto 0);
           Gselect : in STD_LOGIC_VECTOR(3 downto 0);
           oVerflow : out STD_LOGIC;
           Carry : out STD_LOGIC;
           G : out STD_LOGIC_VECTOR(15 downto 0)
           );
end component;

component Shifter 
  Port ( Hselect : in STD_LOGIC_VECTOR(1 downto 0);
         input : in STD_LOGIC_VECTOR(15 downto 0);
         h_out : out STD_LOGIC_VECTOR(15 downto 0)
         );
end component;

 component mux2
       Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
            B : in STD_LOGIC_VECTOR (15 downto 0);
            S : in STD_LOGIC;
            Z : out STD_LOGIC_VECTOR (15 downto 0));
 end component;
 
 component ZeroDetect 
     Port ( number : in STD_LOGIC_VECTOR(15 downto 0);
            Zero_flag : out STD_LOGIC
           );
 end component;
        
        signal fToM : STD_LOGIC_VECTOR(15 downto 0);
        signal sToM : STD_LOGIC_VECTOR(15 downto 0);
begin
    a : ALU port map(inA, inB, Fselect(3 downto 0), oVerflow, Carry, fToM);
    s : shifter port map(Fselect(3 downto 2), inB, sToM);
    mx: mux2 port map(fToM, sToM, Fselect(4), F_out);
    z : ZeroDetect port map(fToM, Z_flag);
    
    n_flag <= fToM(15);
    end Behavioral;
