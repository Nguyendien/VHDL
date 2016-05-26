
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;

ENTITY converter IS
  
  PORT (
    clk   : IN  STD_LOGIC;
    rst_n : IN  STD_LOGIC;
    load     : IN  STD_LOGIC;
    data_in  : IN  STD_LOGIC_VECTOR(15 downto 0);
    ready_out : OUT STD_LOGIC;
    data_out     : OUT STD_LOGIC);

END converter;

ARCHITECTURE beh OF converter IS
signal data : std_logic_vector(15 downto 0);
BEGIN  -- beh

  converter_proc: PROCESS (clk)
  BEGIN  -- PROCESS ff1_proc
    IF rst_n = '0' THEN     
      data <= (OTHERS =>'0');
    ELSIF load = '0' THEN
        data <= data_in; 
      elsif rising_edge(clk) then
        data <= '0' & data(15 downto 1);  
    end if;
  END PROCESS converter_proc;
  data_out <= data(0);
 -- ready_out <='1' when (data_out ='1') or (data_out = '0') else '0';
END beh;
