library ieee;
use ieee.std_logic_1164.all;

entity tb_amd2909 is
end tb_amd2909;

architecture tb of tb_amd2909 is

    component amd2909
        port (R    : in std_logic_vector (3 downto 0);
              D    : in std_logic_vector (3 downto 0);
              ER   : in std_logic;
              CLK  : in std_logic;
              S    : in std_logic_vector (1 downto 0);
              FE   : in std_logic;
              PUSH : in std_logic;
              POP  : in std_logic;
              CIN  : in std_logic;
              COUT : inout std_logic;
              REG  : inout std_logic_vector (3 downto 0);
              Y    : inout std_logic_vector (3 downto 0));
    end component;

    signal R    : std_logic_vector (3 downto 0);
    signal D    : std_logic_vector (3 downto 0);
    signal ER   : std_logic;
    signal CLK  : std_logic;
    signal S    : std_logic_vector (1 downto 0);
    signal FE   : std_logic;
    signal PUSH : std_logic;
    signal POP  : std_logic;
    signal CIN  : std_logic;
    signal COUT : std_logic;
    signal REG  : std_logic_vector (3 downto 0);
    signal Y    : std_logic_vector (3 downto 0);

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : amd2909
    port map (R    => R,
              D    => D,
              ER   => ER,
              CLK  => CLK,
              S    => S,
              FE   => FE,
              PUSH => PUSH,
              POP  => POP,
              CIN  => CIN,
              COUT => COUT,
              REG  => REG,
              Y    => Y);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that CLK is really your main clock signal
    CLK <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        R <= (others => '0');
        D <= (others => '0');
        ER <= '0';
        S <= (others => '0');
        FE <= '0';
        PUSH <= '0';
        POP <= '0';
        CIN <= '0';

        -- Reset generation
        --  EDIT: Replace YOURRESETSIGNAL below by the name of your reset as I haven't guessed it
        R <= "0001";
        D <= "0011";
		  S <= "00";
		  CIN <= '1';
		  ER<='0';
		  FE<='0';
		  PUSH<='1';
		  POP<='0';
		  COUT<='1';
        wait for 100 ns;
		  COUT<='0';
		  PUSH<='0';
		  wait for 100 ns;
		  COUT<='1';
		  POP<='1';
		  wait for 100 ns;
		  CIN <= '0';
		  POP<='0';
		  wait for 100 ns;
		  CIN <= '1';		  
        wait for 100 ns;
		  POP<='1';
		  wait for 100 ns;
		  POP<='0';
		  CIN <= '0';
		  wait for 100 ns;
		  PUSH<='0';
		  S<="10";
		  COUT<='0';
		wait for 100 ns;		
		S<="00";
		wait for 100 ns;
		S<="01";
		wait for 100 ns;
		S<="11";
		wait for 100 ns;
		S<="10";
		wait for 10 ns;
		S<="11";
		wait for 10 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;
		  

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;