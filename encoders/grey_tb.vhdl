library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity grey_tb is
end entity;

architecture behav of grey_tb is
  component grey is
    port (
      si : in std_logic_vector(2 downto 0);
      so : out std_logic_vector(2 downto 0)
    );
  end component;

for grey_0 : grey use entity work.grey;
signal si, so : std_logic_vector(2 downto 0);
begin
  grey_0: grey port map(si=>si, so=>so);
  process
  begin
    si<="000";
    wait for 5 ns;

    si<="010";
    wait for 5 ns;

    si<="100";
    wait for 5 ns;

    si<="110";
    wait for 5 ns;
    wait;
  end process;
end architecture;
