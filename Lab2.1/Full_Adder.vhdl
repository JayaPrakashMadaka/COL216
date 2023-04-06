library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Full_Adder is

port(
	a,b,Cin : in std_logic;
	Cout,s : out std_logic);
	
end Full_Adder;

Architecture beh1 of Full_Adder is

begin 
	s <= a xor b xor Cin;
	Cout <= (a and b) or (b and Cin ) or (a and Cin);
end beh1;
