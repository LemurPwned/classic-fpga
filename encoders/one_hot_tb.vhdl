library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity one_hot_tb is
end entity;

architecture behav of one_hot_tb is
  component one_hot
  port(
    si : in std_logic_vector (6 downto 0);
    so : out std_logic_vector (2 downto 0)
  );
end component;

for one_hot_0 : one_hot use entity work.one_hot;
signal si : std_logic_vector(6 downto 0) := "0000000";
signal so : std_logic_vector(2 downto 0);
begin
one_hot_0 : one_hot port map (si=>si, so=>so);
process
  begin
    si<="0000000";
    wait for 5 ns;

    si<="0000001";
    wait for 5 ns;

    si<="0000100";
    wait for 5 ns;

    si<="0100000";
    wait for 5 ns;
    
    si<="1000000";
    wait for 5 ns;
    wait;
  end process;
end architecture;
