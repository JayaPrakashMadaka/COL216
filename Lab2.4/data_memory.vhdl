library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity data_memory is   
port
(
	inputm		: in std_logic_vector(31 downto 0);
	readaddm	: in std_logic_vector(5 downto 0);
	writeaddm	: in std_logic_vector(5 downto 0);
	writeEn	: in std_logic;
	writeEn1	: in std_logic;
	writeEn2	: in std_logic;
	writeEn3	: in std_logic;
	writeEn4	: in std_logic;
	output		: out std_logic_vector(31 downto 0)
	);
end data_memory;

architecture beh of data_memory is
	type	datamemory is array(0 to 63) of std_logic_vector(31 downto 0);
	signal	data  : datamemory := (0=> X"E3A00000", 1=>X"E3A01001", 2=>X"E2411001",3=>X"E3A03000",4=>X"E3A04001",
5=>X"E1802001", 6=>X"E0645003", 7=>X"E0A41003",8=>X"E0C42003",9=>X"E0E41003", 10=>X"E1110002", 11=>X"E1320003",12=>X"E1A01002",13=>X"E1C11003",
14=>X"E1E01003",15=>X"E3A0000A",16=>X"E3A01005", 17=>X"E5801000",18=>X"E2811002",19=>X"E5801004",20=>X"E5902000",21=>X"E5903004", 22=>X"E0434002",others=>X"00000000");
	signal	load  : std_logic_vector(31 downto 0) := X"00000000";
	signal  ans   : std_logic_vector(31 downto 0) := X"00000000";
	begin
		dataMem : process(inputm,readaddm,writeaddm,writeEn,writeEn1,writeEn2,writeEn3,writeEn4)
		
		begin
				if(writeEn ='1') then 
					data(to_integer(unsigned(writeaddm))) <= inputm;
				elsif(writeEn1 = '1') then
					load <= inputm and "11111111000000000000000000000000";
					ans <=  std_logic_vector(shift_right(unsigned(load),24));
					data(to_integer(unsigned(writeaddm))) <= ans;
				elsif(writeEn2 = '1') then
					load <= inputm and "00000000111111110000000000000000";
					ans <= std_logic_vector(shift_right(unsigned(load),16));
					data(to_integer(unsigned(writeaddm))) <= ans;
				elsif(writeEn3 = '1') then 
					load <= inputm and "00000000000000001111111100000000";
					ans <= std_logic_vector(shift_right(unsigned(load),8));
					data(to_integer(unsigned(writeaddm))) <= ans;
				elsif(writeEn4 = '1') then 
					load <= inputm and "00000000000000000000000011111111";
					data(to_integer(unsigned(writeaddm))) <= load;
				end if;			
			output <= data(to_integer(unsigned(readaddm)));
		end process;
end beh;


