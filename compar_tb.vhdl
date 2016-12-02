library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compar_tb is
end entity;

architecture behav of compar_tb is
  component compar is
    port (
    a : in std_logic_vector(3 downto 0);
    b : in std_logic_vector(3 downto 0);
    so_a : out std_logic;
    so_b : out std_logic
    );
  end component;
  signal a,b : std_logic_vector(3 downto 0);
  signal so_a, so_b : std_logic;
for compar_0: compar use entity work.compar;
begin
  compar_0: compar port map (a=>a, b=>b, so_a=>so_a, so_b=>so_b);
  process
  begin
    a<="1110";
    b<="0111";
    wait for 5 ns;

    b<="1110";
    a<="0000";
    wait for 5 ns;

    b<="0010";
    a<="0111";
    wait for 5 ns;

    b<="1010";
    a<="0111";
    wait for 5 ns;

    b<="0110";
    a<="0110";
    wait for 5 ns;
    wait;
  end process;
end architecture;
