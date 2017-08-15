
-- Diseño del registro R
library ieee;
use IEEE.std_logic_1164.all;

entity registro is port(
	R: in std_logic_vector(3 downto 0);
	ER, CLK: in std_logic;
	REG: inout std_logic_vector(3 downto 0));
end registro;

architecture arq_reg of registro is
	begin
		process (CLK,ER,REG,R) begin
			if (CLK' event and CLK ='1')then
				if ER = '0' then
					REG <= R;
				else
					REG <= REG;
				end if;
			end if;
		end process;
end arq_reg;
