--**********************************************************************************************************************
--Full Adder
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
--    a (required), b (required), cin(required)
--    *** Warning: a, b  and cin Input should be in 1 bit format ***
--Outputs:
--    sum (result), carry(carry result)
--    *** Warning: The sum, and carry results will be given 1 bit format ***
--
--Description:
--This algorithm add two numbers of 1-bit
--This implementation uses Modifie Full Adder circuit.


--**********************************************************************************************************************

-- 		Full Adder
--           _______
--       a->|       |
--       b->| FULL  |->sum
--     cin->| ADDER |->carry        
--          |_______|        
--

--**********************************************************************************************************************
library  ieee;
use ieee.std_logic_1164.all;

entity fulladder is
	port(
		a,b,cin: in std_logic;
		sum,carry:out std_logic);
end fulladder;

architecture RTL of fulladder is
	signal G, P : std_logic;
	begin
		G <= a and b;
		P <= a xor b;
		sum <= P xor cin;
		carry <= G or(P and cin);
end RTL;
