library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component processor is
port(
  clock: in std_logic;
  reset: in std_logic);
end component;

signal clock,reset: std_logic;

begin

  -- Connect DUT
  DUT: processor port map(clock,reset);

  process
  begin
    reset <= '1';
    wait for 1 ns;
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
  
    clock <= '1';
    reset<= '0';
    wait for 1 ns;

    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;

    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
   
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;

    clock <= '1';
    reset<= '0';
    wait for 1 ns;

    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;

    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
   
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;

    clock <= '1';
    reset<= '0';
    wait for 1 ns;

    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;

    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;

    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;

    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
   
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;

    clock <= '1';
    reset<= '0';
    wait for 1 ns;

    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;

    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
   
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;

    clock <= '1';
    reset<= '0';
    wait for 1 ns;

    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    
    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;

    clock <= '1';
    reset<= '0';
    wait for 1 ns;
    
    
    clock <= '0';
    reset<= '0';
    wait for 1 ns;
    

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;

