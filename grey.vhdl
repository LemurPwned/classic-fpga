library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
------------------------------------
--BCD TO GREY DECODER
------------------------------------
entity grey is
  port (
    si : in std_logic_vector(2 downto 0);
    so : out std_logic_vector(2 downto 0)
  );
end entity;

architecture arch of grey is
signal nsi :std_logic_vector(2 downto 0);
signal n1, n2, n3, n4, n5, n6, n7 : std_logic;
begin
  nsi <= not si;
  --1,2,5,6
  n1<= nsi(2) and nsi(1) and si(0);
  n2<= nsi(2) and si(1) and nsi(0);
  n3<= nsi(2) and si(1) and si(0);
  n4<= si(2) and nsi(1) and nsi(0);
  n5<= si(2) and nsi(1) and si(0);
  n6<= si(2) and si(1) and nsi(0);
  n7<= si(2) and si(1) and si(0);

  so(0) <= n1 or n2 or n5 or n6;
  so(1) <= n2 or n3 or n4 or n5;
  so(2) <= n4 or n5 or n6 or n7;
end architecture;
