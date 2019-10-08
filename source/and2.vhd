library ieee;
use ieee.std_logic_1164.all;

entity and2 is
	port(
	A, B: in std_logic;
	R: out std_logic
	);
end and2;

architecture beh of and2 is
begin
	R <= A and B;
end;