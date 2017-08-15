--Creación del paquete de componentes del secuenciador 2909
library ieee;
use ieee.std_logic_1164.all ;

package comps_sec is -- declaración del paquete

component registro port(
		R: in std_logic_vector(3 downto 0);
		ER,CLK: in std_logic;
		REG: inout std_logic_vector(3 downto 0));
end component;

component mpc port( -- declaración del contador
	CIN,CLK: in std_logic;
	Y: in std_logic_vector (3 downto 0) ;
	COUT: inout std_logic;
	PC: inout std_logic_vector(3 downto 0));
end component;

component stack port( -- declaración del stack
	CLK,FE,PUSH,POP: in std_logic;
	PC: inout std_logic_vector(3 downto 0);
	ST: inout std_logic_vector(3 downto 0));
end component;

component mux_4 port(-- declaración del multiplexor
	D,R,ST,PC: in std_logic_vector(3 downto 0);
	S: in std_logic_vector(1 downto 0);
	Y: inout std_logic_vector (3 downto 0));
end component;

end comps_sec;
