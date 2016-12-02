library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity abs_1_tb is
end entity;

architecture behav of abs_1_tb is
    component abs_1
    port (
    si : in std_logic_vector(4 downto 0);
    smo : out std_logic_vector(4 downto 0);
    se : in std_logic_vector(0 downto 0);
    s : in std_logic_vector(0 downto 0)
    );
  end component;

for abs_1_0 : abs_1 use entity work.abs_1;

signal si : std_logic_vector(4 downto 0) :="00000";
signal smo: std_logic_vector(4 downto 0);
signal se, s :std_logic_vector (0 downto 0);


begin
  abs_1_0 : abs_1 port map (si=>si, smo=>smo, se=>se, s=>s);
  process
    begin
      si<="10011";
      se<="1";
      s<="1";
      wait for 5 ns;

      si<="10011";
      se<="0";
      s<="1";
      wait for 5 ns;

      si<="10000";
      se<="0";
      s<="1";
      wait for 5 ns;

      si<="11011";
      se<="0";
      s<="1";
      wait for 5 ns;

      si<="11011";
      se<="1";
      s<="0";
      wait for 5 ns;

      wait;
    end process;
end architecture;
