library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fourtotwo_encoder_tb is
end entity fourtotwo_encoder_tb;

architecture tbfourtotwo of fourtotwo_encoder_tb is

component fourtotwo_encoder is
port(I3 : in std_logic;
I2 : in std_logic;
I1 : in std_logic;
I0 : in std_logic;
O1 : out std_logic;
O0 : out std_logic);
end component;

signal I3, I2, I1, I0, O1, O0: std_logic;
begin
UUT : fourtotwo_encoder port map(I3,I2,I1,I0,O1,O0);
process
begin
I3 <= '0';
I2 <= '0';
I1 <= '0';
I0 <= '1';
wait for 20 ns;

I3 <= '0';
I2 <= '0';
I1 <= '1';
I0 <= '0';
wait for 20 ns;

I3 <= '0';
I2 <= '1';
I1 <= '0';
I0 <= '0';
wait for 20 ns;

I3 <= '1';
I2 <= '0';
I1 <= '0';
I0 <= '0';
wait for 20 ns;
wait;

end process;

end tbfourtotwo;