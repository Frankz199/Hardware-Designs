library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity total_tb is
end entity total_tb;

architecture behave_total of total_tb is
component total is
port(A0 : in std_logic_vector(7 downto 0);
B0 : in  std_logic_vector(7 downto 0);
OPCODE : in std_logic_vector(1 downto 0);
OUTPUT1 : out std_logic_vector(7 downto 0));
end component;

signal A : std_logic_vector(7 downto 0);
signal B : std_logic_vector(7 downto 0);
signal opcode: std_logic_vector(1 downto 0);
signal OUTPUT1 : std_logic_vector(7 downto 0);

begin
DUT : total port map(A,B,opcode,OUTPUT1);
process
begin
A <= "10101010";
B <= "00110011";
opcode <= "00";
wait for 1 ns;

A <= "10101010";
B <= "00110011";
opcode <= "01";
wait for 1 ns;

A <= "00001010";
B <= "00001001";
opcode <= "10";
wait for 1 ns;

wait;

end process;

end behave_total;