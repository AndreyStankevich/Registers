library ieee;
use ieee.std_logic_1164.all;

entity AsynchronousRegister is
	generic (n: integer := 4);
	port (
		Din : in std_logic_vector(n-1 downto 0);
		EN: in std_logic;
		Dout: out std_logic_vector(n-1 downto 0)
		);
end AsynchronousRegister;

architecture struct of AsynchronousRegister is
	component D_Enable_Latch
		port (
			D, E : in std_logic;
			Q : out std_logic
			);
	end component;	
Begin
	reg: for i in n-1 downto 0 generate
		U_J: D_Enable_Latch port map(
			D => Din(i),
			E => EN,
			Q => Dout(i)
			);
	end generate;	
End Struct;

architecture beh of AsynchronousRegister is
Begin	
	Dout <= Din when EN = '1';
End beh;

