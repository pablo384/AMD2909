-- Diseño de los componentes del secuenciador 2909
library ieee, amd;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use work.comps_sec.all; --paquete creado en la librería amd

 entity amd2909 is port (
		R: in std_logic_vector (3 downto 0) ;
		D: in std_logic_vector (3 downto 0) ;
		ER: in std_logic;
		CLK: in std_logic; 
		S: in std_logic_vector (1 downto 0) ;
		FE: in std_logic;
		PUSH: in std_logic;
		POP: in std_logic;
		CIN: in std_logic;
		COUT: inout std_logic;
		REG: inout std_logic_vector (3 downto 0);
		Y:inout std_logic_vector (3 downto 0));
end amd2909;


architecture arq_amd of amd2909 is
	--signal REG: std_logic_vector (3 downto 0);
	signal ST: std_logic_vector (3 downto 0);
	signal PC: std_logic_vector (3 downto 0);
begin

-- inicia interconexión de los componentes

	u1: registro port map (CLK => CLK, ER => ER, REG => REG, R => R);
	u2: mpc port map (CIN=>CIN, COUT=>COUT, CLK=>CLK, Y=>Y, PC=>PC);
	u3: stack port map (CLK =>CLK, FE => FE, PUSH=>PUSH, POP => POP, ST => ST); --MPC => MPC,
	u4: mux_4 port map (D=>D, R=>R, ST=>ST, PC=>PC, S=>S, Y=>Y);

end arq_amd;
