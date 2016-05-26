LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-------------------------------------------------------------------------------

ENTITY encoder1_tb IS

END encoder1_tb;

-------------------------------------------------------------------------------

ARCHITECTURE testbench OF encoder1_tb IS

  COMPONENT encoder1
    PORT (
      data_in      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      segments_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
  END COMPONENT;

  -- component ports
  SIGNAL data_in      : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL segments_out : STD_LOGIC_VECTOR(6 DOWNTO 0);

  -- clock
  signal Clk : std_logic := '1';

BEGIN  -- testbench

  -- component instantiation
  DUT: encoder1
    PORT MAP (
      data_in      => data_in,
      segments_out => segments_out);

  -- clock generation
  Clk <= not Clk after 10 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here
    data_in <="0000";
    WAIT FOR 20 ns; 
    data_in <="0001";
    WAIT FOR 20 ns;
    data_in <="0010";
    WAIT FOR 20 ns;
    data_in <="0011";
    WAIT FOR 20 ns;
    data_in <="0100";
    WAIT FOR 20 ns;
    data_in <="0101";
    WAIT FOR 20 ns;
    data_in <="0110";
    WAIT FOR 20 ns;
    data_in <="0111";
    WAIT FOR 20 ns;
    data_in <="1000";
    WAIT FOR 20 ns;
    data_in <="1001";
    WAIT FOR 20 ns;
    data_in <="1010";
    WAIT FOR 20 ns;
    wait until Clk = '1';
  end process WaveGen_Proc;

END testbench;

-------------------------------------------------------------------------------

CONFIGURATION encoder_tb_testbench_cfg OF encoder1_tb IS
  FOR testbench
  END FOR;
END encoder_tb_testbench_cfg;
