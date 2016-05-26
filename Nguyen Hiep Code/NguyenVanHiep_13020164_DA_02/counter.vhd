LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY counter IS
  GENERIC ( size : integer := 8);
  PORT (
    clk   : IN  STD_LOGIC;
    rst_n : IN  STD_LOGIC;
    enable : IN STD_LOGIC;
    set    : IN STD_LOGIC;
    data_in     : IN  STD_LOGIC_VECTOR(size-1 downto 0);
    counter_out  : OUT STD_LOGIC_VECTOR(size-1 downto 0));

END counter;

ARCHITECTURE beh OF counter IS
    signal value : STD_LOGIC_VECTOR(size-1 downto 0);
BEGIN  -- beh
  t_ff_proc: PROCESS (clk, rst_n, set)

  BEGIN  -- PROCESS ff1_proc
    IF rst_n = '0' THEN     
      value <= (OTHERS => '0');
    --  counter_out <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN    
      if enable = '1' then 
         value <= value + 1;
      END IF;
    end if;
    if set ='1' then value <= data_in;
    end if;
  END PROCESS t_ff_proc;
  counter_out <= value;

END beh;


