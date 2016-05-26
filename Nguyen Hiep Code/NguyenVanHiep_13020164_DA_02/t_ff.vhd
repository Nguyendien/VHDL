library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_ff is
   port (d: in std_logic;
   rst_n: in std_logic;
   CLK: in std_logic;
   enable: in std_logic;
	 Q: out std_logic);
end t_ff;
 
architecture beh_t_ff of t_ff is	 
	signal temp: std_logic;
begin
   process (rst_n,CLK) 
   begin   
	   if rst_n='0' then   
		  temp <= '0'; 
	      elsif (rising_edge(CLK)) then 		
	         if enable ='1' then
	 	    temp <= d xor temp;
		 end if;
           end if; 
   end process;
   q <= temp;	   
end beh_t_ff;
