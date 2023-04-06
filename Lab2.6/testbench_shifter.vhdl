library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component shifter is
port(
	I     : in std_logic;
	T     : in std_logic_vector(1 downto 0);
	Cs    : in std_logic_vector(4 downto 0);
	var   : in std_logic_vector(31 downto 0);
	Sout  : out std_logic_vector(31 downto 0)
	);
end component;

signal I : std_logic;
signal T : std_logic_vector(1 downto 0);
signal Cs : std_logic_vector(4 downto 0);
signal var,Sout : std_logic_vector(31 downto 0);

begin
	DUT : shifter port map(I,T,Cs,var,Sout);
	process
	begin
		I <= '0';
		T <= "00";
		Cs <= "00000";
		var <= X"00000001";
		wait for 10 ns;
		I <= '0';
		T <= "00";
		Cs <= "00010";
		var <= X"00000011";
		wait for 10 ns;
		I <= '0';
		T <= "01";
		Cs <= "00010";
		var <= "00000000000000000000000000000011";
		wait for 10 ns;
		I <= '0';
		T <= "10";
		Cs <= "00011";
		var <= X"00000001";
		wait for 10 ns;
		I <= '0';
		T <= "10";
		Cs <= "11111";
		var <= "10000000000000000000000000000011";
		wait for 10 ns;
		I <= '0';
		T <= "10";
		Cs <= "00011";
		var <= X"00001001";
		wait for 10 ns;
	assert false report "Test done." severity note;
    wait;
  end process;
end tb;
		
