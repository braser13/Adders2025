--**********************************************************************************************************************
--Ripple Carry Adder
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
--    A (required), B (required), Cin(required)
--    *** Warning: A and B Inputs should be in 8 Bit format, and Cin Input should be in 1 bit format ***
--Outputs:
--    S (result), Cout(carry result)
--    *** Warning: The S results will be given 8 bit format, and Cout Input should be in 1 bit format ***
--
--Description:
--This algorithm add two numbers of 8-bit
--This implementation uses Ripple Carry Algorithm


--**********************************************************************************************************************

--    Ripple Carry Adder
--           _______
--  A(7-0)->|       |
--  B(7-0)->|  RCA  |->S(7-0)
--     Cin->|_______|->Cout       

--********************************************************************************************************************** 
library ieee;
use ieee.std_logic_1164.all;

entity RCA8 is
	 Generic(
				constant Len : natural := 7);
     port(
			A, B :  in std_logic_vector(Len downto 0);
			Cin  :  in std_logic;
			S    : out std_logic_vector(Len downto 0);
			Cout : out std_logic);
end RCA8;

architecture STRUCTURAL of RCA8 is
	component FA is
	    port(
			X, Y, Ci  :   in std_logic;
			F, Co     : out std_logic);
	end component;
      signal Caux : std_logic_vector(Len downto 0);
begin
		FADDER0 : FA port map (X => A(0), Y => B(0),
					 Ci => Cin, F => S(0), Co => Caux(0));
		ADDER8:
		for i in 1 to Len generate
			FADDER : FA port map (X => A(i), Y => B(i), 
					   Ci => Caux(i-1), F => S(i), Co => Caux(i));
		end generate ADDER8;
		
      Cout <= Caux(Len);		
end STRUCTURAL;

