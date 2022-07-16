library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity total is
port(A0 : in std_logic_vector(7 downto 0);
B0 : in  std_logic_vector(7 downto 0);
OPCODE : in std_logic_vector(1 downto 0);
OUTPUT1 : out std_logic_vector(7 downto 0));
end entity total;

architecture behave_total of total is

component fourfourmx is
port(A : in std_logic_vector(7 downto 0);
B : in std_logic_vector(7 downto 0);
P_SUM : out std_logic_vector(7 downto 0));
end component;

component eightbitsub is
port(A : in std_logic_vector(7 downto 0);
B : in std_logic_vector(7 downto 0);
S_UM : out std_logic_vector(7 downto 0));
end component;

component eightbitadd is
port(A : in std_logic_vector(7 downto 0);
B : in std_logic_vector(7 downto 0);
S_UM : out std_logic_vector(7 downto 0));
end component;

component mux is
port(A1 : in std_logic_vector(7 downto 0);
S1 : in std_logic_vector(7 downto 0);
F1 : in std_logic_vector(7 downto 0);
LOST : in std_logic_vector(7 downto 0);
SEL : in std_logic_vector(1 downto 0);
O1 : out std_logic_vector(7 downto 0));
end component;

signal aline : std_logic_vector(7 downto 0);
signal sline : std_logic_vector(7 downto 0);
signal fline : std_logic_vector(7 downto 0);

begin

u1: eightbitadd port map(A0,B0,aline);
u2: eightbitsub port map(A0,B0,sline);
u3: fourfourmx port map(A0,B0,fline);
u4: mux port map(A1 => aline, S1 => sline, F1 => fline, LOST => fline,SEL => OPCODE, O1 =>OUTPUT1);
end behave_total;
