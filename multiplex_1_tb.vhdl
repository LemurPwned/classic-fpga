library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplex_1_tb is
end entity;

architecture behav of multiplex_1_tb is
  component multiplex_1
  port (
  smi : in std_logic_vector(6 downto 0);
  smo : out std_logic;
  se : in std_logic_vector(2 downto 0)
  );
end component;

for multiplex_1_0 : multiplex_1 use entity work.multiplex_1;

signal smi : std_logic_vector (6 downto 0);
signal se : std_logic_vector (2 downto 0);
signal smo : std_logic;
begin
  multiplex_1_0: multiplex_1 port map (smi=>smi, smo=>smo, se=>se);
  process
  begin
    smi <= "0000001";
    se <= "000";
    wait for 5 ns;
    smi <= "0000010";
    se <= "001";
    wait for 5 ns;
    smi <= "1111011";
    se <= "011";
    wait for 5 ns;
    smi <= "0000100";
    se <= "010";
    wait for 5 ns;
    smi<= "0010000";
    se <= "100";
    wait for 5 ns;
    smi <= "0100000";
    se <= "101";
    wait for 5 ns;
    smi <= "0111111";
    se <= "110";
    wait for 5 ns;
    wait;
  end process;

end architecture;
