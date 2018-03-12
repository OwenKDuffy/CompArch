----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 12:59:01 PM
-- Design Name: 
-- Module Name: entirety - Behavioral
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

entity entirety is
Port (
           src : in STD_LOGIC_VECTOR(2 downto 0);
           dst : in STD_LOGIC_VECTOR(2 downto 0); 
           selectA : in STD_LOGIC_VECTOR(2 downto 0);
           selectB : in STD_LOGIC_VECTOR(2 downto 0);
           clock : in STD_LOGIC;
           dataSrc : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR(15 downto 0);
           constant_In : in STD_LOGIC_VECTOR(15 downto 0);
           AddressOut : out STD_LOGIC_VECTOR(15 downto 0);
           DataOut : out STD_LOGIC_VECTOR(15 downto 0);
           mBSelect : in STD_LOGIC;
           mDSelect : in STD_LOGIC;
           fs : in STD_LOGIC_VECTOR(4 downto 0);
           v : out STD_LOGIC; 
           c: out STD_LOGIC; 
           n: out STD_LOGIC; 
           z : out STD_LOGIC
     );
    end entirety;
    
architecture Behavioral of entirety is
    
    component mux2_16bit
        Port ( A0 : in STD_LOGIC_VECTOR(15 downto 0);
                  A1 : in STD_LOGIC_VECTOR(15 downto 0);
                  S0 : in STD_LOGIC;
                  Z : out STD_LOGIC_VECTOR(15 downto 0));
        end component;
        
        component reg_file 
            Port ( src : in STD_LOGIC_VECTOR(2 downto 0);
                   dst : in STD_LOGIC_VECTOR(2 downto 0); 
                   selectA : in STD_LOGIC_VECTOR(2 downto 0);
                   selectB : in STD_LOGIC_VECTOR(2 downto 0);
                   clock : in STD_LOGIC;
                   dataSrc : in STD_LOGIC;
                   data : in STD_LOGIC_VECTOR(15 downto 0);
                   Adata : out STD_LOGIC_VECTOR(15 downto 0);
                   Bdata : out STD_LOGIC_VECTOR(15 downto 0)
--                   ;
--                   reg_out_0 : out STD_LOGIC_VECTOR(15 downto 0);
--                   reg_out_1 : out STD_LOGIC_VECTOR(15 downto 0);
--                   reg_out_2 : out STD_LOGIC_VECTOR(15 downto 0);
--                   reg_out_3 : out STD_LOGIC_VECTOR(15 downto 0);
--                   reg_out_4 : out STD_LOGIC_VECTOR(15 downto 0);
--                   reg_out_5 : out STD_LOGIC_VECTOR(15 downto 0);
--                   reg_out_6 : out STD_LOGIC_VECTOR(15 downto 0);
--                   reg_out_7 : out STD_LOGIC_VECTOR(15 downto 0)
                   );
        end component;
        
        component function_Unit 
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
        end component;
        
   
        signal busA: STD_LOGIC_VECTOR(15 downto 0);
        signal busB: STD_LOGIC_VECTOR(15 downto 0);
        signal rfToMx: STD_LOGIC_VECTOR(15 downto 0);
        signal f: STD_LOGIC_VECTOR(15 downto 0);
        signal DataReturn: STD_LOGIC_VECTOR(15 downto 0);
    begin
    rf      : reg_file port map
                        (src => src,
                        dst => dst,
                        selectA => selectA,
                        selectB => selectB,
                        clock => clock,
                        dataSrc => dataSrc,
                        data => DataReturn,
                        Adata => busA,
                        Bdata => rfToMx);
    fu      : function_Unit port map (busA, busB, fs, v, c, z, n, f);
    
    busMX   : mux2_16bit port map(constant_In, rfToMx, mBSelect, busB);
    MXD     : mux2_16bit port map(f, data, mDSelect, DataReturn);
    
    AddressOut <= busA;
    DataOut <= busB;
    
    end Behavioral;