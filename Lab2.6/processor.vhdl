library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity processor is
port (
 clk1,clk2,clk3,clk4,clk5,clk6,clk7,clk8,clk9,clk10,clk11,clk12,clk13,reset : in std_logic
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
	readaddm	: in std_logic_vector(7 downto 0);
	writeaddm	: in std_logic_vector(7 downto 0);
	writeEn	: in std_logic_vector(3 downto 0);
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
	opr	: in std_logic;
	Instr	: in std_logic_vector(31 downto 0);
	Z	: in std_logic;
	N	: in std_logic;
	V	: in std_logic;
	C	: in std_logic;
	Cond	: out std_logic);

end component;

component shifter is
port(
	I     : in std_logic;
	T     : in std_logic_vector(1 downto 0);
	Cs    : in std_logic_vector(4 downto 0);
	var : in std_logic_vector(31 downto 0);
	Sout : out std_logic_vector(31 downto 0)
	);
end component;

signal PC	: std_logic_vector (31 downto 0) := X"00000000";
signal Instr : std_logic_vector (31 downto 0):= X"00000000";
signal Z,N,V,C : std_logic := '0';

signal F : std_logic_vector (1 downto 0) := "00";
signal O : std_logic_vector (3 downto 0) := "0000";
signal Ubit, Lbit,Wbit,Pbit,Bbit : std_logic := '0';
signal Imm : std_logic_vector (6 downto 0) := "0000000";
signal	I  : std_logic := '0';
signal Offset : std_logic_vector (11 downto 0) := "000000000000";
signal Rd, Rn, Rm ,Rs: std_logic_vector(3 downto 0) := "0000";

signal input,output1,output2,A,B,S,output,inputm,C2: std_logic_vector(31 downto 0) := X"00000000";

signal readaddm,writeaddm : std_logic_vector(7 downto 0) := "00000000";

signal    writeEnable,Cin,Cout,C30,Cond  :  std_logic := '0';
signal writeEn : std_logic_vector(3 downto 0) := "0000";

signal    read1 ,read2 ,writeadd     	:  std_logic_vector(3 downto 0) := "0000";

signal S_offset  : std_logic_vector(29 downto 0) := "000000000000000000000000000000";
signal S_ext	: std_logic_vector(5 downto 0) := "000000";

signal con	: std_logic_vector(3 downto 0) :="0000";
signal Predicate : std_logic := '0';
signal opr : std_logic := '0';
signal Sout,var : std_logic_vector(31 downto 0) := X"00000000";
signal T ,H: std_logic_vector(1 downto 0) := "00";
signal Vs : std_logic := '0';
signal Cs : std_logic_vector(4 downto 0) := "00000";


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
	Comp4 : data_memory port map(inputm,readaddm,writeaddm,writeEn,output);
 	Comp5 : Condition_Checker port map(opr,Instr,Z,N,V,C,Cond);
 	Comp6 : shifter port map(I,T,Cs,var,Sout);
	
	process(reset,clk1,clk2,clk3,clk4,clk5,clk6,clk7,clk8,clk9,clk10,clk11,clk12,clk13)
	begin
		F <= Instr (27 downto 26);
 		I <= Instr(25);
 		O <= Instr (24 downto 21);
		Ubit <= Instr (23);
 		Lbit <= Instr (20);
 		Wbit <= Instr(21);
 		Bbit <= Instr(22);
 		Pbit <= Instr(24);
 		H <= Instr(6 downto 5);
 		Imm <= Instr (6 downto 0);
 		Rd <=Instr (15 downto 12);
		Rn <=Instr (19 downto 16);
 		Rm <=Instr (3 downto 0);
 		Rs <= Instr(11 downto 8);
 		T <= Instr(6 downto 5);
		Vs <= Instr(4);
 		S_offset <= Instr(29 downto 0);
		C2 <= A xor B xor S;
 		c30 <= C2(0);
 		Con <= Instr(31 downto 28);
 		S_ext <= Instr(23)&Instr(23)&Instr(23)&Instr(23)&Instr(23)&Instr(23);
 		
		if (reset = '1') then 
			PC <= X"00000000";
 		elsif(rising_edge(clk1)) then
			readaddm <= PC (9 downto 2);	
		elsif(rising_edge(clk2)) then
			rIR <= output;
			Instr <= rIR;			
		elsif(rising_edge(clk3)) then
 			read1 <= Rm;
 			read2 <= Rs;
 			var <= output1;
 		elsif(rising_edge(clk4)) then
 			opr <= '1';
 			if(I ='0' and Vs='0') then
	 			Cs <= Instr(11 downto 7);
	 		elsif(I ='0' and Vs = '1') then 
	 			Cs <= output2(4 downto 0);
	 		elsif(I ='1') then
	 			Cs <= Instr(11 downto 7);
	 			var <= ("0000000000000000000000000" & Imm);
	 		end if;		
 		elsif(rising_edge(clk5)) then
 			rB <= Sout;
 			read1 <= Rn;
 			rA <= output1;	
 		elsif(rising_edge(clk6)) then
 			if(F = "00" and I='0') then
 					Cin <= (not(O(3)) and not(O(2)) and O(1)) or (O(3) and not(O(2)) and O(1) and not(O(0)));
 					A <= rA;
 					B <= rB;					
 			elsif(F ="00" and I='1') then
 					Cin <= (not(O(3)) and not(O(2)) and O(1)) or (O(3) and not(O(2)) and O(1) and not(O(0)));
 					A <= rA;
 					B <= rB;
 			elsif(F = "01" and Ubit = '1') then
 					A <= rA;
 					B <= rB;
 					O <= "0100"; 
 			elsif(F = "01" and Ubit = '0') then
 					A <= rA;
 					B <= rB;
 					O <= "0010"; 
 			elsif(F= "10" and Cond = '1') then
 					A <= PC;
 					B <= S_offset & "00";
 					O <= "0100";
 					--PCvar <= std_logic_vector(unsigned(PC)+unsigned(S_offset & "00")+8);
 			elsif(F= "10" and Cond = '0') then
 					A <= PC;
 					B <= "00000000000000000000000000000100";
 					O <= "0100";
 			end if;
 			rRES <= S;
 			PCvar <= S;
 			writeEnable <= '1';
 		elsif(rising_edge(clk7)) then	
 			if(Wbit ='1' and Pbit='1') then
 				input <= rRES;
 				writeadd <= Rm;
 			elsif(Wbit = '1' and Pbit='0') then
 				input<= rA;
 				writeadd <= Rm;
 			end if;
 		elsif(rising_edge(clk8)) then
 			if(Lbit = '0' and Bbit = '0') then
 				writeEn <= "1111";
 			elsif(Lbit = '0' and Bbit = '1' and rRES(0) = '0' and rRES(1) ='0') then
 				writeEn <= "0001";
 			elsif(Lbit = '0' and Bbit = '1' and rRES(0) = '1' and rRES(1) ='0') then
 				writeEn <= "0010";
 			elsif(Lbit = '0' and Bbit = '1' and rRES(0) = '0' and rRES(1) ='1') then
 				writeEn <= "0100";
 			elsif(Lbit = '0' and Bbit = '1' and rRES(0) = '1' and rRES(1) ='1') then
 				writeEn <= "1000";
 			elsif(Lbit = '0' and Bbit ='0' and H = "01" and rRES(1) ='1') then
 				writeEn <= "1100";
 			elsif(Lbit = '0' and Bbit ='0' and H = "01" and rRES(0) ='1') then
 				writeEn <= "0011";
 			end if;
 		elsif(rising_edge(clk9)) then		
 			if(F = "00") then
 				input <= rRES;
 				writeadd <= Rd;
 			elsif(F = "01" and Lbit = '1') then
 					readaddm <= rRES(9 downto 2);					
 			elsif(F = "01" and Lbit = '0') then
 					inputm <= rB;
 					writeaddm <= rRES(9 downto 2);
 			end if;
 		elsif(rising_edge(clk10)) then
 			rDR <= output;
 			if(Lbit = '1' and Bbit = '0') then
 				rDR <= output;
 			elsif(Lbit = '1' and Bbit = '1' and rRES(0) = '0' and rRES(1) ='0' and H="01") then
 				rDR <= output and "00000000000000001111111111111111";
 			elsif(Lbit = '1' and Bbit = '1' and rRES(0) = '0' and rRES(1) ='1' and H="01") then
 				rDR <= std_logic_vector(shift_right(unsigned(output and "11111111111111110000000000000000"),16));
 			elsif(Lbit = '1' and Bbit = '1' and rRES(0) = '0' and rRES(1) ='0' and H="11") then
 				rDR <= rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&output(15)&output(14)&output(13)&output(12)&output(11)&output(10)&output(9)&output(8)&output(7)&output(6)&output(5)&output(4)&output(3)&output(2)&output(1)&output(0);
 			elsif(Lbit = '1' and Bbit = '1' and rRES(0) = '0' and rRES(1) ='1' and H="11") then
 				rDR <= rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&output(31)&output(30)&output(29)&output(28)&output(27)&output(26)&output(25)&output(24)&output(23)&output(22)&output(21)&output(20)&output(19)&output(18)&output(17)&output(16);
 			elsif(Lbit = '1' and Bbit = '1' and rRES(0) = '1' and rRES(1) = '1' and H = "00") then
 				rDR <= std_logic_vector(shift_right(unsigned(output and "11111111000000000000000000000000"),24));
 			elsif(Lbit = '1' and Bbit = '1' and rRES(0) = '0' and rRES(1) = '1' and H = "00") then
 				rDR <= std_logic_vector(shift_right(unsigned(output and "00000000111111110000000000000000"),16));
 			elsif(Lbit = '1' and Bbit = '1' and rRES(0) = '1' and rRES(1) = '0' and H = "00") then
 				rDR <= std_logic_vector(shift_right(unsigned(output and "00000000000000001111111100000000"),8));
 			elsif(Lbit = '1' and Bbit = '1' and rRES(0) = '0' and rRES(1) = '0' and H = "00") then
 				rDR <= output and "00000000000000000000000011111111";
 			elsif(Lbit = '1' and Bbit = '1' and rRES(0) = '0' and rRES(1) = '0' and H = "10") then
 				rDR <= rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&rRES(7)&output(7)&output(6)&output(5)&output(4)&output(3)&output(2)&output(1)&output(0);
 			elsif(Lbit = '1' and Bbit = '1' and rRES(0) = '1' and rRES(1) = '0' and H = "10") then
 				rDR <= rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&rRES(15)&output(15)&output(14)&output(13)&output(12)&output(11)&output(10)&output(9)&output(8); 
 			elsif(Lbit = '1' and Bbit = '1' and rRES(0) = '0' and rRES(1) = '1' and H = "10") then
 				rDR <= rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&rRES(23)&output(23)&output(22)&output(21)&output(20)&output(19)&output(18)&output(17)&output(16); 
 			elsif(Lbit = '1' and Bbit = '1' and rRES(0) = '1' and rRES(1) = '1' and H = "10") then
 				rDR <= rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&rRES(31)&output(31)&output(30)&output(29)&output(28)&output(27)&output(26)&output(25)&output(24); 
 			end if;
 		elsif(rising_edge(clk11)) then
 			opr <= '0';
 			if(F="01" and Lbit = '1') then
 				input <= rDR; 
 				writeadd <= Rd;
 			end if;		
 		elsif(rising_edge(clk12)) then
 			if(F="00" or F="01") then
 				A <= PC;
 				B <= "00000000000000000000000000000100";
 				O <= "0100";							
 			elsif(F="10" and Cond='1') then
 				A <= PCvar;
 				B <= "00000000000000000000000000011000";
 				O <= "0100";
 			end if;
 		elsif(rising_edge(clk13)) then
 				writeEnable <= '0';
	 			PC <= S;			
 		end if;
 	end process;

 end beh;





