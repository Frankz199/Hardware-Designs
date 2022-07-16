library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux is 
port(A1 : in std_logic_vector(7 downto 0);
S1 : in std_logic_vector(7 downto 0);
F1 : in std_logic_vector(7 downto 0);
LOST : in std_logic_vector(7 downto 0);
SEL : in std_logic_vector(1 downto 0);
O1 : out std_logic_vector(7 downto 0));
end entity mux;

architecture behave_mux of mux is
begin

with SEL select
O1 <= A1 when "00",
      S1 when "01",
		F1 when "10",
		LOST when others;
		
end behave_mux;