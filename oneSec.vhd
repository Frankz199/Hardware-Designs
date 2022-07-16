library IEEE;
use IEEE.std_logic_1164.all;

entity oneSec is
	port ( clock: in std_logic;
			 clk : out std_logic);
end entity oneSec;

architecture o of oneSec is
	signal count : integer := 0 ;
	signal temp : std_logic := '0';
begin
	process(clock)
	begin
		if rising_edge(clock) then
			if count = 25000000 then
				temp <= not temp;
				count <= 0;
			else
				count <= count + 1;
			end if;
		end if;
	end process;
	clk <= temp;
end architecture o;