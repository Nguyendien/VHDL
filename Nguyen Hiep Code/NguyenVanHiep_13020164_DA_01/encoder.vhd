LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY encoder IS
  
  PORT (
    data_in      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    segments_out : OUT STD_LOGIC_VECTOR(6 downto 0));

END encoder;

ARCHITECTURE beh OF encoder IS

BEGIN  -- beh
  check : process(data_in)
  begin
  case data_in is
    when "0000" => segments_out <= "0111111";
    when "0001" => segments_out <= "0000110";
    when "0010" => segments_out <= "1011011";
    when "0011" => segments_out <= "1001111";
    when "0100" => segments_out <= "1100110";
    when "0101" => segments_out <= "1101101";
    when "0110" => segments_out <= "1111101";
    when "0111" => segments_out <= "0000111";
    when "1000" => segments_out <= "1111111";
    when "1001" => segments_out <= "1100111";
    when others => segments_out <= "0000000";
    end case;
    end process;
END beh;
