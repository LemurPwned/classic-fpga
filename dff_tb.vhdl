library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dff_tb is
end entity;

architecture testbench of dff_tb is
  component dff
  port (
    clk : in std_logic;
    r : in std_logic;
    D : in std_logic;
    Q : out std_logic
  );
end component;

signal clk, D : std_logic;
signal r : std_logic := '0';
signal Q : std_logic := '0';

for dff_0: dff use entity work.dff;
begin
  dff_0 : dff port map (clk=>clk, r=>r, D=>D, Q=>Q);

  process
  begin
    clk <='0';
    wait for 5 ns;
    clk <='1';
    wait for 5 ns;
  end process;

  process
    begin
    D<='0';
    wait for 10 ns;

    D<='1';
    r<='1';
    wait for 10 ns;

    D<='0';
    r<='1';
    wait for 10 ns;

    D<='1';
    r<='0';
    wait;

  end process;
end architecture;
