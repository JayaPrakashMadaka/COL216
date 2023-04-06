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
	signal	data  : datamemory := (0=>X"E3A00001",1=>X"E3A01003",2=>X"E1A00640",3=>X"E08140A2",4=>X"E0441261",5=>X"E1500001",6=>X"1A000000",7=>X"E2800001",8=>X"E0401001",others=>X"00000000");
	signal	load  : std_logic_vector(31 downto 0) := X"00000000";
	signal  ans ,o  : std_logic_vector(31 downto 0) := X"00000000";
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
			o <= data(to_integer(unsigned(readaddm)));
		end process;
		output <= o;
end beh;


