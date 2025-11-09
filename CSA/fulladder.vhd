--**********************************************************************************************************************
--Carry Lookhead Adder de 64 bits
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
--    X (required), Y (required), Ci(required)
--    *** Warning: X and B and Cin Input should be in 1 bit format ***
--Outputs:
--    F (result), Co(carry result)
--    *** Warning: The F and Cout results should be in 1 bit format ***
--
--Description:
--This algorithm add two numbers of 1-bit
--This implementation uses Full Adder


--**********************************************************************************************************************

-- 		Full Adder
--          _______
--      X->|       |
--      Y->| FULL  |->F
--     Ci->| ADDER |->Co        
--         |_______|        

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
