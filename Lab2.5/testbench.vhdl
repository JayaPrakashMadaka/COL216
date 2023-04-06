library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component processor is
port(
  clk1,clk2,clk3,clk4,clk5,clk6,clk7,clk8,clk9,clk10: in std_logic;
  reset: in std_logic);
end component;

signal clk1,clk2,clk3,clk4,clk5,clk6,clk7,clk8,clk9,clk10,reset: std_logic;

begin

  -- Connect DUT
  DUT: processor port map(clk1,clk2,clk3,clk4,clk5,clk6,clk7,clk8,clk9,clk10,reset);
  process
  begin
    reset <='1'; 
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    reset <= '0'; 
    clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
    
        clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
        clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
        clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
        clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
        clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
        clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
        clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
        clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
        clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
        clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
        clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
    
        clk1 <= '1';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '1';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '1';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '1';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '1';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '1';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '1';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '1';
    clk9 <= '0';
    clk10 <= '0';
    wait for 1 ns;
    
    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '1';
    clk10 <= '0';
    wait for 1 ns;

    clk1 <= '0';
    clk2 <= '0';
    clk3 <= '0';
    clk4 <= '0';
    clk5 <= '0';
    clk6 <= '0';
    clk7 <= '0';
    clk8 <= '0';
    clk9 <= '0';
    clk10 <= '1';
    wait for 1 ns;
  
    
    
    assert false report "Test done." severity note;
    wait;
  end process;
end tb;

