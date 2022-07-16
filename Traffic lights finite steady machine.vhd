library IEEE;
use IEEE.std_logic_1164.all;

entity Assignment3 is
	port ( clock, reset, Sa, Sb: in std_logic;
			 Ra, Ga, Rb, Gb : out std_logic);
end entity Assignment3;

architecture a3 of Assignment3 is

	component oneSec is
		port ( clock : in std_logic;
				 clk : out std_logic);
	end component oneSec;

	signal clk, ect, t3s, t5s, t10s, c3s, c5s, c10s: std_logic := '0';
	-- clk: one sec clock
	-- ect: enable cycle timer
	-- t3s, t5s, t10s: flags to determine which cycle timer to use
	-- c3s, c5s, c10s: flags to check if cycle has completed
	signal count : integer := 1; -- delay count in timer
	type states is (GARB, RABG5, RAGB3);
	-- GARB: green on A and red on B
	-- RABG5: red on A and green on B for 5s
	-- RAGB3: red on A and green on B for additional 3s
	signal currentState, nextState : states;

begin

	-- change clock into the frequency of one second
	frequencyDivider:oneSec port map (clock, clk);

	-- reset or switch states
	switch:process(reset, clk)
	begin
		if reset = '1' then
			-- starting state
			currentState <= GARB;
		elsif rising_edge(clk) then
			-- switch to next state
			currentState <= nextState;
		end if;
	end process switch;

	-- determination of next state
	controller:process(reset, Sa, Sb, currentState, c3s, c5s, c10s)
	begin
		-- default next: remain same state
		nextState <= currentState;
		if reset = '1' then
			-- define output light values
			Ra <= '0';
			Ga <= '1';
			Rb <= '1';
			Gb <= '0';
			-- disable cycle timer
			ect <= '0';
		else
			-- default: enable cycle timer
			ect <= '1';
			case currentState is
				when GARB =>
					-- define output light values
					Ra <= '0';
					Ga <= '1';
					Rb <= '1';
					Gb <= '0';
					-- 10s cycle timer
					t3s <= '0';
					t5s <= '0';
					t10s <= '1';
					-- after 10s of green on red and car approaching B
					if (c10s = '1' and ((Sa = '0' and Sb = '1') or (Sa = '1' and Sb = '1'))) then
						-- next: red on A and green on B for 5s
						nextState <= RABG5;
					-- after 10s of green on red and no car approaching B
					elsif c10s = '1' then
						-- end of cycle, disable cycle timer
						ect <= '0';
					end if;
				when RABG5 =>
					-- define output light values
					Ra <= '1';
					Ga <= '0';
					Rb <= '0';
					Gb <= '1';
					-- 5s cycle timer
					t3s <= '0';
					t5s <= '1';
					t10s <= '0';
					-- after 5s of green on B and car approaching A or no car approaching B
					if (c5s = '1' and (not(Sa = '0' and Sb = '1'))) then
						-- next: green on A and red on B
						nextState <= GARB;
					-- after 5s of green on B and car approaching B
					elsif c5s = '1' then
						-- next: red on A and green on B for additional 3s
						nextState <= RAGB3;
						-- enable cycle timer
						ect <= '1';
					end if;
				when RAGB3 =>
					-- define output light values
					Ra <= '1';
					Ga <= '0';
					Rb <= '0';
					Gb <= '1';
					-- 3s cycle timer
					t3s <= '1';
					t5s <= '0';
					t10s <= '0';
					-- after the additional 3s of green on B and car approaching A or no car approaching B
					if (c3s = '1' and (not(Sa = '0' and Sb = '1'))) then
						-- next: green on A and red on B
						nextState <= GARB;
					-- after 3s of green on B and car approaching B
					elsif c3s = '1' then
						-- end of cycle, disable cycle timer
						ect <= '0';
					end if;
			end case;
		end if;
	end process controller;

	-- cycle timer
	timer:process(reset, clk)
	begin
		if reset = '1' then
			-- reset cycle timer
			count <= 1;
		elsif rising_edge(clk) then
			-- cycle timer enabled
			if ect = '1' then
				-- reset flags
				c3s <= '0';
				c5s <= '0';
				c10s <= '0';
				-- increase cycle timer count
					count <= count + 1;
				if (t3s = '1' and count = 3) then
					-- flag as completed after 3s
					c3s <= '1';
					-- reset cycle timer
					count <= 1;
				elsif (t5s = '1' and count = 5) then
					-- flag as completed after 5s
					c5s <= '1';
					-- reset cycle timer
					count <= 1;
				elsif (t10s = '1' and count = 10) then
					-- flag as completed after 10s
					c10s <= '1';
					-- reset cycle timer
					count <= 1;
				end if;
			end if;
		end if;
	end process timer;

end architecture a3;
