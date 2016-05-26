library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tff is
   port (d: in std_logic;
   rst_n: in std_logic;
   CLK: in std_logic;
   enable: in std_logic;
   set: in std_logic;
   di: in std_logic;
	 Q: out std_logic);
end tff;
 
architecture beh_tff of tff is	 
	signal temp: std_logic;
begin
   process (rst_n,CLK) 
   begin  
   if set = '0' then 
	   if rst_n='0' then   
		  temp <= '0'; 
	      elsif (rising_edge(CLK)) then 		
	         if enable ='1' then
	 	    temp <= d xor temp;
		       end if;
     end if; 
  else temp <= di;
  end if;
   end process;
   q <= temp; 
end beh_tff;
