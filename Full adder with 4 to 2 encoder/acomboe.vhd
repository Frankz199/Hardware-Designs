library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity acomboe is
generic(SEL: in integer range 0 to 1 := 0);
port(INPUT : in std_logic_vector(3 downto 0);
OUTPUT : out std_logic_vector(1 downto 0));
end entity acomboe;

architecture choice of acomboe is
component full_adder is
port(A : in std_logic;
B : in std_logic;
CIN : in std_logic;
SUM : out std_logic;
COUT : out std_logic);
end component;

component fourtotwo_encoder is
port(I3 : in std_logic;
I2 : in std_logic;
I1 : in std_logic;
I0 : in std_logic;
O1 : out std_logic;
O0 : out std_logic);
end component;

begin

c1: if SEL = 0 generate
u1: full_adder port map (A => INPUT(0),B => INPUT(1),CIN => INPUT(2),SUM => OUTPUT(1),COUT => OUTPUT(0));
end generate;

c2: if SEL = 1 generate
u2: fourtotwo_encoder port map(I3 => INPUT(3),I2 => INPUT(2),I1 => INPUT(1),I0 => INPUT(0),O1 => OUTPUT(1),O0 => OUTPUT(0));
end generate;
end choice;
