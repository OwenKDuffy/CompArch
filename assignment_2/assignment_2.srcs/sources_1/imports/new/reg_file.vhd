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

entity reg_file is
    Port ( src : in STD_LOGIC_VECTOR(2 downto 0);
           dst : in STD_LOGIC_VECTOR(2 downto 0); 
           selectA : in STD_LOGIC_VECTOR(2 downto 0);
           selectB : in STD_LOGIC_VECTOR(2 downto 0);
           clock : in STD_LOGIC;
           dataSrc : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR(15 downto 0);
           Adata : out STD_LOGIC_VECTOR(15 downto 0);
           Bdata : out STD_LOGIC_VECTOR(15 downto 0)
--           ;
--           reg_out_0 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_1 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_2 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_3 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_4 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_5 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_6 : out STD_LOGIC_VECTOR(15 downto 0);
--           reg_out_7 : out STD_LOGIC_VECTOR(15 downto 0)
           );
end reg_file;

architecture Behavioral of reg_file is
    component decoder_3to8
        Port(x0, x1, x2: in std_logic;
            z0, z1, z2, z3, z4, z5, z6, z7: out STD_LOGIC);
        end component;
        
    component reg16
        Port(load: in STD_LOGIC;
            D : in STD_LOGIC_VECTOR(15 downto 0);
            clk : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (15 downto 0);
            directOut : out STD_LOGIC_VECTOR (15 downto 0)
            );
        end component;
        
    component mux2_16bit
        Port ( A0 : in STD_LOGIC_VECTOR(15 downto 0);
                  A1 : in STD_LOGIC_VECTOR(15 downto 0);
                  S0 : in STD_LOGIC;
                  Z : out STD_LOGIC_VECTOR(15 downto 0));
        end component;
        
    component mux8_16bit
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
               Z : out STD_LOGIC_VECTOR(15 downto 0));
       end component;
       
        signal dc0: STD_LOGIC;
        signal dc1: STD_LOGIC;
        signal dc2: STD_LOGIC;
        signal dc3: STD_LOGIC;
        signal dc4: STD_LOGIC;
        signal dc5: STD_LOGIC;
        signal dc6: STD_LOGIC;
        signal dc7: STD_LOGIC;
        signal rm0: STD_LOGIC_VECTOR(15 downto 0);
        signal rm1: STD_LOGIC_VECTOR(15 downto 0);
        signal rm2: STD_LOGIC_VECTOR(15 downto 0);
        signal rm3: STD_LOGIC_VECTOR(15 downto 0);
        signal rm4: STD_LOGIC_VECTOR(15 downto 0);
        signal rm5: STD_LOGIC_VECTOR(15 downto 0);
        signal rm6: STD_LOGIC_VECTOR(15 downto 0);
        signal rm7: STD_LOGIC_VECTOR(15 downto 0);
        signal m0: STD_LOGIC_VECTOR(15 downto 0);
        signal m1: STD_LOGIC_VECTOR(15 downto 0);
        signal Z : STD_LOGIC_VECTOR(15 downto 0);
begin
    dc      :   decoder_3to8 port map (dst(0), dst(1), dst(2), dc0, dc1, dc2, dc3, dc4, dc5, dc6, dc7);
    muxOut  :   mux8_16bit port map(rm0, rm1, rm2, rm3, rm4, rm5, rm6, rm7, src(0), src(1), src(2), Z);
    r0      :   reg16 port map(dc0, m0, clock, rm0);
    r1      :   reg16 port map(dc1, m0, clock, rm1);
    r2      :   reg16 port map(dc2, m0, clock, rm2);
    r3      :   reg16 port map(dc3, m0, clock, rm3);
    r4      :   reg16 port map(dc4, m0, clock, rm4);
    r5      :   reg16 port map(dc5, m0, clock, rm5);
    r6      :   reg16 port map(dc6, m0, clock, rm6);
    r7      :   reg16 port map(dc7, m0, clock, rm7);
    dataInMux :  mux2_16bit port map(data, Z, dataSrc, m0); 
    selectAout  :   mux8_16bit port map(rm0, rm1, rm2, rm3, rm4, rm5, rm6, rm7, selectA(0), selectA(1), selectA(2), AData);
    selectBout  :   mux8_16bit port map(rm0, rm1, rm2, rm3, rm4, rm5, rm6, rm7, selectB(0), selectB(1), selectB(2), BData);

    
    

end Behavioral;
