LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY xor3 IS 
PORT(
A   :  IN  STD_LOGIC; 
B    :  IN  STD_LOGIC; 
C  : IN STD_LOGIC;
Result  : OUT STD_LOGIC);
END  xor3;
ARCHITECTURE dataflow OF xor3 IS 
SIGNAL u: STD_LOGIC;
BEGIN
U <= A XOR B; 
Result <= u XOR C;
END dataflow;