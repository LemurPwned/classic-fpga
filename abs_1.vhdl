library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity abs_1 is
  port (
  si : in std_logic_vector(4 downto 0);
  smo : out std_logic_vector(3 downto 0)
  );
end entity;

architecture behav of abs_1 is
  signal nsi : std_logic_vector(4 downto 0);
  signal sum : std_logic_vector(3 downto 0);
  signal c : std_logic := '1';
  signal t,f,g : std_logic := '0';
begin
  nsi <= not si;

    c <='1';
    sum(0) <= nsi(0) xor c;
    t <= nsi(0) and c;
    sum(1) <= nsi(1) xor t;
    f <= nsi(1) and t;
    sum(2) <= nsi(2) xor f;
    g <= nsi(2) and f;
    sum(3) <= nsi(3) xor g;
    smo <= sum;

        ----only U2 for now
    --sum(0) <= nsi(0) xor c;
    --t <= sum(0) and c;
    --sum(1) <= nsi(1) xor t;
    --t <= sum(0) and sum(1);
    --sum(2) <= nsi(2) xor t;
    --t <= sum(2) and sum(1) and sum(1);
    --sum(3) <= nsi(3) xor t;
    --t <= sum(3) and t;
    --smo(3) <= sum(3);
    --smo(2) <= sum(2);
    --smo(1) <= sum(1);
    --smo(0) <= sum(0);
    --smo <= nsi(3 downto 0);
  end architecture;
