
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mealy_101 IS
  
  PORT (
    clk    : IN  STD_LOGIC;
    rst    : IN  STD_LOGIC;
    data   : IN  STD_LOGIC;
    result : OUT STD_LOGIC);

END mealy_101;

ARCHITECTURE behavioral OF mealy_101 IS

  TYPE   state IS (IDLE, GOT1, GOT10);
  SIGNAL current_state : state;
  SIGNAL next_state    : state;

BEGIN  
  REG : PROCESS (clk, rst)
  BEGIN  -- PROCESS REG
    IF rst = '0' THEN                   -- asynchronous reset (active low)
      current_state <= IDLE;
    ELSIF clk'EVENT AND clk = '1' THEN  -- rising clock edge
      current_state <= next_state;
    END IF;
  END PROCESS REG;

  NEXTSTATE : PROCESS (data, current_state)
  BEGIN  -- PROCESS FSM

    CASE current_state IS
      WHEN IDLE =>
        IF data = '1' THEN
          next_state <= GOT1;
        ELSE
          next_state <= IDLE;
        END IF;
      WHEN GOT1 =>
        IF data = '0' THEN
          next_state <= GOT10;
        ELSE
          next_state <= GOT1;
        END IF;
      WHEN GOT10 =>
        IF data = '1' THEN
          next_state <= GOT1;
        ELSE
          next_state <= IDLE;
        END IF;
      WHEN OTHERS => NULL;
    END CASE;

  END PROCESS NEXTSTATE;
  
  result <= '1' WHEN (current_state = GOT10 AND data = '1') ELSE '0';

END behavioral;

