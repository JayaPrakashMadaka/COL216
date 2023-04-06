library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity processor is
port (
 clock, reset : in std_logic
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

component program_memory is
port(
	readaddp	: in std_logic_vector(5 downto 0);
	outputp	: out std_logic_vector(31 downto 0));
	
end component;

component ALU_32 is
port(
	A,B : in std_logic_vector(31 downto 0);
	O : in std_logic_vector(3 downto 0);
	Cin : in std_logic;
	Cout : out std_logic;
	C30  : out std_logic;
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

component program_counter is
port(
	PC	: in std_logic_vector(31 downto 0);
	Instr	: in std_logic_vector(31 downto 0);
	Z	: in std_logic;
	PCnew	: out std_logic_vector(31 downto 0));

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

signal PC, Instr : std_logic_vector (31 downto 0);
signal Z,N,V,C : std_logic;

signal F : std_logic_vector (1 downto 0);
signal O : std_logic_vector (3 downto 0);
signal Ubit, Lbit : std_logic;
signal Imm : std_logic_vector (7 downto 0);
signal	I  : std_logic;
signal Offset : std_logic_vector (11 downto 0);
signal Rd, Rn, Rm : std_logic_vector(3 downto 0);

signal outputp,input,output1,output2,A,B,S,output,inputm,PCnew: std_logic_vector(31 downto 0);

signal readaddm,writeaddm, readaddp : std_logic_vector(5 downto 0);

signal    writeEnable,Cin,Cout,C30,writeEn,writeEn1,writeEn2,writeEn3,writeEn4,Cond  :  std_logic;

signal    read1 ,read2 ,writeadd     	:  std_logic_vector(3 downto 0);

signal DMadr32 : signed (31 downto 0);

begin
-- concurrent assignments for extracting instruction fields
		
	
	Comp1 : program_memory port map(readaddp,outputp);
	Comp2 : register_file port map(input,writeEnable,read1,read2,writeadd,output1,output2);
	Comp3 : ALU_32 port map(A,B,O,Cin,Cout,C30,S);
	Comp4 : flags port map(S,C30,Cout,Z,N,V,C);
	Comp5 : data_memory port map(inputm,readaddm,writeaddm,writeEn,writeEn1,writeEn2,writeEn3,writeEn4,output);
 	Comp6 : Condition_Checker port map(Instr,Z,N,V,C,Cond);
 	Comp7 : program_counter port map(PC,Instr,Z,PCnew);
	
	process(reset,clock)
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
		if (reset = '1') then 
			PC <= X"00000000";
 		elsif (rising_edge(clock)) then
			readaddp <= PC (7 downto 2);
 			Instr <= outputp;
 				if(F = "00") then
 					Cin <= (not(O(3)) and not(O(2)) and O(1)) or (O(3) and not(O(2)) and O(1) and not(O(0)));
 					if(I='0') then						
 						read1 <= Rn;
						read2 <= Rm;
						writeadd <= Rd;
 						A <= output1;
 						B <= output2;
 						input <= S;
 						writeEnable <= '1';
 					else
 						read1 <= Rn;
 						writeadd <= Rd;
 						A <= output1;
 						B <= ("000000000000000000000000" & Imm);
 						input <= S;
 						writeEnable <= '1';
 					end if;
 					PC <= PCnew;
 				elsif(F = "01") then 
 					if(Lbit = '1') then 
 						read1 <= Rn;
 						if(Ubit = '1') then
 							DMadr32 <= (signed(output1)+signed(X"00000" & Offset)); 
 						else
 							DMadr32 <= (signed(output1)-signed(X"00000" & Offset));
 						end if;
 						readaddm <= std_logic_vector(DMadr32(7 downto 2));
 						input <= output; 
 						writeadd <= Rd;
						writeEnable <= '1';
					else
						read1 <= Rd;
						inputm <= output1;
						if(Ubit = '1') then
 							DMadr32 <= (signed(output1)+signed(X"00000" & Offset)); 
 						else
 							DMadr32 <= (signed(output1)-signed(X"00000" & Offset));
 						end if;
 						writeaddm <= std_logic_vector(DMadr32(7 downto 2));
 						writeEn <= '1';
 					end if;
 					PC <= PCnew;
 				else
 					PC <= PCnew;
 				end if;
 		end if;
 	end process;
 end beh;





