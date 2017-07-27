--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:12:46 07/26/2017
-- Design Name:   
-- Module Name:   /home/pablo384/Documents/FPGA/ISE/proyectoFInal/tb_u3.vhd
-- Project Name:  proyectoFInal
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: stack
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_u3 IS
END tb_u3;
 
ARCHITECTURE behavior OF tb_u3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT stack
    PORT(
         CLK : IN  std_logic;
         FE : IN  std_logic;
         PUSH : IN  std_logic;
         POP : IN  std_logic;
         PC : IN  std_logic_vector(3 downto 0);
         ST : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal FE : std_logic := '0';
   signal PUSH : std_logic := '0';
   signal POP : std_logic := '0';
   signal PC : std_logic_vector(3 downto 0) := (others => '0');

	--BiDirs
   signal ST : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: stack PORT MAP (
          CLK => CLK,
          FE => FE,
          PUSH => PUSH,
          POP => POP,
          PC => PC,
          ST => ST
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		PC<="1010";
		FE<='0';
		PUSH<='1';
		POP<='0';
		wait for 100 ns;
		POP<='0';
		wait for 100 ns;

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
