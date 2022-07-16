library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fulladder is
port(X : in std_logic;
Y : in std_logic;
CIN : in std_logic;
SUM : out std_logic;
COUT : out std_logic);
end entity fulladder;

architecture behave_fa of fulladder is
begin
SUM <= (X xor Y) xor CIN;
COUT <= (X and Y) or (X and CIN) or (Y and CIN);
end behave_fa;