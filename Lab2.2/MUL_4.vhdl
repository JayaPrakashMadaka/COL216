library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MUL_4 is

port(
	a,b,c,d,o1,o2 : in std_logic;
	s	      : out std_logic);
	
end MUL_4;
	
architecture beh3 of MUL_4 is

begin
	s <= ( a and not(o1)  and not(o2) ) or (b and not(o1) and o2) or ( c and o1 and not(o2)) or (d and o1 and o2);
	
end beh3;
