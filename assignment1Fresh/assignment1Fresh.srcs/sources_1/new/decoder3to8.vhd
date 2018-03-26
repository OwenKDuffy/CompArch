----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:26 02/06/2016 
-- Design Name: 
-- Module Name:    decoder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder3to8 is
	Port(
			x0, x1, x2 : in STD_LOGIC;
			z0, z1, z2, z3, z4, z5, z6, z7 : out STD_LOGIC
		);
end decoder3to8;

architecture Behavioral of decoder3to8 is

begin
	z0 <= ((not x0) and (not x1) and (not x2)) after 1ns;      --000
	z1 <= ((not x0) and (not x1) and (x2)) after 1ns;		   --001
	z2 <= ((not x0) and (x1) and (not x2)) after 1ns;		   --010
	z3 <= ((not x0) and (x1) and (x2)) after 1ns;			   --011
	z4 <= ((x0) and (not x1) and (not x2)) after 1ns;		   --100
	z5 <= ((x0) and (not x1) and (x2)) after 1ns;			   --101
	z6 <= ((x0) and (x1) and (not x2)) after 1ns;			   --110
	z7 <= ((x0) and (x1) and (x2)) after 1ns;			       --111

end Behavioral;
