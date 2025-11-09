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
--    *** Warning: A and B Inputs should be in 64 Bit format, and Cin Input should be in 1 bit format ***
--Outputs:
--    S (result), Cout(carry result)
--    *** Warning: The S results will be given 64 bit format, and Cout Input should be in 1 bit format ***
--
--Description:
--This algorithm add two numbers of 64-bit
--This implementation uses Ripple Carry Algorithm


--**********************************************************************************************************************

--    Ripple Carry Adder
--            _______
--  A(63-0)->|       |
--  B(63-0)->|  RCA  |->S(63-0)
--      Cin->|_______|->Cout       

--********************************************************************************************************************** 
library ieee;
use ieee.std_logic_1164.all;

entity RCA64 is
	 Generic(
				constant Len : natural := 63);
     port(
			A, B :  in std_logic_vector(Len downto 0);
			Cin  :  in std_logic;
			S    : out std_logic_vector(Len downto 0);
			Cout : out std_logic);
end RCA64;

architecture STRUCTURAL of RCA64 is
	component FA is
	    port(
			X, Y, Ci  :   in std_logic;
			F, Co     : out std_logic);
	end component;
      signal Caux : std_logic_vector(Len downto 0);
begin
		FADDER0 : FA port map (X => A(0), Y => B(0),
					 Ci => Cin, F => S(0), Co => Caux(0));
		ADDER64:
		for i in 1 to Len generate
			FADDER : FA port map (X => A(i), Y => B(i), 
					   Ci => Caux(i-1), F => S(i), Co => Caux(i));
		end generate ADDER64;
		
      Cout <= Caux(Len);		
end STRUCTURAL;

