

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nand2 IS
  
  GENERIC (
    delay : TIME := 2 NS);

  PORT (
    i1    : IN  STD_LOGIC;
    i2    : IN  STD_LOGIC;
    o : OUT STD_LOGIC);

END nand2;

ARCHITECTURE rtl OF nand2 IS

BEGIN  -- rtl

  o <= i1 NAND i2 AFTER delay;

END rtl;
