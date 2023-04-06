library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Condition_Checker is

port(
	Instr	: in std_logic_vector(31 downto 0);
	Z	: in std_logic;
	N	: in std_logic;
	V	: in std_logic;
	C	: in std_logic;
	Cond	: out std_logic);

end Condition_Checker;

architecture beh of Condition_Checker is

signal Co : std_logic_vector(3 downto 0);

begin
	process(Instr,Z,N,V,C) 	
	begin
		Co <= Instr(31 downto 28);
			
		if(Co = "0000") then 
			Cond <= Z;
		elsif(Co = "0001") then 
			Cond <= not(Z);
		elsif(Co = "0010") then
			Cond <= C;
		elsif(Co = "0011") then
			Cond <= not(C);
		elsif(Co = "0100") then
			Cond <= N;
		elsif(Co = "0101" ) then
			Cond <= not(N);
		elsif(Co = "0110" ) then
			Cond <= V;
		elsif(Co = "0111" ) then 
			Cond <= not(V);
		elsif(Co = "1000" ) then
			Cond <= C and not(Z);
		elsif(Co = "1001") then
			Cond <= not(C and not(Z));
		elsif(Co = "1010") then
			Cond <= N xor V;
		elsif(Co = "1011") then
			Cond <= not(N xor V);
		elsif(Co = "1100") then
			Cond <= not(Z) and (N xor V);
		elsif(Co = "1101") then
			Cond <= not( not(Z) and (N xor V));
		else
			Cond <= '1';
		end if;
	end process;
end beh;
