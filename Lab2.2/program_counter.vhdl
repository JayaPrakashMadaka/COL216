library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity program_counter is

port(
	PC	: in std_logic_vector(31 downto 0);
	Instr	: in std_logic_vector(31 downto 0);
	Z	: in std_logic;
	PCnew	: out std_logic_vector(31 downto 0));

end program_counter;

architecture beh of program_counter is

signal F : std_logic_vector(1 downto 0);
signal S_offset  : std_logic_vector(23 downto 0);
signal Cond	 : std_logic_vector(3 downto 0);
signal S_ext	: std_logic_vector(5 downto 0);
signal predicate : std_logic;

begin
	process(PC,Instr,Z)
	begin
			F <= Instr(27 downto 26);
			S_offset <= Instr(23 downto 0);
			Cond <= Instr(31 downto 28);
			if(Instr(23) = '1') then
				S_ext <= "111111";
			else
				S_ext <= "000000";
			end if;
		
			if(Cond = "0000") then
				predicate <= Z;
			elsif(Cond = "0001") then
				predicate <= not(Z);
			else
				predicate <= '1';
			end if;
		
			if(F = "10") then 
				if(predicate = '1') then 
					PCnew <= std_logic_vector(signed(PC) + signed(S_ext & S_offset & "00"));
				elsif(predicate = '0') then
					PCnew <= std_logic_vector(signed(PC) + 4);
				end if;
			else
				PCnew <= std_logic_vector(signed(PC) + 4);
			end if;
	end process;
end beh;
