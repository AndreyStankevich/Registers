library ieee;
use ieee.std_logic_1164.all;

entity JohnsonCounter is
	generic (N:integer := 4);
	port(
		CLK: in std_logic;
		RST: in std_logic;		
		Pout: out std_logic_vector(0 to N-1)
		);
end JohnsonCounter;

architecture beh of JohnsonCounter is
	signal register_state: std_logic_vector(0 to N-1);
Begin
	Main: process (CLK, RST)
	begin
		if RST = '1' then
			register_state <= (others => '0');
		elsif rising_edge(CLK) then
			register_state <= not(register_state(N-1)) & register_state(0 to N-2);
		end if;
	end process;	
	
	Pout <= register_state;
End beh;