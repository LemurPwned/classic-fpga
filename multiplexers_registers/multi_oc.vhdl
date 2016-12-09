library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multi_oc is
  port (
    si : in std_logic_vector (3 downto 0);
    se : in std_logic_vector (1 downto 0);
    so : out std_logic
  );
end entity;

architecture behav of multi_oc is
signal s0, s1, s2, s3 : std_logic;
signal sen : std_logic_vector(1 downto 0);
begin
  sen <= not se;
  s0 <= 'X' when (sen(0)='1' and sen(1)='1' and si(0) = '1') else '0';
  s1 <= 'X' when (se(0)='1' and sen(1)='1' and si(2) = '1') else '0';
  s2 <= 'X' when (sen(0)='1' and se(1)='1' and si(2) = '1') else '0';
  s3 <= 'X' when (se(0)='1' and se(1)='1' and si(3) = '1') else '0';

  so <= s0;
  so <= s1;
  s0 <= s2;
  s0 <= s3;


end architecture;
