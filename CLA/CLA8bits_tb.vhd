--Testbench CLA 8 bits    
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CLA8bits_tb is
end entity;

architecture Test of CLA8bits_tb is
constant MiN : natural:=to_integer(unsigned'(x"AA"));
constant Max : natural:=to_integer(unsigned'(x"FA"));
constant ofs: natural:=to_integer(unsigned'(x"0100"));
signal sA, sB, sS : std_logic_vector(7 downto 0);
signal sCi, sCo, sPo, sGo : std_logic;

begin
	DUT: entity work.CLA8bits port map
	(A8=>sA,B8=>sB,Cin8=>sCi,S8=>sS,Cout8=>sCo,Po8=>sPo,Go8=>sGo);
	TB2: process
	begin
		sCi <= '0';
		for ind in 0 to 7 loop	
			sA <= std_logic_vector(to_unsigned(ind,8));
			sB <= std_logic_vector(to_unsigned(2*ind,8));
			wait for 100 ns;
		end loop;
		sCi <= '1';
		for i in Min to Max loop		
			sA <= std_logic_vector(to_unsigned(i,8));
			sB <= std_logic_vector(to_unsigned(Ofs,8));
			wait for 100 ns;
		end loop;
	wait;
	end process;
end Test;


