library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  
use IEEE.NUMERIC_STD.all;

entity test_AsynchronousRegister is
	generic (n : integer := 4);
end test_AsynchronousRegister;

architecture TB_ARCHITECTURE of test_AsynchronousRegister is	
component AsynchronousRegister
	generic (n : integer := 4);
		port(
			Din : in STD_LOGIC_VECTOR(n-1 downto 0);
			EN : in STD_LOGIC;
			Dout : out STD_LOGIC_VECTOR(n-1 downto 0) 
			);
	end component;
	
	signal Din : STD_LOGIC_VECTOR(n-1 downto 0) := (others => '0');
	signal EN : STD_LOGIC := '0';
	
	signal Dout_beh : STD_LOGIC_VECTOR(n-1 downto 0);
	signal Dout_struct : STD_LOGIC_VECTOR(n-1 downto 0);
	
	constant register_size : integer := 4;
	constant in_delay : time := 10 ns;
begin
	
	beh : entity Work.AsynchronousRegister(beh)
	generic map (n => register_size)
	
	port map (
		Din => Din,
		EN => EN,
		Dout => Dout_beh
		);	
	
	struct : entity Work.AsynchronousRegister(struct)
	generic map (n => register_size)
	
	port map (
		Din => Din,
		EN => EN,
		Dout => Dout_struct
		);
	
	Din <= Din + "1" after in_delay;
	
	enable: process
	begin
		wait for in_delay / 3;
		EN <= '1';
		wait for in_delay / 3;
		EN <= '0';
		wait for in_delay * 4 + in_delay / 3;
	end	process;
	
end TB_ARCHITECTURE;