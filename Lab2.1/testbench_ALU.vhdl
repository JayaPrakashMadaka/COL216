-- Testbench 
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench_ALU is
-- empty
end testbench_ALU; 

architecture tb of testbench_ALU is

-- DUT component
component  ALU_32 is
port(
	A,B : in std_logic_vector(31 downto 0);
	O : in std_logic_vector(3 downto 0);
	Cin : in std_logic;
	Cout : out std_logic;
	S : out std_logic_vector(31 downto 0));
	
end component;

signal A,B,S : std_logic_vector(31 downto 0);
signal O : std_logic_vector(3 downto 0);
signal Cin,Cout : std_logic;

begin

  -- Connect DUT
  DUT: ALU_32 port map(A,B,O,Cin,Cout,S);

  process
  begin
    A <= "00000000000000000000000000000001";
    B <= "00000000000000000000000000000001";
    O <= "0100";
    Cin <= '0';
    wait for 1 ns;
    A <= "00000000000000000000000000000001";
    B <= "00000000000000000000000000000001";
    O <= "0010";
    Cin <= '1';
    wait for 1 ns;
    A <= "00000000000000000000000000000001";
    B <= "00000000000000000000000000000011";
    O <= "0011";
    Cin <= '1';
     wait for 1 ns;
    A <= "00000000000000000000000000000001";
    B <= "00000000000000000000000000000001";
    O <= "1010";
    Cin <= '1';
     wait for 1 ns;
    A <= "00000000000000000000000000000001";
    B <= "00000000000000000000000000000001";
    O <= "1011";
    Cin <= '0';
    wait for 1 ns;
    A <= "00000000000000001001000100101011";
    B <= "00000000010001000000010010101001";
    O <= "0000";
    Cin <= '0';
    wait for 1 ns;
    A <= "00000000000000001001000100101011";
    B <= "00000000010001000000010010101001";
    O <= "0001";
    Cin <= '0';
    wait for 1 ns;
    A <= "00000000000000000000000000000001";
    B <= "00000000000000000000000000000001";
    O <= "1101";
    Cin <= '0';
    wait for 1 ns;
    A <= "00000000000000001001000100101011";
    B <= "00000000010001000000010010101001";
    O <= "1111";
    Cin <= '0';
    A <= "00000000000000000000000000000001";
    B <= "00000000000000000000000000000001";
    O <= "1001";
    Cin <= '0';
    wait for 1 ns;
    A <= "00000000000000001001000100101011";
    B <= "00000000010001000000010010101001";
    O <= "1000";
    Cin <= '0';
    A <= "00000000010000101001000100101011";
    B <= "00000000010001000000010010101001";
    O <= "0110";
    Cin <= '1';
    A <= "00000000010000101001000100101011";
    B <= "00000000010001000000010010101001";
    O <= "0101";
    Cin <= '1';
    A <= "00000000000000001001000100101011";
    B <= "00000000010001000000010010101001";
    O <= "1001";
    Cin <= '0';
    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
