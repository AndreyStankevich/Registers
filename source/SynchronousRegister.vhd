library ieee;
use ieee.std_logic_1164.all;

entity SynchronousRegister is
	generic (n: integer := 4);
	port (
		Din : in std_logic_vector(n-1 downto 0);
		EN: in std_logic;						   
		CLK : in std_logic;
		Dout: out std_logic_vector(n-1 downto 0)
		);
end SynchronousRegister;

architecture struct of SynchronousRegister is
	component D_FlipFlop
		port (
			D, E, CLK : in std_logic;
			Q : out std_logic
			);
	end component;	
Begin
	reg: for i in n-1 downto 0 generate
		U_J: D_FlipFlop port map(
			D => Din(i),
			E => EN,
			CLK => CLK,
			Q => Dout(i)
			);
	end generate;	
End struct;

architecture beh of SynchronousRegister is
	signal result : std_logic_vector(n-1 downto 0);
Begin
	main : process(Din, EN, CLK)
	begin
		if EN = '1' then
			if rising_edge(CLK) then
				result <= Din;
			end if;
		end if;
	end process;
	
	Dout <= result;
End	beh;