library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench_pm is

end testbench_pm;

architecture beh of testbench_pm is

component program_memory is

port(
	readadd	: in std_logic_vector(5 downto 0);
	output		: out std_logic_vector(31 downto 0));
	
end component;

signal readadd : std_logic_vector(5 downto 0);
signal output  : std_logic_vector(31 downto 0);

begin
	DUT : program_memory port map(readadd,output);
	
	process
	begin
		readadd <= "000001";
		wait for 5 ns;
		readadd <= "000010";
		wait for 5 ns;
		readadd <= "000011";
		wait for 5 ns;
		readadd <= "000100";
		wait for 5 ns;
		readadd <= "000101";
		wait for 5 ns;
	assert false report "Test done." severity note;
    	wait;
  end process;
end beh;
