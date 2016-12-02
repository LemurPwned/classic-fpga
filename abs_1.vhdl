library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity abs_1 is
  port (
  si : in std_logic_vector(4 downto 0);
  smo : out std_logic_vector(4 downto 0);
  se : in std_logic_vector (0 downto 0);
  s : in std_logic_vector (0 downto 0)
  );
end entity;

architecture behav of abs_1 is
  signal nsi : std_logic_vector(4 downto 0);
  signal sum, sum2 : std_logic_vector(4 downto 0);
  signal c : std_logic := '1';
  signal t,f,g : std_logic := '0';
  signal nse : std_logic_vector(0 downto 0);
  signal smo1, smo2 : std_logic_vector(4 downto 0);

begin
  -- s = 1 for convert
  -- se = 1 select u1
  nsi <= not si;
  nse <= not se;
  sum(0) <= si(0) xor s(0);
  sum(1) <= si(1) xor s(0);
  sum(2) <= si(2) xor s(0);
  sum(3) <= si(3) xor s(0);
  sum(4) <= si(4) xor s(0);

  sum2(0) <= nsi(0) xor (not se(0));
  sum2(1) <= nsi(1) xor nsi(0);
  sum2(2) <= nsi(2) xor (nsi(0) and nsi(1));
  sum2(3) <= nsi(3) xor (nsi(0) and nsi(1) and nsi(2));
  sum2(4) <= nsi(4) xor (nsi(0) and nsi(1) and nsi(2) and nsi(3));

  smo1(0) <= se(0) and sum(0);
  smo1(1) <= se(0) and sum(1);
  smo1(2) <= se(0) and sum(2);
  smo1(3) <= se(0) and sum(3);
  smo1(4) <= se(0) and sum(4);

  smo2(0) <= nse(0) and sum2(0);
  smo2(1) <= nse(0) and sum2(1);
  smo2(2) <= nse(0) and sum2(2);
  smo2(3) <= nse(0) and sum2(3);
  smo2(4) <= nse(0) and sum2(4);

  smo <= smo1 or smo2;
    --c <='1';
    --sum(0) <= nsi(0) xor c;
    --t <= nsi(0) and c;
    --sum(1) <= nsi(1) xor t;
    --f <= nsi(1) and t;
    --sum(2) <= nsi(2) xor f;
    --g <= nsi(2) and f;
    --sum(3) <= nsi(3) xor g;
    --smo <= sum;

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
