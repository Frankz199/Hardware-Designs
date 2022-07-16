library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity eightbitadd is
port(A : in std_logic_vector(7 downto 0);
B : in std_logic_vector(7 downto 0);
S_UM : out std_logic_vector(7 downto 0));
end entity eightbitadd;

architecture behave_add of eightbitadd is
component fulladder is
port(X : in std_logic;
Y : in std_logic;
CIN : in std_logic;
SUM : out std_logic;
COUT : out std_logic);
end component;

signal carry : std_logic_vector(7 downto 0);
signal tempb : std_logic_vector(7 downto 0);
signal C_IN : std_logic;

begin 
C_IN <= '0' xor '0';
tempb(0) <= B(0) xor '0';
tempb(1) <= B(1) xor '0';
tempb(2) <= B(2) xor '0';
tempb(3) <= B(3) xor '0';
tempb(4) <= B(4) xor '0';
tempb(5) <= B(5) xor '0';
tempb(6) <= B(6) xor '0';
tempb(7) <= B(7) xor '0';

U0 : fulladder port map (A(0),tempb(0),C_IN,S_UM(0),carry(0));
U1 : fulladder port map (A(1),tempb(1),carry(0),S_UM(1),carry(1));
U2 : fulladder port map (A(2),tempb(2),carry(1),S_UM(2),carry(2));
U3 : fulladder port map (A(3),tempb(3),carry(2),S_UM(3),carry(3));
U4 : fulladder port map (A(4),tempb(4),carry(3),S_UM(4),carry(4));
U5 : fulladder port map (A(5),tempb(5),carry(4),S_UM(5),carry(5));
U6 : fulladder port map (A(6),tempb(6),carry(5),S_UM(6),carry(6));
U7 : fulladder port map (A(7),tempb(7),carry(6),S_UM(7),carry(7));
end behave_add;
