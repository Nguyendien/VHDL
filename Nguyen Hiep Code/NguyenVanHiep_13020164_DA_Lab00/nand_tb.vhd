LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY nand_tb IS    END nand_tb;
ARCHITECTURE  nand_tb_architecture  OF  nand_tb  IS
COMPONENT nand_gate
PORT(
A  :  IN  STD_LOGIC; 
B  :  IN  STD_LOGIC; 
z : OUT  STD_LOGIC );
END COMPONENT;
SIGNAL test_vector: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL test_result : STD_LOGIC;
BEGIN
UUT : nand_gate
PORT MAP (
A  =>  test_vector(0), 
B  =>  test_vector(1), 
z => test_result);
Testing: PROCESS 
BEGIN
test_vector <= "00";
WAIT FOR 10 ns; 
test_vector <= "01"; 
WAIT FOR 10 ns; 
test_vector <= "10"; 
WAIT FOR 10 ns; 
test_vector <= "11";
WAIT FOR 10 ns; 
END PROCESS;
END nand_tb_architecture;