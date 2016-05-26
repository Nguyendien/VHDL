LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY nand_gate IS 
PORT(
a  : IN STD_LOGIC;
b : IN STD_LOGIC;
z  : OUT STD_LOGIC); 
END nand_gate;
ARCHITECTURE model OF nand_gate IS 
BEGIN
z <= a NAND b;
END model;