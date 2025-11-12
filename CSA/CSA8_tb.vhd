--Testbench CSA 8 bits    
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity CSA8_tb is
end entity;

architecture Test of CSA8_tb is
constant MiN : natural:=to_integer(unsigned'(x"FA"));
constant Max : natural:=to_integer(unsigned'(x"FF"));
constant ofs: natural:=to_integer(unsigned'(x"01"));
signal sA, sB, sCi : std_logic_vector(7 downto 0);
signal  sS, sCo : std_logic_vector(8 downto 0);

begin
	DUT: entity work.CSA8 port map
	(A=>sA,B=>sB,Ci=>sCi,S=>sS,Co=>sCo);
	TB2: process
	begin
		sCi <= "00000000";
		for ind in 0 to 8 loop	
			sA <= std_logic_vector(to_unsigned(ind,8));
			sB <= std_logic_vector(to_unsigned(2*ind,8));
			wait for 100 ns;
		end loop;
		sCi <= "11111111";
		for i in Min to Max loop		
			sA <= std_logic_vector(to_unsigned(i,8));
			sB <= std_logic_vector(to_unsigned(Ofs,8));
			wait for 100 ns;
		end loop;
	wait;
	end process;
end Test;

