library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity shifter is
port(
	I     : in std_logic;
	Vs    : in std_logic;
	T     : in std_logic_vector(1 downto 0);
	Cs    : in std_logic_vector(4 downto 0);
	var   : in std_logic_vector(31 downto 0);
	Sout  : out std_logic_vector(31 downto 0)
	);
end shifter;

architecture beh of shifter is

signal S	: std_logic := '0';
signal v1     : std_logic_vector(31 downto 0);
signal temp   : std_logic_vector(31 downto 0);

begin
	process(I,Vs,T,Cs,var)
	begin			
			v1 <= var;
			if(I = '0') then
				if(T = "00" ) then
					if(Cs(0) ='1') then
						v1 <= v1(30 downto 0) & '0';
					end if;
					if(Cs(1) = '1') then
						v1 <= v1(29 downto 0) & "00";
					end if;
					if(Cs(2) = '1') then
						v1 <= v1(27 downto 0) & "0000";
					end if;
					if(Cs(3) = '1') then
						v1 <= v1(23 downto 0) & "00000000";
					end if;
					if(Cs(4) = '1' ) then
						v1 <= v1(15 downto 0) & "0000000000000000";
					end if;
					temp <= v1;
				elsif(T = "01") then
					if(Cs(0) ='1') then
						v1 <= '0' & v1(30 downto 0);
					end if;
					if(Cs(1) = '1') then
						v1 <=  "00" & v1(29 downto 0);
					end if;
					if(Cs(2) = '1') then
						v1 <= "0000" & v1(27 downto 0);
					end if;
					if(Cs(3) = '1') then
						v1 <= "00000000" &  v1(23 downto 0) ;
					end if;
					if(Cs(4) = '1' ) then
						v1 <= "0000000000000000" & v1(15 downto 0);
					end if;
					temp <= v1;
				elsif(T = "10") then
					S <= var(31);
					if(Cs(0) ='1') then
						v1 <= S & v1(30 downto 0);
					end if;
					if(Cs(1) = '1') then
						v1 <=  S & S & v1(29 downto 0);
					end if;
					if(Cs(2) = '1') then
						v1 <= S & S & S & S & v1(27 downto 0);
					end if;
					if(Cs(3) = '1') then
						v1 <= S & S & S & S & S & S & S & S & v1(23 downto 0) ;
					end if;
					if(Cs(4) = '1' ) then
						v1 <= S & S & S & S & S & S & S & S & S & S & S & S & S & S & S & S  & v1(15 downto 0);
					end if;
					temp <= v1;
				elsif (T = "11") then
					if(Cs(0) = '1') then
						v1 <= v1(30 downto 0) & v1(31);
					end if;
					if(Cs(1) = '1' ) then
						v1 <= v1(29 downto 0) & v1(31) & v1(30);
					end if;
					if(Cs(2) = '1') then
						v1 <= v1(27 downto 0) & v1(31) & v1(30) & v1(29) & v1(28);
					end if;
					if(Cs(3) = '1') then
						v1 <= v1(23 downto 0) & v1(31) & v1(30) & v1(29) & v1(28) & v1(27) & v1(26) & v1(25) & v1(24);
					end if;
					if(Cs(4) = '1') then
						v1 <= v1(15 downto 0) & v1(31) & v1(30) & v1(29) & v1(28) & v1(27) & v1(26) & v1(25) & v1(24) & v1(23) & v1(22) & v1(21) & v1(20) & v1(19) & v1(18) & v1(17) & v1(16);
					end if;
					temp <= v1;
				end if;
			elsif(I = '1') then
					if(Cs(0) = '1') then
						v1 <= v1(29 downto 0) & v1(31) & v1(30);
					end if;
					if(Cs(1) = '1') then
						v1 <= v1(27 downto 0) & v1(31) & v1(30) & v1(29) & v1(28);
					end if;
					if(Cs(2) = '1') then
						v1 <= v1(23 downto 0) & v1(31) & v1(30) & v1(29) & v1(28) & v1(27) & v1(26) & v1(25) & v1(24);
					end if;
					if(Cs(3) = '1') then
						v1 <= v1(15 downto 0) & v1(31) & v1(30) & v1(29) & v1(28) & v1(27) & v1(26) & v1(25) & v1(24) & v1(23) & v1(22) & v1(21) & v1(20) & v1(19) & v1(18) & v1(17) & v1(16);
					end if;
					if(Cs(4) = '1') then
						v1 <= v1(31) & v1(30) & v1(29) & v1(28) & v1(27) & v1(26) & v1(25) & v1(24) & v1(23) & v1(22) & v1(21) & v1(20) & v1(19) & v1(18) & v1(17) & v1(16) & v1(15) & v1(14) & v1(13) & v1(12) & v1(11) & v1(10) & v1(9) & v1(8) & v1(7) & v1(6) & v1(5) & v1(4) & v1(3) & v1(2) & v1(1) & v1(0);	
					end if;
					temp <= v1;
			end if;		
	end process;
	Sout <= temp;
end beh;
