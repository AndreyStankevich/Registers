library ieee;
use ieee.std_logic_1164.all;

entity test_LFSR_in is
	generic (N : integer := 4);
end test_LFSR_in;

architecture Beh of test_LFSR_in is			 
	component LFSR_In		   
		generic (N : integer := 4);
		port(
			CLK: in std_logic;		
			State: out std_logic_vector(0 to N-1)
			);
	end component;
	signal CLK: std_logic := '0';
	
	signal State: std_logic_vector(0 to N-1);
	constant clock_period: time := 10 ns;
begin
	beh: entity Work.LFSR_In port map (
		CLK => CLK,		
		State => State
		);
	
	CLK <= not CLK after clock_period;
end Beh;