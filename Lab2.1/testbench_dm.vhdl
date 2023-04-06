library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench_dm is

end testbench_dm;

architecture beh of testbench_dm is 

component data_memory is   
port
(
	input		: in std_logic_vector(31 downto 0);
	readadd	: in std_logic_vector(5 downto 0);
	writeadd	: in std_logic_vector(5 downto 0);
	writeEn	: in std_logic;
	writeEn1	: in std_logic;
	writeEn2	: in std_logic;
	writeEn3	: in std_logic;
	writeEn4	: in std_logic;
	Clk		: in std_logic;
	output		: out std_logic_vector(31 downto 0)
	);
end component;

signal writeEn,writeEn1,writeEn2,writeEn3,writeEn4,Clk : std_logic;
signal input,output : std_logic_vector(31 downto 0);
signal readadd,writeadd : std_logic_vector(5 downto 0);

begin
	DUT: data_memory port map(input,readadd,writeadd,writeEn,writeEn1,writeEn2,writeEn3,writeEn4,Clk,output);
	
	process
	begin
		writeadd <= "000011";
		input <= "00111000000000000000000001100111";
		readadd <= "000011";
		writeEn <= '0';
		writeEn1 <= '1';
		writeEn2 <= '0';
		writeEn3 <= '0';
		writeEn4 <= '0';
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
		Clk <= '0';
		wait for 5 ns;
		writeEn <= '0';
		writeEn1 <= '0';
		writeEn2 <= '1';
		writeEn3 <= '0';
		writeEn4 <= '0';
		Clk <= '1';
		wait for 5 ns;
		Clk <= '0';
		wait for 5 ns;
		writeEn <= '0';
		writeEn1 <= '0';
		writeEn2 <= '0';
		writeEn3 <= '1';
		writeEn4 <= '0';
		Clk <= '1';
		wait for 5 ns;
		Clk <= '0';
		wait for 5 ns;
		writeEn <= '0';
		writeEn1 <= '0';
		writeEn2 <= '0';
		writeEn3 <= '0';
		writeEn4 <= '1';
		Clk <= '1';
		wait for 5 ns;
		Clk <= '0';
		wait for 5 ns;
		writeEn <= '1';
		writeEn1 <= '0';
		writeEn2 <= '0';
		writeEn3 <= '0';
		writeEn4 <= '0';
		Clk <= '1';
		wait for 5 ns;
		Clk <= '0';
		wait for 5 ns;
	assert false report "Test done." severity note;
    	wait;
  end process;
end beh;
