library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Condition_Checker is

port(
	opr	: in std_logic;
	Instr	: in std_logic_vector(31 downto 0);
	Z	: in std_logic;
	N	: in std_logic;
	V	: in std_logic;
	C	: in std_logic;
	Cond	: out std_logic);

end Condition_Checker;

architecture beh of Condition_Checker is

signal Co : std_logic_vector(3 downto 0) := "0000";
signal Cval : std_logic := '0';

begin
	process(opr,Instr,Z,N,V,C) 	
	begin
	  if(opr = '1') then
		Co <= Instr(31 downto 28);
			
		if(Co = "0000") then 
			Cval <= Z;
		elsif(Co = "0001") then 
			Cval <= not(Z);
		elsif(Co = "0010") then
			Cval <= C;
		elsif(Co = "0011") then
			Cval <= not(C);
		elsif(Co = "0100") then
			Cval <= N;
		elsif(Co = "0101" ) then
			Cval <= not(N);
		elsif(Co = "0110" ) then
			Cval <= V;
		elsif(Co = "0111" ) then 
			Cval <= not(V);
		elsif(Co = "1000" ) then
			Cval <= C and not(Z);
		elsif(Co = "1001") then
			Cval <= not(C and not(Z));
		elsif(Co = "1010") then
			Cval <= N xor V;
		elsif(Co = "1011") then
			Cval <= not(N xor V);
		elsif(Co = "1100") then
			Cval <= not(Z) and (N xor V);
		elsif(Co = "1101") then
			Cval <= not( not(Z) and (N xor V));
		else
			Cval <= '1';
		end if;
	  end if;
	end process;
	Cond <= Cval;
end beh;
