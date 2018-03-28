

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg16 is
--  Port ( );
        Port(
            load: in STD_LOGIC;
            D : in STD_LOGIC_VECTOR(15 downto 0);
            clk : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (15 downto 0);
            directOut : out STD_LOGIC_VECTOR (15 downto 0)
            );
end reg16;

architecture Behavioral of reg16 is
signal output : STD_LOGIC_VECTOR(15 downto 0);

begin
Q <= output;
directOut <= output;
    process(clk)
    begin
        if(rising_edge(clk)) then
            if load = '1' then
                output<=D after 1 ns;
            
            end if;
        else
            output <= output;
        end if;
    end process;

end Behavioral;
