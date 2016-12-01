library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity abs_1_tb is
end entity;

architecture behav of abs_1_tb is
    component abs_1
    port (
    si : in std_logic_vector(4 downto 0);
    smo : out std_logic_vector(3 downto 0)
    );
  end component;

for abs_1_0 : abs_1 use entity work.abs_1;

signal si : std_logic_vector(4 downto 0) :="00000";
signal smo: std_logic_vector(3 downto 0);


begin
  abs_1_0 : abs_1 port map (si=>si, smo=>smo);
  process
    begin
      si<="10011";
      wait for 5 ns;
      si<="00111";
      wait for 5 ns;
      si<="10111";
      wait for 5 ns;
      wait;
    end process;
end architecture;
