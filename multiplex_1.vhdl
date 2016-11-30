library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplex_1 is
  port (
  smi : in std_logic_vector(6 downto 0);
  smo : out std_logic;
  se : in std_logic_vector(2 downto 0)
  );
end entity;

architecture behav of multiplex_1 is
  signal cp : std_logic_vector(2 downto 0);
  signal smo_1 : std_logic_vector(6 downto 0);
begin
  cp <= not se;
  smo_1(0) <= (smi(0) and cp(0) and cp(1) and cp(2));
  smo_1(1) <= (smi(1) and cp(0) and cp(1) and se(2));
  smo_1(2) <= (smi(2) and cp(0) and se(1) and cp(2));
  smo_1(3) <= (smi(3) and cp(0) and se(1) and se(2));
  smo_1(4) <= (smi(4) and se(0) and cp(1) and cp(2));
  smo_1(5) <= (smi(5) and se(0) and cp(1) and se(2));
  smo_1(6) <= (smi(6) and se(0) and se(1) and cp(2));
  smo <= smo_1(0) or smo_1(1) or smo_1(2) or smo_1(3) or smo_1(4) or smo_1(5) or smo_1(6);
end architecture;
