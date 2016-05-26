
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Comparator IS
  
  PORT (
    x   : IN  STD_LOGIC;
    y   : IN  STD_LOGIC;
    eqi : IN  STD_LOGIC;
    eqo : OUT STD_LOGIC);

END Comparator;

ARCHITECTURE dataflows OF Comparator IS
COMPONENT inv IS
    PORT (
    i : IN  STD_LOGIC;
    o : OUT STD_LOGIC);
END COMPONENT;
COMPONENT nand2 IS
  PORT (
    i1 : IN  STD_LOGIC;
    i2 : IN  STD_LOGIC;
    o  : OUT STD_LOGIC);
END COMPONENT;  
COMPONENT nor2 IS
  PORT (
    i1 : IN  STD_LOGIC;
    i2 : IN  STD_LOGIC;
    o  : OUT STD_LOGIC);
END COMPONENT;
  signal nx : STD_LOGIC;
   signal ny : STD_LOGIC;
    signal m : STD_LOGIC;
     signal n : STD_LOGIC;
      signal nm : STD_LOGIC;
       signal nn : STD_LOGIC;
        signal k : STD_LOGIC;
         signal nk : STD_LOGIC;
          signal neqi : STD_LOGIC;
BEGIN   
 u1: inv PORT map ( i => x,
                    o => nx);
 u2: inv port map ( i => y,
                    o => ny);
 u3: nor2 port map ( i1=> nx,
                     i2=> ny,
                     o=> m);
 u4: nor2 port map ( i1=> x,
                     i2=> y,
                     o=> n);
 u5: inv port map( i=> m,
                    o=> nm);
 u6: inv port map( i=> n,
                    o=> nn);
 u7: nand2 port map( i1 => nm,
                      i2 => nn,
                      o => k );
 u8: inv port map( i=> eqi,
                    o=> neqi);
 u9: inv port map( i=> k,
                    o=> nk);
 u10: nor2 port map( i1=> neqi,
                      i2=> nk,
                      o=>eqo);

END dataflows;
