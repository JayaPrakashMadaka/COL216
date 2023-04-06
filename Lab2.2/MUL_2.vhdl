library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MUL_2 is
port (a, b, c: in std_logic;
         o : out std_logic
        );
end MUL_2;

architecture dataflow of MUL_2 is
begin
     o <= ((not(c)) and a) or (c and b);
     
end dataflow;
