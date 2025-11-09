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
--    A (required), B (required), Cin(required)
--    *** Warning: A and B Inputs should be in 64 Bit format, and Cin Input should be in 1 bit format ***
--Outputs:
--    S (result), Cout(carry result)
--    *** Warning: The S results will be given 64 bit format, and Cout output should be in 1 bit format ***
--
--Description:
--This algorithm add two numbers of 64-bit
--This implementation uses Carry Lookhead Adder


--**********************************************************************************************************************

-- Carry Lookahead Adder de 64 bits
--           _______
-- A(63-0)->|       |
-- B(63-0)->|  CLA  |->S(63-0)
--     Cin->|_______|->Cout

--**********************************************************************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164 .ALL;

entity CLA64 is --Len=Longitud del sumador-1
	Port ( 	A64 : in std_logic_vector (63 downto 0);--Sumando 1
			B64 : in std_logic_vector (63 downto 0);--Sumando 2
			Cin64 : in std_logic ; --Acarreo de entrada
			S64 : out std_logic_vector (63 downto 0);--Resultado
			Cout64 : out std_logic ); --Acarreo de salida
end CLA64;

architecture Behavioral of CLA64 is
	component CLA16 is --Mapeo de puertos de sumador de 16 bits
		port ( 	A16 : in std_logic_vector (15 downto 0);--Sumando 1
				B16 : in std_logic_vector (15 downto 0); --Sumando 2
				Cin16 : in std_logic ; --Acarreo de entra
				S16 : out std_logic_vector (15 downto 0); --Resultado de la suma
				Cout16,Po16,Go16 : out std_logic ); --Acarreo de salida, Habilitador Propagacíón
	end component ; --y salida de la función Generadora

signal Caux64,P64,G64: std_logic_vector (3 downto 0);--Salida bloque generador de Acarreos, Propagación y Generadora
signal sS64 : std_logic_vector (63 downto 0); --Señal auxiliar para guardar el Resultado

begin --Sintesis de los 4 sumadores de 16 bits.
--Sumadores de 16 bits
	FADD161 : CLA16 port map(A64(15 downto 0),B64(15 downto 0),Cin64,sS64(15 downto 0),Po16=>P64(0),Go16=>G64(0));
	FADD162 : CLA16 port map(A64(31 downto 16),B64(31 downto 16),Caux64(0),sS64(31 downto 16),Po16=>P64(1),Go16=>G64(1));
	FADD163 : CLA16 port map(A64(47 downto 32),B64(47 downto 32),Caux64(1),sS64(47 downto 32),Po16=>P64(2),Go16=>G64(2));
	FADD164 : CLA16 port map(A64(63 downto 48),B64(63 downto 48),Caux64(2),sS64(63 downto 48),Po16=>P64(3),Go16=>G64(3));

S64<=sS64; --Cargue de los resultados en el puerto de Salida

--Bloque Generador de Acarreos en función del Habilitador de propagación y la función generadora de los 4 sumadores anteriores
Caux64(0)<= G64(0)OR(P64(0)AND Cin64);Caux64(1)<= G64(1)OR(P64(1)AND G64(0))OR(P64(1)AND P64(0) AND Cin64);
Caux64(2)<= G64(2)OR(P64(2)AND G64(1))OR(P64(2) AND P64(1) AND G64(0))OR(P64(2)AND P64(1)AND P64(0)AND Cin64);
Caux64(3)<= G64(3)OR(P64(3)AND G64(2))OR(P64(3) AND P64(2) AND G64(1))OR(P64(3)AND P64(2)AND P64(1)AND G64(0))OR(P64(3)AND P64(2)AND P64(1)AND P64(0) AND Cin64);
Cout64 <= Caux64(3);

end Behavioral ;