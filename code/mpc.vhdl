--Diseño del bloque de cuenta (contador de microprograma)

library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity mpc is port (
	CIN, CLK: in std_logic;
	Y: in std_logic_vector( 3 downto 0 ) ;
	COUT: inout std_logic;
	PC: inout std_logic_vector( 3 downto 0 ) ) ;
end mpc;

architecture arq_mpc of mpc is
	begin
		process (CLK, Y, CIN) begin
			if (CLK' event and CLK = '1' ) then
				if (CIN = '1') then
					PC <= Y + 1;
				else
					PC<= Y;
				end if;
			end if;
		end process;
COUT <= (CIN and Y(0)and Y(1) and Y(2) and Y(3));
end arq_mpc;
