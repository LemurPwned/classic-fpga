library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity one_hot is
  port(
    si : in std_logic_vector (6 downto 0);
    so : out std_logic_vector (2 downto 0)
  );
end entity;

architecture behav of one_hot is
signal si_1 : std_logic_vector(6 downto 0);

begin
  si_1 <= si;
  so(0) <= si_1(0) or si_1(2) or si_1(4) or si_1(6);
  so(1) <= si_1(1) or si_1(2) or si_1(5) or si_1(6);
  so(2) <= si_1(3) or si_1(4) or si_1(5) or si_1(6);

  --C LSB
  --so(0) = (nso_1(2) and nso_1(1) and so_1(0)) and (nso_1(2) and so_1(1) and so_1(0)) and (so_1(2) and nso_1(1) and so_1(0)) and (so_1(2) and so_1(1) and so_1(0));
  --so(1) = (nso_1(2) and so_1(1) and nso_1(0)) and (so_1(2) and so_1(1) and nso_1(0)) and (so_1(2) and so_1(1) and so_1(0));
  --so(2) = (nso_1())
end architecture;
