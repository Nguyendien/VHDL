--------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY inv IS
  
  GENERIC (
    delay : TIME := 1 NS);

  PORT (
    i : IN  STD_LOGIC;
    o : OUT STD_LOGIC);

END inv;

ARCHITECTURE rtl OF inv IS

BEGIN  -- rtl

  o <= NOT i AFTER delay;

END rtl;
