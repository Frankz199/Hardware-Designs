library IEEE;
use IEEE.numeric_bit.all;

entity key is
	port(TL,TR,BL,BR, TRUNKD, LIGHT, CLK200MHZ: in bit;
	DL, TRL, TRDWN, LOFF: out bit := '0';
	DUL, TRUL, TRUP, LON : out bit := '1');
end key;

architecture remote of key is
signal input_values:bit_vector(5 downto 0);
signal count: integer range 0 to 1000000000;
signal DL_Buffer, TRL_Buffer, TRUP_Buffer, LON_Buffer, ready: bit :='0';
signal DUL_Buffer, TRUL_Buffer, TRDWN_Buffer, LOFF_Buffer: bit :='1';
signal sync1, sync2, sync3, sync4, sync5, sync6, sync7, sync8, sync9: bit:='0';
signal tl_pulse, tr_pulse, bl_pulse: bit:='0';
signal state, nextState: integer range 0 to 16;

begin

input_values<= LIGHT & TRUNKD & tl_pulse & tr_pulse & bl_pulse & BR;
DL<=DL_Buffer;
DUL<=DUL_Buffer;
TRL<=TRL_Buffer;
TRUL<=TRUL_Buffer;
TRUP<=TRUP_Buffer;
TRDWN<=TRDWN_Buffer;
LON<=LON_Buffer;
LOFF<=LOFF_Buffer;

process(state, input_values, ready) begin

	case state is
		when 0 =>
			DL_Buffer <= '0';
			DUL_Buffer <= '0';
			TRL_Buffer <= '0';
			TRUL_Buffer <= '0';
			TRUP_Buffer <= '0';
			TRDWN_Buffer <= '0';
			LON_Buffer <= '0';
			LOFF_Buffer <= '0';
			
			if(input_values="001000") then nextState<=1; --pressed TL
			elsif(input_values="000100") then nextState<=2; --pressed TR
			elsif(input_values="000010") then nextState<=3; --pressed BL
			elsif(input_values="000001") then nextState<=6; --pressed BR
			else nextState<=0;
			end if;
			
		when 1 =>
			DL_Buffer <= '1';
			DUL_Buffer <= '0';

			TRL_Buffer <= '0';
			TRUL_Buffer <= '0';
			TRUP_Buffer <= '0';
			TRDWN_Buffer <= '0';
			LON_Buffer <= '0';
			LOFF_Buffer <= '0';
			nextState <= 0;
			
		when 2 =>
			DL_Buffer <= '0';
			DUL_Buffer <= '1';
			TRL_Buffer <= '0';
			TRUL_Buffer <= '0';
			TRUP_Buffer <= '0';
			TRDWN_Buffer <= '0';
			LON_Buffer <= '0';
			LOFF_Buffer <= '0';
			nextState <= 0;
		
		when 3 =>
			DL_Buffer <= '0';
			DUL_Buffer <= '0';
			TRL_Buffer <= '0';
			TRUL_Buffer <= '0';
			TRUP_Buffer <= '0';
			TRDWN_Buffer <= '0';
			LON_Buffer <= '0';
			LOFF_Buffer <= '0';

			if(input_values="100000") then nextState <= 5; --light is on
			else nextState <= 4;
			end if;
		
		when 4 =>
			DL_Buffer <= '0';
			DUL_Buffer <= '0';
			TRL_Buffer <= '0';
			TRUL_Buffer <= '0';
			TRUP_Buffer <= '0';
			TRDWN_Buffer <= '0';
			LON_Buffer <= '1';
			LOFF_Buffer <= '0';
			nextState <= 0;
		
		when 5 =>
			DL_Buffer <= '0';
			DUL_Buffer <= '0';
			TRL_Buffer <= '0';
			TRUL_Buffer <= '0';
			TRUP_Buffer <= '0';
			TRDWN_Buffer <= '0';
			LON_Buffer <= '0';
			LOFF_Buffer <= '1';
			nextState <= 0;

		when 6 =>
			DL_Buffer <= '0';
			DUL_Buffer <= '0';
			TRL_Buffer <= '0';
			TRUL_Buffer <= '0';
			TRUP_Buffer <= '0';
			TRDWN_Buffer <= '0';
			LON_Buffer <= '0';
			LOFF_Buffer <= '0';
			
			if(input_values="010001") then nextState<=10;
			else nextState <= 7;
			end if;
			
		when 7 =>
			DL_Buffer <= '0';
			DUL_Buffer <= '0';
			TRL_Buffer <= '0';
			TRUL_Buffer <= '0';
			TRUP_Buffer <= '0';
			TRDWN_Buffer <= '0';
			LON_Buffer <= '0';
			LOFF_Buffer <= '0';
			
			if(ready = '1') then nextState <= 8;
			elsif(input_values="000001") then nextState <= 7;
			else nextState <= 0;
			end if;
			
		when 8 =>
			DL_Buffer <= '0';
			DUL_Buffer <= '0';
			TRL_Buffer <= '0';
			TRUL_Buffer <= '0';
			TRUP_Buffer <= '0';
			TRDWN_Buffer <= '1';
			LON_Buffer <= '0';
			LOFF_Buffer <= '0';
			nextState <= 9;
			
		when 9 =>
			DL_Buffer <= '0';
			DUL_Buffer <= '0';
			TRL_Buffer <= '1';
			TRUL_Buffer <= '0';
			TRUP_Buffer <= '0';
			TRDWN_Buffer <= '0';
			LON_Buffer <= '0';
			LOFF_Buffer <= '0';
			
			if(input_values="000001") then nextState <= 9;
			else nextState <= 0;
			end if;
			
		when 10 =>
			DL_Buffer <= '0';
			DUL_Buffer <= '0';
			TRL_Buffer <= '0';
			TRUL_Buffer <= '1';
			TRUP_Buffer <= '0';
			TRDWN_Buffer <= '0';
			LON_Buffer <= '0';
			LOFF_Buffer <= '0';
			
			if(ready='1') then nextState<=11;
			elsif(input_values="000001") then nextState <= 11;
			else nextState <= 0;
			end if;
			
		when 11 =>
			DL_Buffer <= '0';
			DUL_Buffer <= '0';
			TRL_Buffer <= '0';
			TRUL_Buffer <= '0';
			TRUP_Buffer <= '1';
			TRDWN_Buffer <= '0';
			LON_Buffer <= '0';
			LOFF_Buffer <= '0';
			
			if(input_values="000001") then nextState <= 11;
			else nextState <= 0;
			end if;

		when others=>
			DL_Buffer <= '0';
			DUL_Buffer <= '0';
			TRL_Buffer <= '0';
			TRUL_Buffer <= '0';
			TRUP_Buffer <= '0';
			TRDWN_Buffer <= '0';
			LON_Buffer <= '0';
			LOFF_Buffer <= '0';
			nextState <= 0;
	end case;
end process;


	
process(CLK200MHZ) begin
if CLK200MHZ'event and CLK200MHZ='1' then
	sync1<=TL;
	sync2<= sync1;
	sync3<= sync2;
	tl_pulse<= sync2 and (not sync3);
	
	sync4<=TR;
	sync5<=sync4;
	sync6<=sync5;
	tr_pulse<= sync5 and (not sync6);

	sync7<=BL;
	sync8<=sync7;
	sync9<=sync8;
	bl_pulse<= sync8 and (not sync9);
	
	state<=nextState;
	
	if((count >= 1000000000) and (BR='1')) then
		ready<='1';
		count<=0;
	elsif (BR='1') then
		ready<='0';
		count<= count+1;
	else
		ready<='0';
		count<=0;
	end if;
end if;
end process;

end remote;
