
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;        
ENTITY counter_tff_tb IS

END counter_tff_tb;

ARCHITECTURE testbench OF counter_tff_tb IS

  COMPONENT counter_tff
    GENERIC (
      size : INTEGER);
    PORT (
    clk   : IN  STD_LOGIC;
    rst_n : IN  STD_LOGIC;
    enable : IN STD_LOGIC;
    set    : IN STD_LOGIC;
    data_in     : IN  STD_LOGIC_VECTOR(size -1 downto 0);
    counter_out  : OUT STD_LOGIC_VECTOR(size -1 downto 0));

  END COMPONENT;

  -- component generics
  CONSTANT size : INTEGER := 8;

  -- component ports
    signal rst_n :  STD_LOGIC;
    signal enable :  STD_LOGIC;
    signal set    :  STD_LOGIC;
    signal data_in     :  STD_LOGIC_VECTOR(size -1 downto 0);
    signal counter_out  : STD_LOGIC_VECTOR(size -1 downto 0);
    signal clk : std_logic := '1';
BEGIN  -- testbench

  -- component instantiation
  DUT: counter_tff
    GENERIC MAP (
      size  => size)
    PORT MAP ( clk =>clk,
     rst_n => rst_n,
      enable => enable,
       set => set,
        data_in => data_in,
         counter_out => counter_out);
  Clk <= not Clk after 10 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    rst_n <= '0';
    data_in <= "11111111";
    set <= '0'; 
    enable <= '0'; wait for 20ns;
    set <= '1'; wait for 10ns;
    enable <= '1'; wait for 10ns;
    set <= '0'; wait for 20ns;
    rst_n <= '1'; wait for 300ns;    
  end process WaveGen_Proc;
   -- wait until Clk = '1';
END testbench;

