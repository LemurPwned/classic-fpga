library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multi_oc_tb is
end entity;

architecture behav of multi_oc_tb is
  component multi_oc
  port(
  si : in std_logic_vector (3 downto 0);
  se : in std_logic_vector (1 downto 0);
  so : out std_logic
 );
end component;

for multi_oc_0 : multi_oc use entity work.multi_oc;

signal si : std_logic_vector (3 downto 0);
signal se : std_logic_vector (1 downto 0);
signal so : std_logic;
begin
  multi_oc_0 : multi_oc port map (si=>si, se=>se, so=>so);
  process
  begin
    si<="1110";
    se<="10";
    wait for 5 ns;

    si<="1110";
    se<="00";
    wait for 5 ns;

    si<="1110";
    se<="01";
    wait for 5 ns;

    si<="1110";
    se<="11";
    wait for 5 ns;
    wait;
  end process;
end architecture;
