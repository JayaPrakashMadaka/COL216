library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity data_memory is   
port
(
	inputm		: in std_logic_vector(31 downto 0);
	readaddm	: in std_logic_vector(7 downto 0);
	writeaddm	: in std_logic_vector(7 downto 0);
	writeEn	: in std_logic_vector(3 downto 0);
	output		: out std_logic_vector(31 downto 0)
	);
end data_memory;

architecture beh of data_memory is
	type	datamemory is array(0 to 255) of std_logic_vector(31 downto 0);
	signal	data  : datamemory := (0=>X"E3A00005",1=>X"E1A00620",2=>X"E3A01005",3=>X"E1A011E1",4=>X"E5801000",5=>X"E2811002",6=>X"E5C01004",7=>X"E5902000",8=>X"E5D03004",9=>X"E1520003",others=>X"00000000");
	signal	load  : std_logic_vector(31 downto 0) := X"00000000";
	signal  ans  : std_logic_vector(31 downto 0) := X"00000000";
	begin
		dataMem : process(inputm,readaddm,writeaddm)
		begin
				if(writeEn ="1111") then 
					ans <= inputm;
					
				elsif(writeEn = "1000") then
					load <= inputm and "11111111000000000000000000000000";
					ans <=  std_logic_vector(shift_right(unsigned(load),24));
					
				elsif(writeEn = "0100") then
					load <= inputm and "00000000111111110000000000000000";
					ans <= std_logic_vector(shift_right(unsigned(load),16));
					
				elsif(writeEn = "0010") then 
					load <= inputm and "00000000000000001111111100000000";
					ans <= std_logic_vector(shift_right(unsigned(load),8));
					
				elsif(writeEn = "0001") then 
					load <= inputm and "00000000000000000000000011111111";
					ans <= load;
				elsif(writeEn = "1100") then
					load <= inputm and "11111111111111110000000000000000";
					ans <= std_logic_vector(shift_right(unsigned(load),16));
				elsif(writeEn = "0011") then
					load <= inputm and "00000000000000001111111111111111";
					ans <= load;
				end if;
			data(to_integer(unsigned(writeaddm))) <= ans;
			output <= data(to_integer(unsigned(readaddm)));			 	
		end process;
end beh;


