library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FlipFlop is 
	port (
		D, CLK, E: in std_logic;
		Q: out std_logic
		);
end D_FlipFlop;

architecture beh of D_FlipFlop is		   
	signal s : std_logic;
begin
	process(CLK)
	begin
		if E = '1' then
			if rising_edge(CLK) then
				s <= D;
			end if;					
		end if;
	end process;	
	
	Q <= s;
end beh;