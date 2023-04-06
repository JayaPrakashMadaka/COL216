library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity processor is
port (
 clk1,clk2,clk3,clk4,clk5,clk6,clk7,reset : in std_logic
 );
end processor;

architecture beh of processor is

component register_file is
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
end component;

component data_memory is
port
(
	inputm		: in std_logic_vector(31 downto 0);
	readaddm	: in std_logic_vector(5 downto 0);
	writeaddm	: in std_logic_vector(5 downto 0);
	writeEn	: in std_logic;
	writeEn1	: in std_logic;
	writeEn2	: in std_logic;
	writeEn3	: in std_logic;
	writeEn4	: in std_logic;
	output		: out std_logic_vector(31 downto 0)
	);
end component;

component ALU_32 is
port(
	A,B : in std_logic_vector(31 downto 0);
	O : in std_logic_vector(3 downto 0);
	Cin : in std_logic;
	Cout : out std_logic;
	S : out std_logic_vector(31 downto 0));
		
end component;

component flags is
port
(	S		: in std_logic_vector(31 downto 0);
	c31		: in std_logic;
	c32		: in std_logic;
	Z		: out std_logic;
	N		: out std_logic;
	V		: out std_logic;
	C		: out std_logic);

end component;

component Condition_Checker is
port(
	Instr	: in std_logic_vector(31 downto 0);
	Z	: in std_logic;
	N	: in std_logic;
	V	: in std_logic;
	C	: in std_logic;
	Cond	: out std_logic);

end component;

signal PC	: std_logic_vector (31 downto 0) := X"00000000";
signal Instr : std_logic_vector (31 downto 0):= X"00000000";
signal Z,N,V,C : std_logic := '0';

signal F : std_logic_vector (1 downto 0) := "00";
signal O : std_logic_vector (3 downto 0) := "0000";
signal Ubit, Lbit : std_logic := '0';
signal Imm : std_logic_vector (7 downto 0) := "00000000";
signal	I  : std_logic := '0';
signal Offset : std_logic_vector (11 downto 0) := "000000000000";
signal Rd, Rn, Rm : std_logic_vector(3 downto 0) := "0000";

signal input,output1,output2,A,B,S,output,inputm,C2: std_logic_vector(31 downto 0) := X"00000000";

signal readaddm,writeaddm : std_logic_vector(5 downto 0) := "000000";

signal    writeEnable,Cin,Cout,C30,writeEn,writeEn1,writeEn2,writeEn3,writeEn4,Cond  :  std_logic := '0';

signal    read1 ,read2 ,writeadd     	:  std_logic_vector(3 downto 0) := "0000";

signal S_offset  : std_logic_vector(23 downto 0) := "000000000000000000000000";
signal S_ext	: std_logic_vector(5 downto 0) := "000000";

signal con	: std_logic_vector(3 downto 0) :="0000";
signal Predicate : std_logic := '0';


signal	rA	:	std_logic_vector(31 downto 0) := X"00000000";
signal	rB	:	std_logic_vector(31 downto 0) := X"00000000";
signal rIR	:	std_logic_vector(31 downto 0) := X"00000000";
signal	rDR	:	std_logic_vector(31 downto 0) := X"00000000";
signal	rRES	:	std_logic_vector(31 downto 0) := X"00000000";
signal  PCvar	: 	std_Logic_vector(31 downto 0) := X"00000000";

begin
-- concurrent assignments for extracting instruction fields
	
	
	Comp1 : register_file port map(input,writeEnable,read1,read2,writeadd,output1,output2);
	Comp2 : ALU_32 port map(A,B,O,Cin,Cout,S);
	Comp3 : flags port map(S,C30,Cout,Z,N,V,C);
	Comp4 : data_memory port map(inputm,readaddm,writeaddm,writeEn,writeEn1,writeEn2,writeEn3,writeEn4,output);
 	Comp5 : Condition_Checker port map(Instr,Z,N,V,C,Cond);
	
	process(reset,clk1,clk2,clk3,clk4,clk5,clk6,clk7)
	begin
		F <= Instr (27 downto 26);
 		I <= Instr(25);
 		O <= Instr (24 downto 21);
		Ubit <= Instr (23);
 		Lbit <= Instr (20);
 		Imm <= Instr (7 downto 0);
 		Offset <= Instr (11 downto 0);
 		Rd <=Instr (15 downto 12);
		Rn <=Instr (19 downto 16);
 		Rm <=Instr (3 downto 0);
 		S_offset <= Instr(23 downto 0);
		C2 <= A xor B xor S;
 		c30 <= C2(0);
 		Con <= Instr(31 downto 28);
 		
 		if(Instr(23) = '1') then
			S_ext <= "111111";
		else
			S_ext <= "000000";
		end if;	
		if(Con = "0000") then
			predicate <= Z;
		elsif(Con = "0001") then
			predicate <= not(Z);
		else
			predicate <= '1';
		end if;
		
		if (reset = '1') then 
			PC <= X"00000000";
 		elsif(rising_edge(clk1)) then
 			if(F= "10") then
 				PC <= PCvar;
 			else
	 			PC <= S;
	 		end if;
			readaddm <= PC (7 downto 2);
		elsif(rising_edge(clk2)) then
			rIR <= output;
			Instr <= rIR;			
		elsif(rising_edge(clk3)) then			
 			if(I= '0') then
 				read1 <= Rn;
 				read2 <= Rm;
 				
 			elsif(I='1' or Lbit = '0') then
 				read1 <= Rn;
 				read2 <= Rd;
 			end if;
 			rA <= output1;
 			rB <= output2;
 		elsif(rising_edge(clk4)) then
 			if(F = "00" ) then
 				if(I ='0') then
 					A <= rA;
 					B <= rB;					
 				else
 					A <= rA;
 					B <= ("000000000000000000000000" & Imm);
 				end if;
 			elsif(F = "01") then
 				read1 <= Rn;
 				if(Ubit = '1') then
 					A <= output1;
 					B <= X"00000" & Offset;
 					O <= "0100"; 
 				else
 					A <= output1;
 					B <= X"00000" & Offset;
 					O <= "0010"; 
 				end if;
 			elsif(F= "10") then
 				if(Predicate = '1') then
 					A <= PC;
 					B <= S_ext & S_offset & "00";
 					O <= "0100";
 					--PCvar <= std_logic_vector(signed(PC)+signed(S_ext & S_offset & "00")+8);
 				else
 					A <= PC;
 					B <= "00000000000000000000000000000100";
 					O <= "0100";
 					
 				end if;
 			end if;
 			rRES <= S;	
 		elsif(rising_edge(clk5)) then		
 			if(F = "00") then
 				writeEnable <= '1';
 				input <= rRES;
 				writeadd <= Rd;
 			elsif(F = "01") then
 				if(Lbit = '1') then
 					readaddm <= rRES(7 downto 2);					
 				else
 					writeEn <= '1';
 					inputm <= rB;
 					writeaddm <= rRES(7 downto 2);
 				end if;
 			end if;
 			PCvar <= S;
 			rDR <= output;
 		elsif(rising_edge(clk6)) then
 			if(F="01" and Lbit = '1') then
				writeEnable <= '1';
 				input <= rDR; 
 				writeadd <= Rd;
 			end if;		
 		elsif(rising_edge(clk7)) then
 			if(F="00" or F="01") then
 				A <= PC;
 				B <= "00000000000000000000000000000100";
 				O <= "0100";								
 			end if;				
 		end if;
 	end process;
 end beh;





