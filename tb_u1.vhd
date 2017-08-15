--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:30:18 07/26/2017
-- Design Name:   
-- Module Name:   /home/pablo384/Documents/FPGA/ISE/proyectoFInal/tb_u1.vhd
-- Project Name:  proyectoFInal
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registro
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
 
ENTITY tb_u1 IS
END tb_u1;
 
ARCHITECTURE behavior OF tb_u1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registro
    PORT(
         R : IN  std_logic_vector(3 downto 0);
         ER : IN  std_logic;
         CLK : IN  std_logic;
         REG : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal R : std_logic_vector(3 downto 0) := (others => '0');
   signal ER : std_logic := '0';
   signal CLK : std_logic := '0';

	--BiDirs
   signal REG : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registro PORT MAP (
          R => R,
          ER => ER,
          CLK => CLK,
          REG => REG
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

      wait for CLK_period*10;

      -- insert stimulus here 
		ER<='1';
		R<="1010";
		wait for 100 ns;
		ER<='0';
		R<="1001";
		wait for 100 ns;
		R<="1010";
		wait for 100 ns;

      wait;
   end process;

END;
