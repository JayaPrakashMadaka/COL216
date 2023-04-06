library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register_file is   
port
    (
    input		: in  std_logic_vector(31 downto 0);
    writeEnable   	: in std_logic;
    read1       	: in std_logic_vector(3 downto 0);
    read2       	: in std_logic_vector(3 downto 0);
    writeadd	   	: in std_logic_vector(3 downto 0);
    output1          	: out std_logic_vector(31 downto 0);
    output2       	: out std_logic_vector(31 downto 0)
    );
end register_file;

architecture beh of register_file is
	signal o1,o2 : std_logic_vector(31 downto 0) := X"00000000";
	type registerFile is array(0 to 15) of std_logic_vector(31 downto 0);
	signal registers : registerFile;
	begin

   	 regFile: process(input,writeEnable,writeadd,read1,read2)
   	 
    	begin
            		if(writeEnable = '1') then
                		registers(to_integer(unsigned(writeadd))) <= input;
            		end if;
            	o1 <= registers(to_integer(unsigned(read1)));
		o2 <= registers(to_integer(unsigned(read2)));
         end process;
         output1 <= o1;
         output2 <= o2;		
end beh;
