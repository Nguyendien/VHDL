LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY counter_tff IS
  
  GENERIC (size : INTEGER := 8);
  PORT(
    clk   : IN  STD_LOGIC;
    rst_n : IN  STD_LOGIC;
    enable : IN STD_LOGIC;
    set    : IN STD_LOGIC;
    data_in     : IN  STD_LOGIC_VECTOR(size -1 downto 0);
    counter_out  : OUT STD_LOGIC_VECTOR(size -1 downto 0));
END counter_tff;

ARCHITECTURE counter_tff OF counter_tff IS
  component tff IS 
   port (d: in std_logic;
   rst_n: in std_logic;
   CLK: in std_logic;
   enable: in std_logic;
   set: in std_logic;
   di: in std_logic;
	 Q: out std_logic);
  end component;
signal nq: STD_LOGIC_VECTOR(size-1 DOWNTO 0);
signal value: STD_LOGIC_VECTOR(size-1 DOWNTO 0);

BEGIN  -- structure
    --t_ff_proc: PROCESS (clk, rst_n, set)
   -- begin
    nq(0) <= '1';
    nq(1) <=  value(0);
    nq(2) <=  value(1) and  nq(1);
    nq(3) <=  value(2) and  nq(2);
    nq(4) <=  value(3) and  nq(3);
    nq(5) <=  value(4) and  nq(4);
    nq(6) <=  value(5) and  nq(5);
    nq(7) <=  value(6) and  nq(6);
   
    counter_tff_gen: FOR i IN 0 TO size-1 GENERATE
    first_condition_gen: IF (i=0) GENERATE
     u1: tff port map (nq(i),rst_n, clk, enable,set, data_in(i), value(i));
    END GENERATE first_condition_gen;

    td_condition_gen: IF (i > 0) GENERATE
     u2: tff port map (nq(i), rst_n, clk, enable,set, data_in(i), value(i));
    END GENERATE td_condition_gen;   
  END GENERATE counter_tff_gen;
    counter_out <= value;
END counter_tff;


