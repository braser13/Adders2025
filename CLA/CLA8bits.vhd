--**********************************************************************************************************************
--Carry Lookhead Adder de 8 bits
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
--    *** Warning: The S results will be given 8 bit format, and Cout output should be in 1 bit format ***
--
--Description:
--This algorithm add two numbers of 8-bit
--This implementation uses Carry Lookhead Adder


--**********************************************************************************************************************

-- Carry Lookahead Adder de 8 bits
--          _______
-- A(7-0)->|       |
-- B(7-0)->|  CLA  |->S(7-0)
--    Cin->|_______|->Cout

--**********************************************************************************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity CLA8bits is --Len=Longitud del sumador-1
	Port ( A8 : in std_logic_vector(7 downto 0);
			 B8 : in std_logic_vector(7 downto 0);
			 Cin8 : in std_logic;
			 S8 : out std_logic_vector(7 downto 0);
			 Cout8,Po8,Go8 : out std_logic);
end CLA8bits;
 
architecture Behavioral of CLA8bits is
	component CLA4Bits is
	    port(A : in std_logic_vector(3 downto 0);
			   B : in std_logic_vector(3 downto 0);
			   Cin : in std_logic;
			   S : out std_logic_vector(3 downto 0);
			  Cout,Po,Go : out std_logic);
	 end component;
 
signal Caux8,P8,G8: std_logic_vector(1 downto 0);
signal sS8: std_logic_vector(7 downto 0);

begin
	FADD0 : CLA4Bits port map(A8(3 downto 0),B8(3 downto 0),Cin8,sS8(3 downto 0),Po=>P8(0),Go=>G8(0));
	FADD1 : CLA4Bits port map(A8(7 downto 4),B8(7 downto 4),Caux8(0),sS8(7 downto 4),Po=>P8(1),Go=>G8(1));	
	
	S8<=sS8;
 
Caux8(0)<= G8(0)OR(P8(0)AND Cin8);
Caux8(1)<= G8(1)OR(P8(1)AND G8(0))OR(P8(1)AND P8(0) AND Cin8);
Cout8<=Caux8(1);
Po8<=P8(0)AND P8(1);
Go8<=G8(1)OR(P8(1)AND G8(0))OR(P8(1)AND P8(0) AND Cin8);
 
end Behavioral;
