library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_32 is

port(
	A,B : in std_logic_vector(31 downto 0);
	O : in std_logic_vector(3 downto 0);
	Cin : in std_logic;
	Cout : out std_logic;
	S : out std_logic_vector(31 downto 0));
		
end ALU_32;

architecture beh of ALU_32 is

component ALU
	port(
		a,b,cin,aai,abi,oai,obi,nbi,o1,o2 : in std_logic;
		cout,sout		       : out std_logic);
end component;

signal o1 : std_logic;
signal o2 : std_logic;
signal abi : std_logic;
signal aai: std_logic;
signal nbi : std_logic;
signal oai : std_logic;
signal obi : std_logic;
signal C : std_logic_vector(31 downto 0);

begin 
	o1 <= (not(O(3)) and O(2)) or ( not(O(2)) and O(1)) or ( not(O(2)) and not(O(1)) and O(0));
	o2 <= (not(O(3)) and O(2)) or (not(O(2)) and O(1)) or (O(3) and O(2) and not(O(1))) or (O(3) and O(2) and O(1) and O(0));
	aai <= not(O(3)) and O(1) and O(0);
	abi <= (not(O(3)) and O(1) and not(O(0))) or (O(3) and not(O(2)) and O(1) and not(O(0)));
	nbi <= O(3) and O(2) and O(1) and not(O(0));
	oai <= O(3) and O(2) and O(0);
	obi <= O(3) and O(2) and O(0) and O(1);
	
	comp0 : ALU port map(A(0),B(0),Cin,aai,abi,oai,obi,nbi,o1,o2,C(0),S(0));
	comp1to30 : for i in 1 to 30 generate
		ck : ALU port map(A(i),B(i),C(i-1),aai,abi,oai,obi,nbi,o1,o2,C(i),S(i));
	end generate;
	comp31 : ALU port map(A(31),B(31),C(30),aai,abi,oai,obi,nbi,o1,o2,C(31),S(31));
	Cout <= C(31);
end beh;
