library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ring_counter_tb is
end entity;

architecture ring_counter_tb of ring_counter_tb is
  component ring_counter is
    port (
    clk : in std_logic;
    Q, Q2 : out std_logic_vector(3 downto 0)
    );
  end component;
  signal clk : std_logic :='1';
  signal Q, Q2 : std_logic_vector(3 downto 0);
  constant period : time:= 10 ns;

begin
uut: ring_counter port map (clk=>clk, Q=>Q, Q2=>Q2);
clk_proc:
process
  begin
    clk<=not clk;
    wait for period/2;
  end process;
end architecture;
