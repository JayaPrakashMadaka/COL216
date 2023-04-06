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

signal Zval : std_logic := '0';
signal Vval : std_logic := '0';
signal Cval : std_logic := '0';
signal Nval : std_logic := '0';

begin 
	process(S,c31,c32)
	begin
		if(S = X"00000000") then
			Zval <= '1';
		else
			Zval <= '0';
		end if;
		Nval <= S(31);
		Vval <= c31 xor c32;
		Cval <= c32;
 	end process;
 	Z <= Zval;
	N <= Nval;
	C <= Cval;
	V <= Vval;
end beh;
