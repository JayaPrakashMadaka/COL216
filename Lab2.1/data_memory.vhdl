library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity data_memory is   
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
end data_memory;

architecture beh of data_memory is
	type	datamemory is array(0 to 63) of std_logic_vector(31 downto 0);
	signal	data  : datamemory;
	signal	load  : std_logic_vector(31 downto 0);
	signal  ans   : std_logic_vector(31 downto 0);
	begin
		dataMem : process(Clk)
		
		begin
			if rising_edge(Clk) then 
				if(writeEn ='1') then 
					data(to_integer(unsigned(writeadd))) <= input;
				elsif(writeEn1 = '1') then
					load <= input and "11111111000000000000000000000000";
					ans <=  std_logic_vector(shift_right(unsigned(load),24));
					data(to_integer(unsigned(writeadd))) <= ans;
				elsif(writeEn2 = '1') then
					load <= input and "00000000111111110000000000000000";
					ans <= std_logic_vector(shift_right(unsigned(load),16));
					data(to_integer(unsigned(writeadd))) <= ans;
				elsif(writeEn3 = '1') then 
					load <= input and "00000000000000001111111100000000";
					ans <= std_logic_vector(shift_right(unsigned(load),8));
					data(to_integer(unsigned(writeadd))) <= ans;
				elsif(writeEn4 = '1') then 
					load <= input and "00000000000000000000000011111111";
					data(to_integer(unsigned(writeadd))) <= load;
				end if;
			elsif falling_edge(Clk) then 
				if(writeEn ='1') then 
					data(to_integer(unsigned(writeadd))) <= input;
				elsif(writeEn1 = '1') then
					load <= input and "11111111000000000000000000000000";
					ans <=  std_logic_vector(shift_right(unsigned(load),24));
					data(to_integer(unsigned(writeadd))) <= ans;
				elsif(writeEn2 = '1') then
					load <= input and "00000000111111110000000000000000";
					ans <= std_logic_vector(shift_right(unsigned(load),16));
					data(to_integer(unsigned(writeadd))) <= ans;
				elsif(writeEn3 = '1') then 
					load <= input and "00000000000000001111111100000000";
					ans <= std_logic_vector(shift_right(unsigned(load),8));
					data(to_integer(unsigned(writeadd))) <= ans;
				elsif(writeEn4 = '1') then 
					load <= input and "00000000000000000000000011111111";
					data(to_integer(unsigned(writeadd))) <= load;
				end if;
			end if;
			output <= data(to_integer(unsigned(readadd)));
		end process;
end beh;


