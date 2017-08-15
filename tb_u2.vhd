--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:47:33 07/26/2017
-- Design Name:   
-- Module Name:   /home/pablo384/Documents/FPGA/ISE/proyectoFInal/tb_u2.vhd
-- Project Name:  proyectoFInal
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mpc
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
 
ENTITY tb_u2 IS
END tb_u2;
 
ARCHITECTURE behavior OF tb_u2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mpc
    PORT(
         CIN : IN  std_logic;
         CLK : IN  std_logic;
         Y : IN  std_logic_vector(3 downto 0);
         COUT : INOUT  std_logic;
         PC : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CIN : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Y : std_logic_vector(3 downto 0) := (others => '0');

	--BiDirs
   signal COUT : std_logic;
   signal PC : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mpc PORT MAP (
          CIN => CIN,
          CLK => CLK,
          Y => Y,
          COUT => COUT,
          PC => PC
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
		CIN<='1';
		wait for 100 ns;
		
		
		CIN<='0';
		wait for 100 ns;
		

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
