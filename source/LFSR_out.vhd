library ieee;
use ieee.std_logic_1164.all;

entity LFSR_out is
	generic (				  
		N : integer := 4;
		init_state : std_logic_vector := "1111"
		);	
	port(
		CLK: in std_logic;		
		State: out std_logic_vector(0 to N-1)
		);	 
	
end LFSR_out;

architecture beh of LFSR_out is	
	signal register_state: std_logic_vector(0 to N-1) := init_state;	
Begin
	Main: process (CLK)
	begin
		if rising_edge(CLK) then			
			register_state <= (register_state(0) xor register_state(N-1)) & register_state(0 to N-2);
		end if;
	end process;	
	State <= register_state;
End Beh;
