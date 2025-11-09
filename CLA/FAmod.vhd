--**********************************************************************************************************************
--Full Adder Modificado
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
--    *** Warning: X, Y and Cin Inputs should be in 1 bit format ***
--Outputs:
--    F (result), P (Propagation result) G (generation result)
--    *** Warning: The F, P and G  results should be in 1 bit format ***
--
--Description:
--This algorithm add two numbers of 1-bit
--This implementation uses Full Adder


--**********************************************************************************************************************

--Full Adder Modificado
--Se agregaron dos salidas:
--Propagación y Generación
--      _______
--  X->|       |->F
--  Y->| FAmod |->P
-- Ci->|_______|->G
--

--**********************************************************************************************************************
--Suma dos operandos de 1 bit
--cada uno
library ieee;
use ieee.std_logic_1164 .all;

entity FAmod is
	port( --Mapeo de puertos del FUll Adder Modificado
			X,Y,Ci: in std_logic ; --Sumandos y acarreo
			F,P,G:out std_logic ); --Salida, habilitador de propagación y función generadora
	end FAmod;

architecture RTL of FAmod is --Arquitectura
	begin
		G <= X and Y; --Función Generadora
		P <= X xor Y; --Habilitador de propagación
		F <= X xor Y xor Ci; --Salida del Circuito
end RTL;