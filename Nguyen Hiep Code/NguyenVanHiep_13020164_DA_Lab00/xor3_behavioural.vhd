LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY xor3 IS
PORT(
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        C : IN STD_LOGIC;
        Result : OUT STD_LOGIC);
END xor3;

ARCHITECTURE behavioral OF xor3 IS
BEGIN
xor3_behave: PROCESS (A,B,C)
BEGIN
  IF ((A XOR B XOR C) = '1') THEN
    Result <= '1';
  ELSE
    Result <= '0';
  END IF;
END PROCESS xor3_behave;
END behavioral;
