library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fourfourmx is
port(A : in std_logic_vector(7 downto 0);
B : in std_logic_vector(7 downto 0);
P_SUM : out std_logic_vector(7 downto 0));
end entity fourfourmx;

architecture behave_ff of fourfourmx is
component fulladder is
port(X : in std_logic;
Y : in std_logic;
CIN : in std_logic;
SUM : out std_logic;
COUT : out std_logic);
end component;

component halfadder is
port(xx : in std_logic;
yy : in std_logic;
summ: out std_logic;
carryy : out std_logic);
end component;

signal temp : std_logic_vector(14 downto 0);
signal connect : std_logic_vector(16 downto 0);

begin
P_SUM(0) <= A(0) and B(0);
temp(0) <= A(0) and B(1);
temp(1) <= A(1) and B(0);
temp(2) <= A(0) and B(2);
temp(3) <= A(2) and B(0);
temp(4) <= A(1) and B(1);
temp(5) <= A(1) and B(2);
temp(6) <= A(0) and B(3);
temp(7) <= A(3) and B(0);
temp(8) <= A(2) and B(1);
temp(9) <= A(2) and B(2);
temp(10) <= A(3) and B(1);
temp(11) <= A(1) and B(3);
temp(12) <= A(2) and B(3);
temp(13) <= A(3) and B(2);
temp(14) <= A(3) and B(3);

u1: halfadder port map(temp(0),temp(1),P_SUM(1),connect(0));
u2: halfadder port map(temp(3),temp(4),connect(1),connect(2));
u3: fulladder port map(connect(1),temp(2),connect(0),P_SUM(2),connect(3));
u4: halfadder port map(temp(7),temp(8),connect(4),connect(5));
u5: fulladder port map(connect(4),temp(5),connect(2),connect(6),connect(7));
u6: fulladder port map(temp(6),connect(6),connect(3),P_SUM(3),connect(8));
u7: fulladder port map(temp(10),temp(9),connect(5),connect(9),connect(10));
u8: fulladder port map(temp(11),connect(9),connect(7),connect(11),connect(12));
u9: halfadder port map(connect(8),connect(11),P_SUM(4),connect(13));
u10: fulladder port map(temp(13),temp(12),connect(10), connect(14), connect(15));
u11: fulladder port map(connect(14),connect(12),connect(13),P_SUM(5),connect(16));
u12: fulladder port map(temp(14),connect(15),connect(16),P_SUM(6),P_SUM(7));
end behave_ff;