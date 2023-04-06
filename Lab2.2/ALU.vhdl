library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is 

port(
	a,b,cin,aai,abi,oai,obi,nbi,o1,o2 : in std_logic;
	cout,sout		       : out std_logic);
	
end ALU;
	
architecture beh4 of ALU is 

component Full_Adder
	port(A,B,Cin : in std_logic;
		Cout,S : out std_logic);
end component; 

component MUL_2 
	port(
		a,b : in std_logic;
		c   : in std_logic;
		o   : out std_logic);
end component;

component MUL_4 
	port(
		a,b,c,d,o1,o2 : in std_logic;
		s	      : out std_logic);	
end component;

signal aao : std_logic;
signal bbo : std_logic;
signal aout : std_logic;
signal obo : std_logic;
signal oao : std_logic;
signal anot : std_logic;
signal bnot : std_logic;
signal aandb : std_logic;
signal oaoorobo : std_logic;
signal axorb : std_logic;
signal nbo : std_logic;


begin 
	anot <= not(a);
	bnot <= not(b);
	oaoorobo <= oao or obo; 
	aandb <= a and nbo;
	axorb <= a xor b; 
	c0: MUL_2 port map(a, anot,aai,aao );
	c1: MUL_2 port map(b ,bnot,abi,bbo);
	c2: Full_Adder port map(aao,bbo,cin,cout,aout);
	c3: MUL_2 port map(a,'0', oai,oao);
	c4: MUL_2 port map(b,bnot,obi,obo);
	c5: MUL_2 port map(b,bnot,nbi,nbo);
	c6: MUL_4 port map(aandb , oaoorobo,axorb , aout , o1,o2, sout);
	
end beh4;
