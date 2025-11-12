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
--    X (required), X (required), Ci(required)
--    *** Warning: X, Y  and Ci Input should be in 1 bit format ***
--Outputs:
--    F (result), P(Propagation result), G(Generation Signal)
--    *** Warning: The F, and Co results will be given 1 bit format ***
--
--Description:
--This algorithm add two numbers of 1-bit
--This implementation uses Modified Full Adder.


--**********************************************************************************************************************

-- Modified Full Adder
-- with Propagation and Generation Signal
--          _______
--      X->|       |->F
--      Y->| FAmod |->P        
--     Ci->|_______|->G 

--**********************************************************************************************************************
library  ieee;
use ieee.std_logic_1164.all;

entity FAmod is
	port(
		X,Y,Ci: in std_logic;
		F,P,G:out std_logic);
end FAmod;

architecture RTL of FAmod is
	begin
		G <= X and Y;
		P <= X xor Y;
		F <= X xor Y xor Ci;
end RTL;
