LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY xor3_tb IS  -- Test bench entity has no ports
END xor3_tb;
ARCHITECTURE xor3_tb_architecture OF xor3_tb IS

-- Component declaration of the tested unit
  COMPONENT xor3
  PORT(
      A : IN STD_LOGIC;
      B : IN STD_LOGIC;
      C : IN STD_LOGIC;
      Result : OUT STD_LOGIC );
END COMPONENT;

-- Stimulus signals - signals mapped to the input and inout ports of tested entity
SIGNAL test_vector: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL test_result : STD_LOGIC;
BEGIN
  UUT : xor3
  PORT MAP (
      A => test_vector(0),
      B => test_vector(1),
      C => test_vector(2),
      Result => test_result);
Testing: PROCESS
BEGIN
  test_vector <= "000";
    WAIT FOR 10 ns;
  test_vector <= "001";
    WAIT FOR 10 ns;
  test_vector <= "010";
    WAIT FOR 10 ns;
  test_vector <= "011";
    WAIT FOR 10 ns;
  test_vector <= "100";
    WAIT FOR 10 ns;
  test_vector <= "101";
    WAIT FOR 10 ns;
  test_vector <= "110";
    WAIT FOR 10 ns;
  test_vector <= "111";
    WAIT FOR 10 ns;
END PROCESS;
END xor3_tb_architecture;