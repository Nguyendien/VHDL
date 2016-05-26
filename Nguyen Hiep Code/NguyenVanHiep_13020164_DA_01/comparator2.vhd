LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Comparator2 IS
  
  PORT (
    x   : IN  STD_LOGIC;
    y   : IN  STD_LOGIC;
    eqi : IN  STD_LOGIC;
    eqo : OUT STD_LOGIC);

END Comparator2;

ARCHITECTURE dataflow OF Comparator2 IS

--signal x1: STD_LOGIC;
--signal y1: STD_LOGIC;
BEGIN  -- dataflow
-- x1 <= NOT X;
 --y1 <= NOT y;
 eqo <= (eqi AND (NOT x) AND (NOT y)) OR (eqi AND X AND Y);
END dataflow;

