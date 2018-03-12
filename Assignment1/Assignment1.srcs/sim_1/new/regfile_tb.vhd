----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 11:25:18 AM
-- Design Name: 
-- Module Name: regfile_tb - Behavioral
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

entity regfile_tb is
--  Port ( );
end regfile_tb;

architecture Behavioral of regfile_tb is

    Component reg_file
    PORT(
       src : in STD_LOGIC_VECTOR(2 downto 0);
       dst : in STD_LOGIC_VECTOR(2 downto 0); 
       clock : in STD_LOGIC;
       dataSrc : in STD_LOGIC;
       data : in STD_LOGIC_VECTOR(15 downto 0);
       reg_out_1 : out STD_LOGIC_VECTOR(15 downto 0);
       reg_out_2 : out STD_LOGIC_VECTOR(15 downto 0)
       );
       END COMPONENT;
       
       --Inputs
       signal src : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
       signal dst : in STD_LOGIC_VECTOR(2 downto 0) := (others => '0'); 
       signal clock : in STD_LOGIC;
       signal dataSrc : in STD_LOGIC := (others => '0');
       signal data : in STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
       
       --Outputs
       signal reg_out_1 : out STD_LOGIC_VECTOR(15 downto 0);
       signal reg_out_2 : out STD_LOGIC_VECTOR(15 downto 0);
begin
        uut : reg_file PORT MAP (src, dst, clock, dataSrc, data, reg_out_1, reg_out_2);
        
        stim_proc: process
        begin
            

end Behavioral;
