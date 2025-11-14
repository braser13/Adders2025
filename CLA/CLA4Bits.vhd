--**********************************************************************************************************************
--Carry Lookhead Adder de 4 bits
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
--    *** Warning: A and B Inputs should be in 4 Bit format, and Cin Input should be in 1 bit format ***
--Outputs:
--    S (result), Cout(carry result)
--    *** Warning: The S results will be given 4 bit format, and Cout output should be in 1 bit format ***
--
--Description:
--This algorithm add two numbers of 4-bit
--This implementation uses Carry Lookhead Adder


--**********************************************************************************************************************

-- Carry Lookahead Adder de 4 bits
--          _______
-- A(3-0)->|       |
-- B(3-0)->|  CLA  |->S(3-0)
--    Cin->|_______|->Cout

--**********************************************************************************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity CLA4Bits is --Len=Longitud del sumador-1
	Generic(constant Len : natural := 3);
	Port (A : in std_logic_vector(Len downto 0);
		   B : in std_logic_vector(Len downto 0);
		   Cin : in std_logic;
		   S : out std_logic_vector(Len downto 0);
		   Cout,Po,Go : out std_logic);
end CLA4Bits;
 
architecture Behavioral of CLA4bits is
	component FAmod is
	    port(
		 	  X, Y, Ci: in std_logic;
		     F,P,G:out std_logic);
		 end component;
 
signal Caux: std_logic_vector(Len downto 0);
signal P,G: std_logic_vector(Len downto 0);
begin
	FADDER0 : FAmod port map(A(0),B(0),Cin,
								    S(0),P(0),G(0));
	FADDER1 : FAmod port map(A(1),B(1),Caux(0),
									 S(1),P(1),G(1));
   FADDER2 : FAmod port map(A(2),B(2),Caux(1),
									 S(2),P(2),G(2));
   FADDER3 : FAmod port map(A(3),B(3),Caux(2),
									 S(3),P(3),G(3));						 
									 
Caux(0)<= G(0)or(P(0)and Cin);
Caux(1)<= G(1)or(P(1)and G(0))or(P(1)and P(0) and Cin);
Caux(2)<= G(2)or(P(2)and G(1))or(P(2) and P(1) and G(0))
							   or(P(2)and P(1) and P(0)and Cin);
Caux(3)<= G(3)or(P(3)and G(2))or(P(3) and P(2) and G(1))
								or(P(3)and P(2) and P(1)and G(0))
								or(P(3)and P(2)and P(1)and P(0) and Cin);
cout<=Caux(Len); 
Po<=P(0)and P(1)and P(2)and P(3);
Go<=G(3)or(P(3)and G(2))or(P(3) and P(2) and G(1))
								or(P(3)and P(2) and P(1)and G(0))
								or(P(3)and P(2)and P(1)and P(0) and G(0)); 
end Behavioral;
