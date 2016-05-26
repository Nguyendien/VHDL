LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY comparatorn IS
  
  GENERIC (
    DATA_WIDTH : INTEGER := 8);

  PORT (
    x_in    : IN  STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
    y_in    : IN  STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
    eqo_out : OUT STD_LOGIC);

END comparatorn;

ARCHITECTURE beh OF comparatorn IS

BEGIN  -- beh

  -- purpose: compare two number
  -- type   : combinational
  -- inputs : x_in, y_in
  -- outputs: eqo_out
  compare_proc: PROCESS (x_in, y_in)
  BEGIN  -- PROCESS compare_proc
    IF ( x_in = y_in) 
    THEN eqo_out <= '1';
     ELSE eqo_out <= '0';
     END IF;
  END PROCESS compare_proc;

END beh;
