----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2018 02:26:04
-- Design Name: 
-- Module Name: ControlMem - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlMem is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           NA : out STD_LOGIC_VECTOR(7 downto 0);
           MS : out STD_LOGIC_VECTOR (2 downto 0);
           MC : out STD_LOGIC;
           IL : out STD_LOGIC;
           PI : out STD_LOGIC;
           PL : out STD_LOGIC;
           TD : out STD_LOGIC;
           TA : out STD_LOGIC;
           TB : out STD_LOGIC;
           MB : out STD_LOGIC;
           FS : out STD_LOGIC_VECTOR ( 4 downto 0);
           MD : out STD_LOGIC;
           RW : out STD_LOGIC;
           MM : out STD_LOGIC;
           MW : out STD_LOGIC);
end ControlMem;

architecture Behavioral of ControlMem is

    type mem_array is array(0 to 255) of std_logic_vector(27 downto 0);
begin

memory : process (input)
    variable ctrl_mem : mem_array := (
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000",
    X"0000000",X"0000000",X"0000000",X"0000000"
    );
    
    variable addr : integer;
    variable control_out : std_logic_vector(27 downto 0);
    begin
        addr := conv_integer(input);
        control_out := ctrl_mem(addr);
        
        NA <= control_out(27 downto 20);
        MS <= control_out(19 downto 17);
        MC <= control_out(16);
        IL <= control_out(15);
        PI <= control_out(14);
        PL <= control_out(13);
        TD <= control_out(12);
        TA <= control_out(11);
        TB <= control_out(10);
        MB <= control_out(9);
        FS <= control_out(8 downto 4);
        MD <= control_out(3);
        RW <= control_out(2);
        MM <= control_out(1);
        MW <= control_out(0);
   end process;
end Behavioral;
