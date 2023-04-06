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
signal A1 : std_logic_vector(32 downto 0) := "000000000000000000000000000000000";
signal B1 : std_logic_vector(32 downto 0) := "000000000000000000000000000000000";
signal S1 : std_logic_vector(32 downto 0) := "000000000000000000000000000000000";
signal Sval : std_logic_vector(31 downto 0) := X"00000000";
signal Cval : std_logic := '0';
begin
	process(A,B,O,Cin)
		begin
			A1 <= A(31)&A;
			B1 <= B(31)&B;
			S1 <=std_logic_vector(unsigned(A1)+unsigned(B1));
			if(O = "0000") then
				Sval <= A and B;
				Cval <= '0';
			elsif(O="0001") then
				Sval <= A xor B;
				Cval <= '0';
			elsif(O="0010") then
				Sval <= std_logic_vector(signed(A)-signed(B));
				Cval <= S1(32);
			elsif(O="0011") then
				Sval <= std_logic_vector(signed(B)-signed(A));
				Cval <= S1(32);
			elsif(O="0100") then
				Sval <= std_logic_vector(signed(A)+signed(B));
				Cval <= S1(32);
			elsif(O="0101")then
				if(Cin = '1') then
					Sval <= std_logic_vector(signed(A)+signed(B)+1);
				else
					Sval <= std_logic_vector(signed(A)+signed(B));
				end if;
				Cval <= S1(32);
			elsif(O="0110") then
				if(Cin ='1')then
					Sval <= std_logic_vector(signed(A)-signed(B)+1);
				else
					Sval <= std_logic_vector(signed(A)-signed(B));
				end if;
				Cval <= S1(32);
			elsif(O="0111") then
				if(Cin = '1') then
					Sval <= std_logic_vector(signed(B)-signed(A)+1);
				else
					Sval <= std_logic_vector(signed(B)-signed(A));
				end if;
				Cval <= S1(32);
			elsif(O="1000") then
				Sval <= A and B;
				Cval <= '0';
			elsif(O="1001")then
				Sval <= A xor B;
				Cval <= '0';
			elsif( O= "1010")then
				Sval <= std_logic_vector(signed(A)-signed(B));
				Cval <= S1(32);
			elsif( O= "1011") then
				Sval <= std_logic_vector(signed(A)+signed(B));
				Cval <= S1(32);
			elsif(O="1100")then
				Sval <= A or B;
				Cval <= '0';
			elsif(O="1101") then
				Sval <= B;
				Cval <= '0';
			elsif(O="1110")then
				Sval <= A and (not(B));
				Cval <= '0';
			elsif(O="1111")then
				Sval <= not(B);
				Cval <= '0';
			end if;
		end process;	
		S <= Sval;
		Cout <= Cval;
end beh;
