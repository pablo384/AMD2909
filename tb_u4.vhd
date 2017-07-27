--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:16:15 07/27/2017
-- Design Name:   
-- Module Name:   /home/pablo384/Documents/FPGA/ISE/proyectoFInal/tb_u4.vhd
-- Project Name:  proyectoFInal
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_4
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
 
ENTITY tb_u4 IS
END tb_u4;
 
ARCHITECTURE behavior OF tb_u4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_4
    PORT(
         D : IN  std_logic_vector(3 downto 0);
         R : IN  std_logic_vector(3 downto 0);
         ST : IN  std_logic_vector(3 downto 0);
         PC : IN  std_logic_vector(3 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         Y : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(3 downto 0) := (others => '0');
   signal R : std_logic_vector(3 downto 0) := (others => '0');
   signal ST : std_logic_vector(3 downto 0) := (others => '0');
   signal PC : std_logic_vector(3 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_4 PORT MAP (
          D => D,
          R => R,
          ST => ST,
          PC => PC,
          S => S,
          Y => Y
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		D<="0001";
		R<="0011";
		ST<="0111";
		PC<="1111";		
		S<="10";
		wait for 100 ns;		
		S<="00";
		wait for 100 ns;
		S<="01";
		wait for 100 ns;
		S<="11";
		wait for 100 ns;
		S<="10";
		wait for 100 ns;

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
