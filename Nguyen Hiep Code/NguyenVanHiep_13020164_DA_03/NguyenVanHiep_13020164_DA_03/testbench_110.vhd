LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------------------------------------
ENTITY testbench_110 IS
END ENTITY;
--------------------------------------------------------------------------------------------
ARCHITECTURE tb OF testbench_110 IS

COMPONENT moore_110_detector IS
	PORT(
		clk    : IN  STD_LOGIC;
		rst    : IN  STD_LOGIC;
		data   : IN  STD_LOGIC;
		result : OUT STD_LOGIC);
END COMPONENT;

COMPONENT mealy_110_detector IS
	PORT (
		clk    : IN  STD_LOGIC;
		rst    : IN  STD_LOGIC;
		data   : IN  STD_LOGIC;
		result : OUT STD_LOGIC);
END COMPONENT;


SIGNAL clk, rst, data, result1, result2 : STD_LOGIC;
SIGNAL data_in : STD_LOGIC_VECTOR(9 DOWNTO 0) := "0011010110";

BEGIN
	clock_proc: PROCESS
	BEGIN
		clk <= '1';
		WAIT FOR 10 ns;
		clk <= '0';
		WAIT FOR 10 ns;
	END PROCESS clock_proc;
	reset_proc: PROCESS
	BEGIN
		rst <= '0';
		WAIT FOR 12 ns;
		rst <= '1';
		WAIT;
	END PROCESS reset_proc;
	detec_proc: PROCESS
	BEGIN
		
		FOR i IN 0 TO 9 LOOP
			data <= data_in(i);
			WAIT FOR 25 ns;
		END LOOP;
		WAIT FOR 10 ns;
		WAIT;
	END PROCESS detec_proc;
		DUT1 : moore_110_detector PORT MAP(clk, rst, data, result1);
	DUT2 : mealy_110_detector PORT MAP(clk, rst, data, result2);

END tb;


