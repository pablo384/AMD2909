
-- VHDL Instantiation Created from source file stack.vhd -- 19:31:58 07/26/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT stack
	PORT(
		CLK : IN std_logic;
		FE : IN std_logic;
		PUSH : IN std_logic;
		POP : IN std_logic;
		PC : IN std_logic_vector(3 downto 0);       
		ST : INOUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_stack: stack PORT MAP(
		CLK => ,
		FE => ,
		PUSH => ,
		POP => ,
		PC => ,
		ST => 
	);


