--**********************************************************************************************************************
--Full Adder
--Authors:
--  Andres Gonzalo Hernandez Ortega
--  Braian Steven Avella Rivera
--Year: 2022
--Maestría en Ingeniería
--Universidad Pedagógica y Tecnológica de Colombia
--
--TOP LEVEL
--
--Inputs:
--    X (required), Y (required), Ci (required)
--    *** Warning: Inputs should be in 1 Bit format ***
--Outputs:
--    F (result), Co (result)
--    *** Warning: The results will be given 1 bit format ***
--
--Description:
--This algorithm sum two numbers of 1-bit
--This implementation uses Full Adder


--**********************************************************************************************************************

-- 		Full Adder
--          _______
--      X->|       |
--      Y->| FULL  |->F
--     Ci->| ADDER |->Co        
--         |_______|        
--
library  ieee;
use ieee.std_logic_1164.all;

entity FA is--Sumador completo de 1 solo bit
	port(
		X,Y,Ci: in std_logic;--Se tienen las entradas X, Y y el acarreo de entrada
		Co,F:out std_logic); --Resultado de la suma y Acarreo de Salida
end FA;

architecture RTL of FA is
	signal G, P : std_logic; --Señal generadora y habilitador de propagación
	begin
		G <= X and Y;			 
		P <= X xor Y;
		F <= P xor Ci;
		Co <= G or(P and Ci);
end RTL;
