library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_memory is 
port(
	readaddp	: in std_logic_vector(5 downto 0);
	outputp	: out std_logic_vector(31 downto 0));
	
end program_memory;

architecture beh of program_memory is
	type programmemory is array(0 to 63) of std_logic_vector(31 downto 0);
	signal  program : programmemory := (0 => X"E3A00000",
1 => X"E3A01000",
2 => X"E0800001",
3 => X"E2811001",
4 => X"E3510005",
5 => X"1AFFFFFB",
others => X"00000000");
	begin
		outputp <= program(to_integer(unsigned(readaddp)));
end beh;
