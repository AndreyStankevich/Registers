library IEEE;
use IEEE.std_logic_1164.all;

entity FDCE is
	port(
		CLR : in std_logic;		
		D : in std_logic;
		E : in std_logic;
		CLK : in std_logic;
		Q : out std_logic
		);
end FDCE;

architecture beh of FDCE is
	signal s: std_logic;
begin
	process(CLR, D, E, CLK)
	begin
		if CLR = '1' then
			s <= '0';		
		elsif E = '1' then
			if rising_edge(CLK) then
				s <= D;	 
			end if;
		end if;
	end process; 
	
	Q <= s;
end beh;
