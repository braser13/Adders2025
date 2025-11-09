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
--    *** Warning: A and B Inputs should be in 4 Bit format, and Cin Input should be in 1 bit format ***
--Outputs:
--    S (result), Cout(carry result)
--    *** Warning: The S results will be given 4 bit format, and Po,Go,Cout Output should be in 1 bit format ***
--
--Description:
--This algorithm add two numbers of 4-bit
--This implementation uses Carry Lookhead Adder


--**********************************************************************************************************************

--    Carry Lookahead Adder de 4 bits 
--				Modificado
--           _______
--  A(4-0)->|       |->S(4-0)
--  B(4-0)->|  CLA  |->Po
--     cin->|       |->Go
--          |_______|->Cout

--**********************************************************************************************************************
library IEEE;
use IEEE.STD_LOGIC_1164 .ALL;

entity CLA4Bits is --Len=Longitud del sumador-1
	Generic(constant Len : natural := 3);
	Port (	A : in std_logic_vector (Len downto 0); --Sumando 1
			B : in std_logic_vector (Len downto 0); --Sumando 2
			Cin : in std_logic ; --Acarreo de entrada
			S : out std_logic_vector (Len downto 0); --Resultado de la suma
			Cout,Po,Go : out std_logic ); --Acarreo de salida, Habilitador Propagacíón
end CLA4Bits ; 							  --y salida de la función Generadora

architecture Behavioral of CLA4bits is --Arquitectura
	component FAmod is --Se llama al Full Adder Modificado
		port( 	--Mapeo de puertos del Full Adder Modifica
				X, Y, Ci: in std_logic ; --Sumandos y Acarreo
				F,P,G:out std_logic ); --Resultado de la suma, Habilitador Propagacíón
	end component ; --y salida de la función Generadora

	signal Caux: std_logic_vector (Len downto 0); --Acarreos Full Addres.
	signal P,G: std_logic_vector (Len downto 0); --Señales de Propagación y Generadora

begin
	FADDER0 : FAmod port map(A(0),B(0),Cin,S(0),P(0),G(0));--Mapeo del primer sumador
	FADDER1 : FAmod port map(A(1),B(1),Caux(0),S(1),P(1),G(1));--Mapeo del segundo sumador
	FADDER2 : FAmod port map(A(2),B(2),Caux(1),S(2),P(2),G(2));--Mapeo del Tecer sumador
	FADDER3 : FAmod port map(A(3),B(3),Caux(2),S(3),P(3),G(3));--Mapeo del Cuarto sumador
	
	--Bloque generador de acarreos del CLA de 4 bits
	Caux(0)<= G(0)or(P(0)and Cin);
	Caux(1)<= G(1)or(P(1)and G(0))or(P(1)and P(0) and Cin);
	Caux(2)<= G(2)or(P(2)and G(1))or(P(2) and P(1) and G(0))or(P(2)and P(1) and P(0)and Cin);
	Caux(3)<= G(3)or(P(3)and G(2))or(P(3) and P(2) and G(1))or(P(3)and P(2) and P(1)and G(0))or(P(3)and P(2)and P(1)and P(0) and Cin);
	--Cargue puerto del acarreo de salida
	cout<=Caux(Len);
	--Cargue puertos funcion generadora y habilitador de propagación
	Po<=P(0)and P(1)and P(2)and P(3);
	Go<=G(3)or(P(3)and G(2))or(P(3) and P(2) and G(1))or(P(3)and P(2) and P(1)and G(0))or(P(3)and P(2)and P(1)and P(0) and G(0));
end Behavioral ;