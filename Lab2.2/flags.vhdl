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
	Z <= not(S(0) and S(1) and S(2) and S(3) and S(4) and S(5) and S(6) and S(7) and S(8) and S(9) and S(10) and S(11) and S(12) and S(13) and S(14) and S(15) and S(16) and S(17) and S(18) and S(19) and S(20) and S(21) and S(22) and S(23) and S(24) and S(25) and S(26) and S(27) and S(28) and S(29) and S(30) and S(31));
	N <= S(31);
	V <= c31 xor c32;
	C <= c32;
 	end process;
end beh;
