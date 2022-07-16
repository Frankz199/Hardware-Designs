library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity full_adder_tb is
end entity full_adder_tb;

architecture tbfa of full_adder_tb is

component full_adder is
port(A : in std_logic;
B : in std_logic;
CIN : in std_logic;
SUM : out std_logic;
COUT : out std_logic);
end component;

signal A, B, CIN, SUM, COUT: std_logic;
begin
UUT : full_adder port map(A,B,CIN,SUM,COUT);
process
begin
A <= '0';
B <= '0';
CIN <= '0';
wait for 1 ns;

A <= '1';
B <= '0';
CIN <= '0';
wait for 1 ns;

A <= '0';
B <= '1';
CIN <= '0';
wait for 1 ns;

A <= '1';
B <= '1';
CIN <= '0';
wait for 1 ns;

A <= '0';
B <= '0';
CIN <= '1';
wait for 1 ns;

A <= '1';
B <= '0';
CIN <= '1';
wait for 1 ns;

A <= '0';
B <= '1';
CIN <= '1';
wait for 1 ns;

A <= '1';
B <= '1';
CIN <= '1';
wait for 1 ns;

wait;

end process;

end tbfa;
