library ieee;
use ieee.std_logic_1164.all;

entity test_Signature is
	generic (N : integer := 4);
end test_Signature;

architecture TESTBENCH of test_Signature is			 
	component Signature		   
		generic (N : integer := 4);
		port(
			CLK: in std_logic;
			Pin: in std_logic;
			State: out std_logic_vector(0 to N-1)
			);
	end component;
	
	signal CLK: std_logic := '0';	 
	signal Pin: std_logic := '0';
	
	signal State: std_logic_vector(0 to N-1);
	
	constant clock_period: time := 10 ns;
	constant test_polynom : std_logic_vector := "101010";
begin
	beh: entity Work.Signature port map (
		CLK => CLK,		
		State => State,
		Pin => Pin
		);
		
	simulate: process
	begin	
		wait for clock_period;
		for i in test_polynom'length-1 downto 0 loop
			Pin <= test_polynom(i);					
			wait for clock_period*2;
		end loop;	
	end process;
	
	CLK <= not CLK after clock_period;
end TESTBENCH;