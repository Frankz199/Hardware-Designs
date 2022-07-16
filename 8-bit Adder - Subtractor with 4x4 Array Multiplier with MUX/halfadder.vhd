library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity halfadder is
port(xx : in std_logic;
yy : in std_logic;
summ: out std_logic;
carryy : out std_logic);
end entity halfadder;

architecture behave_ha of halfadder is
begin
summ <= xx xor yy;
carryy <= xx and yy;
end behave_ha;