--— Diseño de una pila de una palabra de 4 bits
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


entity stack is port(
	CLK,FE,PUSH, POP: in std_logic;
	PC: in std_logic_vector (3 downto 0) := (others => '1'); 
	ST: inout std_logic_vector (3 downto 0));
end stack;

architecture arq_stack of stack is
	signal var: std_logic_vector (3 downto 0);
	--signal x: std_logic_vector (3 downto 0);
	begin
		process (FE, CLK, PUSH, POP, PC)
			variable x: std_logic_vector (3 downto 0);
			begin

				if (CLK'event and CLK = '1') then
					if (FE = '0') then
						if (PUSH = '1' ) then
							x := PC; -- almacena dato
							var <= x;
						elsif (POP = '0') then
							ST <= VAR; --— saca dato
						else
							ST <= ST;
						end if;
					end if;
				end if;
		end process;
end arq_stack;
