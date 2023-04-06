library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity flags is

port
(	S		: in std_logic_vector(31 downto 0);
	c31		: in std_logic;
	c32		: in std_logic;
	Z		: out std_logic;
	N		: out std_logic;
	V		: out std_logic;
	C		: out std_logic);

end flags;

architecture beh of flags is

begin 
	process(S,c31,c32)
	begin
		if(S = X"00000000") then
			Z <= '1';
		else
			Z <= '0';
		end if;
		N <= S(31);
		V <= c31 xor c32;
		C <= c32;
 	end process;
end beh;
