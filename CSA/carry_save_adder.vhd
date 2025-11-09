--**********************************************************************************************************************
--Carry Save Adder 8 bits
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
--    X (required), Y (required), Carry_in(required)
--    *** Warning: X and Y Inputs should be in 8 Bit format, and Carry_in Input should be in 1 bit format ***
--Outputs:
--    sum (result), Coarry(carry result)
--    *** Warning: The S results will be given 8 bit format, and Coarry Input should be in 1 bit format ***
--
--Description:
--This algorithm add two numbers of 8-bit
--This implementation uses Ripple Carry Algorithm


--**********************************************************************************************************************

--    Carry Save Adder
--            _______
--   x(7-0)->|       |
--   y(7-0)->|  CSA  |->sum(7-0)
-- Carry_in->|_______|->Coarry

--**********************************************************************************************************************
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
-- EXTERNAL PORTS
ENTITY carry_save_adder IS
GENERIC(n: integer := 7);
PORT( 			x: IN std_logic_vector(n DOWNTO 0);
					y: IN std_logic_vector(n DOWNTO 0);
		  carry_in: IN std_logic_vector(n DOWNTO 0);
			    sum: OUT std_logic_vector(n+1 DOWNTO 0);
			  carry: OUT std_logic_vector(n+1 DOWNTO 0));
END carry_save_adder;
-- INTERNAL BEHAVIOR
ARCHITECTURE behavioral OF carry_save_adder IS
BEGIN
	sum <= '0' & ((x XOR y) XOR carry_in);
	carry <= (((x AND y) OR (x AND carry_in)) OR (y AND carry_in))& '0' ;
END behavioral;