library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench_rf is

end testbench_rf;

architecture beh of testbench_rf is

component register_file is

port
    (
    input		: in  std_logic_vector(31 downto 0);
    writeEnable   	: in std_logic;
    read1       	: in std_logic_vector(3 downto 0);
    read2       	: in std_logic_vector(3 downto 0);
    writeadd	   	: in std_logic_vector(3 downto 0);
    Clk           	: in std_logic;
    output1          	: out std_logic_vector(31 downto 0);
    output2       	: out std_logic_vector(31 downto 0));
end component;

signal writeEnable,Clk : std_logic;
signal read1,read2,writeadd : std_logic_vector(3 downto 0);
signal input,output1,output2	:	std_logic_vector(31 downto 0);

begin

	DUT: register_file port map(input,writeEnable,read1,read2,writeadd,clk,output1,output2);

	process
	begin
		writeadd <= "0011";
		input <= "00000000000000000000000001100111";
		read1 <= "0001";
		read2 <= "0011";
		writeEnable <= '1';
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;	
		writeadd <= "0001";
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
		Clk <= '0';
		wait for 5 ns;
	assert false report "Test done." severity note;
    	wait;
  end process;
end beh;
