--**********************************************************************************************************************
--Carry Save Adder 8 bits
--Authors:
--  Braian Steven Avella Rivera
--  Andres Gonzalo Hernandez Ortega
--Year: 2025
--Maestría en Ingeniería
--Universidad Pedagogica y Tecnologica de Colombia
--
--TOP LEVEL
--
--Inputs:
--    A (required), B (required), Ci(required)
--    *** Warning: A, B and Ci Inputs should be in 8 Bit format ***
--Outputs:
--    S (result), Co(carry result)
--    *** Warning: The S and Co result should be in 9 bit format ***
--
--Description:
--This algorithm add two numbers of 8-bit
--This implementation uses Ripple Carry Algorithm


--**********************************************************************************************************************

--    Carry Save Adder
--            _______
--   A(7-0)->|       |
--   B(7-0)->|  CSA  |->S(7-0)
--  Ci(8-0)->|_______|->Co(8-0)

--**********************************************************************************************************************
library IEEE;
use IEEE.std_logic_1164.all;

entity CSA8 is
generic(n: integer := 7);
port( A: in std_logic_vector(n downto 0);
		B: in std_logic_vector(n downto 0);
		Ci: IN std_logic_vector(n downto 0);
		S: OUT std_logic_vector(n+1 downto 0);
		Co: OUT std_logic_vector(n+1 downto 0));
end CSA8;

architecture behavioral of CSA8 is
	begin
		S <= '0' & ((A XOR B) XOR Ci);
		Co <= (((A AND B) OR (A AND Ci)) OR (A AND Ci))& '0' ;
end behavioral;