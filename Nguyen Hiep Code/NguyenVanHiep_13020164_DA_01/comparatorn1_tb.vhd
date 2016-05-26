
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

-------------------------------------------------------------------------------

ENTITY comparatorn1_tb IS

END comparatorn1_tb;

-------------------------------------------------------------------------------

ARCHITECTURE testbench OF comparatorn1_tb IS

  COMPONENT comparatorn1
    GENERIC (
      DATA_WIDTH : INTEGER);
    PORT (
      x_in    : IN  STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
      y_in    : IN  STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
      eqo_out : OUT STD_LOGIC);
  END COMPONENT;

  -- component generics
  CONSTANT DATA_WIDTH : INTEGER := 8;

  -- component ports
  SIGNAL x_in    : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
  SIGNAL y_in    : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
  SIGNAL eqo_out : STD_LOGIC;

BEGIN  -- testbench

  -- component instantiation
  DUT: comparatorn1
    GENERIC MAP (
      DATA_WIDTH => DATA_WIDTH)
    PORT MAP (
      x_in    => x_in,
      y_in    => y_in,
      eqo_out => eqo_out);

  -- waveform generation
  WaveGen_Proc: process
  begin
    x_in <= "00000000";
    y_in <= "00000000";
    for i in 0 to 255 Loop
      for j in 0 to 255 loop
        wait for 1ns;
        x_in <= (x_in + "00000001");
      end loop;
      y_in <= (y_in + "00000001" );
    end loop;
  end process WaveGen_Proc;

  

END testbench;

-------------------------------------------------------------------------------

CONFIGURATION comparatorn_tb_testbench_cfg OF comparatorn1_tb IS
  FOR testbench
  END FOR;
END comparatorn_tb_testbench_cfg;

-------------------------------------------------------------------------------


