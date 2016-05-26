LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY xor3 IS
PORT(
      A : IN STD_LOGIC;
      B : IN STD_LOGIC;
      C : IN STD_LOGIC;
      Result : OUT STD_LOGIC);
END xor3;

ARCHITECTURE structural OF xor3 IS
SIGNAL U1_OUT : STD_LOGIC;
COMPONENT xor2 IS
PORT(
      I1 : IN STD_LOGIC;
      I2 : IN STD_LOGIC;
      Y : OUT STD_LOGIC );
END COMPONENT;
BEGIN
  U1: xor2 PORT MAP (I1 => A,
                    I2 => B,
                    Y => U1_OUT);
  U2: xor2 PORT MAP (I1 => U1_OUT,
                    I2 => C,
                    Y => Result);
END structural;
