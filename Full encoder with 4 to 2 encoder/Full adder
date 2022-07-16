library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity full_adder is
port(A : in std_logic;
B : in std_logic;
CIN : in std_logic;
SUM : out std_logic;
COUT : out std_logic);
end entity full_adder;

architecture behave_fa of full_adder is
begin
SUM <= (A xor B) xor CIN;
COUT <= (A and B) or (A and CIN) or (B and CIN);
end behave_fa;
