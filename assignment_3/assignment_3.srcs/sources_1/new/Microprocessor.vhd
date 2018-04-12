----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2018 01:44:05
-- Design Name: 
-- Module Name: Microprocessor - Behavioral
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

entity Microprocessor is
  Port (
    clk : in STD_LOGIC
    );
end Microprocessor;

architecture Behavioral of Microprocessor is
component datapath is
Port (
           dst : in STD_LOGIC_VECTOR(3 downto 0); 
           selectA : in STD_LOGIC_VECTOR(3 downto 0);
           selectB : in STD_LOGIC_VECTOR(3 downto 0);
           mBSelect : in STD_LOGIC;
           fs : in STD_LOGIC_VECTOR(4 downto 0);
           mDSelect : in STD_LOGIC;
           RW : in STD_LOGIC;
--           src : in STD_LOGIC_VECTOR(2 downto 0);
           clock : in STD_LOGIC;
--           dataSrc : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR(15 downto 0);
           constant_In : in STD_LOGIC_VECTOR(15 downto 0);
           AddressOut : out STD_LOGIC_VECTOR(15 downto 0);
           DataOut : out STD_LOGIC_VECTOR(15 downto 0);
           v : out STD_LOGIC; 
           c: out STD_LOGIC; 
           n: out STD_LOGIC; 
           z : out STD_LOGIC
     );
    end component;
    component mux2
           Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
                   B : in STD_LOGIC_VECTOR (15 downto 0);
                   S : in STD_LOGIC;
                   Z : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component Memory 
        Port ( dataIn : in STD_LOGIC_VECTOR (15 downto 0);
               MW : in STD_LOGIC;
               AddressIn : in STD_LOGIC_VECTOR (15 downto 0);
               DataOut : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component ControlMem 
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
               FS : out STD_LOGIC_VECTOR (4 downto 0);
               MD : out STD_LOGIC;
               RW : out STD_LOGIC;
               MM : out STD_LOGIC;
               MW : out STD_LOGIC);
    end component;
    
    component mux8_1bit 
    Port (     A : in STD_LOGIC;
               B : in STD_LOGIC;
               C : in STD_LOGIC;
               D : in STD_LOGIC;
               E : in STD_LOGIC;
               F : in STD_LOGIC;
               G : in STD_LOGIC;
               H : in STD_LOGIC;           
               S : in STD_LOGIC_VECTOR (2 downto 0);
               Z : out STD_LOGIC
               );
    end component;
    
    component mux2_8bit 
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               S : in STD_LOGIC;
               Z : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component CAR 
        Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
               conditions : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component InstructionRegister 
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               load : in STD_LOGIC;
               DR : out STD_LOGIC_VECTOR (2 downto 0);
               SA : out STD_LOGIC_VECTOR (2 downto 0);
               SB : out STD_LOGIC_VECTOR (2 downto 0);
               OpCode : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    component ProgramCounter is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               PL : in STD_LOGIC;
               PI : in STD_LOGIC;
               Reset : in STD_LOGIC;
               Clk : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal dest : STD_LOGIC_VECTOR(3 downto 0);
    signal sata : STD_LOGIC_VECTOR(3 downto 0);
    signal sbtb : STD_LOGIC_VECTOR(3 downto 0);
    signal MBSel : STD_LOGIC;
    signal MDSel : STD_LOGIC;
    signal RW : STD_LOGIC;
    signal fsel : STD_LOGIC_VECTOR(4 downto 0);
    signal dataFromMem : STD_LOGIC_VECTOR(15 downto 0);
    signal CstIn : STD_LOGIC_VECTOR(15 downto 0);
    signal addToMem : STD_LOGIC_VECTOR(15 downto 0);
    signal DO : STD_LOGIC_VECTOR(15 downto 0);
    signal condFlags : STD_LOGIC_VECTOR(3 downto 0);
    signal MMSel : STD_LOGIC;
    signal MemAdd, PCInput, progCounterOut : STD_LOGIC_VECTOR(15 downto 0);
    signal MW : STD_LOGIC;
    signal CARtoCM : STD_LOGIC_VECTOR(7 downto 0);
    signal CMtoMuxC, IRtoMUXC, MCtoCAR: STD_LOGIC_VECTOR(7 downto 0);
    signal MSSel : STD_LOGIC_VECTOR(2 downto 0);
    signal MCSel : STD_LOGIC;
    signal IL, PI, PL ,notZ, notC, reset, MUXStoCAR: STD_LOGIC;
    
begin
    notC <= not condFlags(1);
    notZ <= not condFlags(0);
    dp      : dataPath port map (dest, sata, sbtb, MBSel, fsel, MDSel, RW, clk, dataFromMem, CstIn, addToMem, DO, condFlags(3), condFlags(2), condFlags(1), condFlags(0));
    MUXM    : mux2 port map ( addToMem, progCounterOut, MMSel, MemAdd);
    mem     : Memory port map (addToMem, MW, MemAdd, datafromMem);
    CM      : ControlMem port map (CARtoCM, CMtoMUXC, MSSel, MCSel, IL, PI, PL, dest(3), sata(3), sbtb(3), MBSel, fsel, MDSel, RW, MMSel, MW);
    MUXS    : mux8_1bit port map (notZ, notC, condFlags(1), condflags(0), condflags(3), condflags(2), '1', '0', MSSel, MUXStoCAR);
    MUXC    : mux2_8bit port map (CMtoMuxC, IRtoMuxC, MCSel, MCtoCAR);
    PC      : ProgramCounter port map(PCInput, PI, PL, reset, clk, progCounterOut);
    cr      : CAR port map(MCtoCAR, MUXStoCAR, CARtoCM);
    ir      : InstructionRegister port map(dataFromMem, IL, dest(2 downto 0), sata(2 downto 0), sbtb(2 downto 0), IRtoMuxC(6 downto 0));
end Behavioral;
