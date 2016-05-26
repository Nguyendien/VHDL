------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nor2 IS
  
  GENERIC (
    delay : TIME := 2 NS);

  PORT (
    i1 : IN  STD_LOGIC;
    i2 : IN  STD_LOGIC;
    o  : OUT STD_LOGIC);

END nor2;

ARCHITECTURE rtl OF nor2 IS

BEGIN  -- rtl

  o <= i1 NOR i2 AFTER delay;

END rtl;
