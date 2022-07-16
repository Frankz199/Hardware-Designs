library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity acomboe_tb is
end entity acomboe_tb;

architecture tbace of acomboe_tb is
component acomboe is
port(INPUT : in std_logic_vector(3 downto 0);
OUTPUT : out std_logic_vector(1 downto 0));
end component;

signal INPUT: std_logic_vector(3 downto 0);
signal OUTPUT: std_logic_vector(1 downto 0);

begin
DUT: acomboe port map(INPUT, OUTPUT);
process
begin
INPUT <= "0000";
wait for 1 ns;

INPUT <= "0001";
wait for 1 ns;

INPUT <= "0010";
wait for 1 ns;

INPUT <= "0100";
wait for 1 ns;

INPUT <= "1000";
wait for 1 ns;

INPUT <= "0011";
wait for 1 ns;

INPUT <= "0101";
wait for 1 ns;

INPUT <= "0110";
wait for 1 ns;

INPUT <= "0111";
wait for 1 ns;

wait;

end process;

end tbace;