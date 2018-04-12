----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 02:53:37 PM
-- Design Name: 
-- Module Name: reg_file - Behavioral
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

entity regfile is
    Port ( write : in STD_LOGIC;
           dst : in STD_LOGIC_VECTOR(3 downto 0); 
           Asrc : in STD_LOGIC_VECTOR(3 downto 0);
           Bsrc : in STD_LOGIC_VECTOR(3 downto 0);
           clock : in STD_LOGIC;

           data : in STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_0 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_1 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_2 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_3 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_4 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_5 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_6 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_7 : out STD_LOGIC_VECTOR(15 downto 0)
           Adata : out STD_LOGIC_VECTOR(15 downto 0);
           Bdata : out STD_LOGIC_VECTOR(15 downto 0)
           );
end regfile;

architecture Behavioral of regfile is
    component decoder4to9 
    Port ( sel : in STD_LOGIC_VECTOR (3 downto 0);
           z0 : out STD_LOGIC;
           z1 : out STD_LOGIC;
           z2 : out STD_LOGIC;
           z3 : out STD_LOGIC;
           z4 : out STD_LOGIC;
           z5 : out STD_LOGIC;
           z6 : out STD_LOGIC;
           z7 : out STD_LOGIC;
           z8 : out STD_LOGIC
           );
end component;
    component decoder1to2 is
            Port ( input : in STD_LOGIC;
                   outputA : out STD_LOGIC;
                   outputB : out STD_LOGIC
                   );
        end component;
    component reg16
         Port(
               load: in STD_LOGIC;
               D : in STD_LOGIC_VECTOR(15 downto 0);
               clk : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (15 downto 0);
               directOut : out STD_LOGIC_VECTOR (15 downto 0)
               );
        end component;
        
    component mux2
        Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
               B : in STD_LOGIC_VECTOR (15 downto 0);
               S : in STD_LOGIC;
               Z : out STD_LOGIC_VECTOR (15 downto 0));
        end component;
        
    component mux9 
        Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
                   B : in STD_LOGIC_VECTOR(15 downto 0);
                   C : in STD_LOGIC_VECTOR(15 downto 0);
                   D : in STD_LOGIC_VECTOR(15 downto 0);
                   E : in STD_LOGIC_VECTOR(15 downto 0);
                   F : in STD_LOGIC_VECTOR(15 downto 0);
                   G : in STD_LOGIC_VECTOR(15 downto 0);
                   H : in STD_LOGIC_VECTOR(15 downto 0); 
                   I : in STD_LOGIC_VECTOR(15 downto 0);          
                   S : in STD_LOGIC_VECTOR(3 downto 0);
                   Z : out STD_LOGIC_VECTOR(15 downto 0));
        end component;
       
--       decoder outputs
        signal dc0: STD_LOGIC;
        signal dc1: STD_LOGIC;
        signal dc2: STD_LOGIC;
        signal dc3: STD_LOGIC;
        signal dc4: STD_LOGIC;
        signal dc5: STD_LOGIC;
        signal dc6: STD_LOGIC;
        signal dc7: STD_LOGIC;
        signal dc8: STD_LOGIC;
        
--        register enables
        signal re0: STD_LOGIC;
        signal re1: STD_LOGIC;
        signal re2: STD_LOGIC;
        signal re3: STD_LOGIC;
        signal re4: STD_LOGIC;
        signal re5: STD_LOGIC;
        signal re6: STD_LOGIC;
        signal re7: STD_LOGIC;
        signal re8: STD_LOGIC;
        
        --registers to mux
        signal rm0: STD_LOGIC_VECTOR(15 downto 0);
        signal rm1: STD_LOGIC_VECTOR(15 downto 0);
        signal rm2: STD_LOGIC_VECTOR(15 downto 0);
        signal rm3: STD_LOGIC_VECTOR(15 downto 0);
        signal rm4: STD_LOGIC_VECTOR(15 downto 0);
        signal rm5: STD_LOGIC_VECTOR(15 downto 0);
        signal rm6: STD_LOGIC_VECTOR(15 downto 0);
        signal rm7: STD_LOGIC_VECTOR(15 downto 0);
        signal rm8: STD_LOGIC_VECTOR(15 downto 0);
        signal m0: STD_LOGIC_VECTOR(15 downto 0);
        signal m1: STD_LOGIC_VECTOR(15 downto 0);
        signal Z : STD_LOGIC_VECTOR(15 downto 0);
begin
    re0 <= dc0 and write;
    re1 <= dc1 and write;
    re2 <= dc2 and write;
    re3 <= dc3 and write;
    re4 <= dc4 and write;
    re5 <= dc5 and write;
    re6 <= dc6 and write;
    re7 <= dc7 and write;
    re8 <= dc8 and write;
    dc      :   decoder4to9 port map (dst, dc0, dc1, dc2, dc3, dc4, dc5, dc6, dc7, dc8);
    aMux    :   mux9 port map(rm0, rm1, rm2, rm3, rm4, rm5, rm6, rm7, rm8, Asrc, Adata);
    BMux    :   mux9 port map(rm0, rm1, rm2, rm3, rm4, rm5, rm6, rm7, rm8, Bsrc, Bdata);
    r0      :   reg16 port map(re0, data, clock, rm0);
    r1      :   reg16 port map(re1, data, clock, rm1);
    r2      :   reg16 port map(re2, data, clock, rm2);
    r3      :   reg16 port map(re3, data, clock, rm3);
    r4      :   reg16 port map(re4, data, clock, rm4);
    r5      :   reg16 port map(re5, data, clock, rm5);
    r6      :   reg16 port map(re6, data, clock, rm6);
    r7      :   reg16 port map(re7, data, clock, rm7);
    r8      :   reg16 port map(re8, data, clock, rm8);
--    dataInMux :  mux2 port map(data, Z, dataSrc, m0); 


end behavioral;