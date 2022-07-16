library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fourtotwo_encoder is
port(I3 : in std_logic;
I2 : in std_logic;
I1 : in std_logic;
I0 : in std_logic;
O1 : out std_logic;
O0 : out std_logic);
end entity fourtotwo_encoder;

architecture behave_fourtotwo of fourtotwo_encoder is
begin
O1 <= I3 or I2;
O0 <= I3 or I1;
end behave_fourtotwo;