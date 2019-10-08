library ieee;
use ieee.std_logic_1164.all;

entity nor2 is
	port(
		A, B: in std_logic;
		R: out std_logic
		);
end nor2;

architecture beh of nor2 is	
begin
	R <= A nor B;		
end;