LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
------------------------------------------------------------------------------------------------
ENTITY converter_tb IS
END ENTITY;
------------------------------------------------------------------------------------------------
ARCHITECTURE tb OF converter_tb IS
COMPONENT converter IS
	PORT(
		clk 	: IN STD_LOGIC;
		rst_n	: IN STD_LOGIC;
		load 	: IN STD_LOGIC;
		data_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		ready_out 	: OUT STD_LOGIC;
		data_out	: OUT STD_LOGIC);
END COMPONENT;

SIGNAL clk,rst_n,load,ready_out,data_out : STD_LOGIC;
SIGNAL data_in : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
	DUT: converter
	PORT MAP(clk, rst_n, load, data_in, ready_out, data_out);
	data_in <= "1111011000110001";
	clock_proc: PROCESS
	BEGIN 
		clk <= '0';
		WAIT FOR 5 ns;
		clk <= '1';
		WAIT FOR 5 ns;
	END PROCESS clock_proc;
	reset_proc: PROCESS
	BEGIN
		rst_n <= '0';
		WAIT FOR 12 ns;
		rst_n <= '1';
		WAIT;
	END PROCESS reset_proc;
	load_proc: PROCESS
	BEGIN
		load <= '0';
		WAIT FOR 28 ns;
		load <= '1';
		WAIT FOR 10 ns;
		load <= '0';
		WAIT FOR 20 ns;
		load <= '1';
		WAIT;
	END PROCESS load_proc;
END tb;
