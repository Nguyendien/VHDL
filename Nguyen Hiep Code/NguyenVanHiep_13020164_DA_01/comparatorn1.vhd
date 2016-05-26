LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY comparatorn1 IS
  
  GENERIC (
    DATA_WIDTH : INTEGER := 8);

  PORT (
    x_in    : IN  STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
    y_in    : IN  STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
    eqo_out : OUT  STD_LOGIC);

END comparatorn1;


ARCHITECTURE comparatorn1 OF comparatorn1 IS
component comparator2 IS 
    PORT (
    x   : IN  STD_LOGIC;
    y   : IN  STD_LOGIC;
    eqi : IN  STD_LOGIC;
    eqo : OUT STD_LOGIC);
end component;
signal eqi_in: STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
BEGIN  -- structure
  comparator_n_gen: FOR i IN 0 TO DATA_WIDTH-1 GENERATE
    first_condition_gen: IF (i=0) GENERATE
     u1: comparator2 port map (x_in(i), y_in(i), '1', eqi_in(i));
    END GENERATE first_condition_gen;
    
    nd_condition_gen: IF (i >0) AND ( i< (data_width -1)) GENERATE
     u2: comparator2 port map (x_in(i), y_in(i), eqi_in(i-1), eqi_in(i));
    END GENERATE nd_condition_gen;   
    
    td_condition_gen: IF (i = (data_width-1)) GENERATE
     u2: comparator2 port map (x_in(i), y_in(i), eqi_in(i-1), eqo_out);
    END GENERATE td_condition_gen;   
  END GENERATE comparator_n_gen;
END comparatorn1;

