library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_memory is 
port(
	readadd	: in std_logic_vector(5 downto 0);
	output		: out std_logic_vector(31 downto 0));
	
end program_memory;

architecture beh of program_memory is
	type programmemory is array(0 to 63) of std_logic_vector(31 downto 0);
	signal  program : programmemory;
	begin
	program(0) <= "00000000000000000000000000000111";
	program(1) <= "00000000000001000000100000011111";
	program(2) <= "00000000011111100000000111111100";
	program(3) <= "00000000000000011111111111100000";
	program(4) <= "00000000000000000000000111111111";
		output <= program(to_integer(unsigned(readadd)));
end beh;
