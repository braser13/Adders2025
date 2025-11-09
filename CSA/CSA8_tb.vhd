--Testbench Carry Save Adder 8 bits    
--**********************************************************************************************************************
--Carry Save Adder 8 bits
--Authors:
--  Andres Gonzalo Hernandez Ortega
--  Braian Steven Avella Rivera
--Year: 2022
--Maestría en Ingeniería
--Universidad Pedagogica y Tecnologica de Colombia
--
--TOP LEVEL
--
--Inputs:
--    X (required), Y (required), Carry_in(required)
--    *** Warning: X and Y Inputs should be in 8 Bit format, and Carry_in Input should be in 1 bit format ***
--Outputs:
--    sum (result), Coarry(carry result)
--    *** Warning: The S results will be given 8 bit format, and Coarry Input should be in 1 bit format ***
--
--Description:
--This algorithm add two numbers of 8-bit
--This implementation uses Ripple Carry Algorithm


--**********************************************************************************************************************

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
	DUT: entity work.carry_save_adder port map
	(x=>sA,y=>sB,carry_in=>sCi,Sum=>sS,carry=>sCo);
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

