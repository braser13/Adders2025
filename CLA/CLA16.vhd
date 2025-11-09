--**********************************************************************************************************************
--Ripple Carry Adder
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
--    A (required), B (required), Cin(required)
--    *** Warning: A and B Inputs should be in 16 Bit format, and Cin Input should be in 1 bit format ***
--Outputs:
--    S (result), Cout(carry result)
--    *** Warning: The S results will be given 16 bit format, and Cout Input should be in 1 bit format ***
--
--Description:
--This algorithm add two numbers of 16-bit
--This implementation uses Ripple Carry Algorithm


--**********************************************************************************************************************

--    Carry Lookahead Adder de 16 bits
--            _______
--  A(16-0)->|       |
--  B(16-0)->|  CLA  |->S(16-0)
--      Cin->|_______|->Cout

--**********************************************************************************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity CLA16 is
	Port ( 	A16 : in std_logic_vector (15 downto 0);--Sumando 1
			B16 : in std_logic_vector (15 downto 0);--Sumando 2
			Cin16 : in std_logic ; --Acarreo de entrada
			S16 : out std_logic_vector (15 downto 0);--Resultado
			Cout16,Po16,Go16 : out std_logic );--Acarreo de salida, Habilitador Propagacíón
end CLA16;
 
architecture Behavioral of CLA16 is
	component CLA4Bits is --Se llama al sumador CLA de 4 bits
		port(	A : in std_logic_vector (3 downto 0); --Sumando 1
				B : in std_logic_vector (3 downto 0); --Sumando 2
				Cin : in std_logic ; --Acarreo de entrada
				S : out std_logic_vector (3 downto 0); --Resultado
				Cout,Po,Go : out std_logic ); --Acarreo de salida, Habilitador Propagacíón
end component ; --y salida de la función Generadora

signal Caux16,P16,G16: std_logic_vector (3 downto 0);--Salida bloque generador de Acarreos, Propagación y Generadora
signal sS16 : std_logic_vector (15 downto 0); --Señal auxiliar para guardar el Resultado

begin --Sintesis de los 4 sumadores de 4 bits.
	FADD0 : CLA4Bits port map(A16(3 downto 0),B16(3 downto 0),Cin16,sS16(3 downto 0),Po=>P16(0),Go=>G16(0));
	FADD1 : CLA4Bits port map(A16(7 downto 4),B16(7 downto 4),Caux16(0),sS16(7 downto 4),Po=>P16(1),Go=>G16(1));
	FADD2 : CLA4Bits port map(A16(11 downto 8),B16(11 downto 8),Caux16(1),sS16(11 downto 8),Po=>P16(2),Go=>G16(2));
	FADD3 : CLA4Bits port map(A16(15 downto 12),B16(15 downto 12),Caux16(2),sS16(15 downto 12),Po=>P16(3),Go=>G16(3));

	S16<=sS16; --Cargue de los resultados en el puerto de Salida

	--Bloque de Acarreos en función del Habilitador de propagación y la función generadora de los 4 sumadores anteriores
	Caux16(0)<= G16(0)OR(P16(0)AND Cin16);
	Caux16(1)<= G16(1)OR(P16(1)AND G16(0))OR(P16(1)AND P16(0) AND Cin16);
	Caux16(2)<= G16(2)OR(P16(2)AND G16(1))OR(P16(2) AND P16(1) AND G16(0))OR(P16(2)AND P16(1) AND P16(0)AND Cin16);
	Caux16(3)<= G16(3)OR(P16(3)AND G16(2))OR(P16(3) AND P16(2) AND G16(1))OR(P16(3)AND P16(2) AND P16(1)AND G16(0))OR(P16(3)AND P16(2)AND P16(1)AND P16(0) AND Cin16);
	--Cargue del Acarreo de Salida del sumador CLA16 al puerto Cout16
	Cout16 <= Caux16(3);
	--Cargue de las señales: habilitador de Propagación y Función Generadora
	Po16<=P16(0)and P16(1)and P16(2)and P16(3);
	Go16<=G16(3)or(P16(3)and G16(2))or(P16(3) and P16(2) and G16(1))or(P16(3)and P16(2) and P16(1)and G16(0))or(P16(3)and P16(2)and P16(1)and P16(0) and G16(0));
end Behavioral;