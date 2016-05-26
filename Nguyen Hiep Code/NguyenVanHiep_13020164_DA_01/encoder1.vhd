LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY encoder IS
  
  PORT (
    data_in      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    segments_out : OUT STD_LOGIC_VECTOR(6 downto 0));

END encoder;

ARCHITECTURE truct OF encoder IS

BEGIN  
  segments_out(0) <= data_in(1) or data_in(3) or not(data_in(0) xor data_in(2));
  segments_out(1) <= (not data_in(2)) or not (data_in(0) xor data_in(1));
  segments_out(2) <= data_in(0) or data_in(2) or (not data_in(1));
  segments_out(3) <= (data_in(1) and not data_in(0)) or (not data_in(2) and not data_in(0))
                  or (not data_in(2) and data_in(1)) or (not data_in(2) and not data_in(1) and not data_in(0));
  segments_out(4) <= (data_in(1) and not data_in(0)) or ( not data_in(2) and not data_in(0));
  segments_out(5) <=data_in(3) or (data_in(2) and not data_in(1))
                  or (data_in(2) and not data_in(0)) or (not data_in(1) and not data_in(0));
  segments_out(6) <= data_in(3) or ( data_in(2) xor data_in(1)) or (data_in(1) and not data_in(0));

END truct;

