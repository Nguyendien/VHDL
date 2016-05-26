LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparator2_tb IS -- Test bench entity has no ports
END comparator2_tb;
ARCHITECTURE comparator2_tb_architecture OF comparator2_tb IS
-- Component declaration of the tested unit
COMPONENT comparator2
PORT(
x : IN STD_LOGIC;
y : IN STD_LOGIC;
eqi : IN STD_LOGIC;
eqo : OUT STD_LOGIC );
END COMPONENT;
-- Stimulus signals - signals mapped to the input and inout ports of tested entity
SIGNAL test_vector: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL test_result : STD_LOGIC;
BEGIN
UUT : comparator2
PORT MAP (
x => test_vector(0),
y => test_vector(1),
eqi => test_vector(2),
eqo => test_result);
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
END comparator2_tb_architecture;
