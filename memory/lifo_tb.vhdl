library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lifo_tb is
end entity;

architecture lifo_tb of lifo_tb is
component lifo is
  port (
  x : in std_logic_vector(3 downto 0);
  y : out std_logic_vector(3 downto 0);
  clk : in std_logic;
  wr : in std_logic;
  empty, full : out std_logic
  );
end component;
  signal x : std_logic_vector(3 downto 0) := "0000";
  signal y : std_logic_vector(3 downto 0) := "0000";
  signal clk : std_logic := '1';
  signal wr : std_logic := '0';
  signal empty : std_logic := '0';
  signal full : std_logic := '0';
  constant period : time := 10 ns;
begin
  mapping: lifo port map(clk=>clk, x=>x, y=>y, wr=>wr,
                          empty=>empty, full=>full);
  clk_proc : process
  begin
    clk <= not clk;
    wait for period/2;
  end process;

  stim_proc: process
  begin
    wait for 3 ns;
    x<="0100";
    wr<='1';
    wait for period;
    x<="1100";
    wait for period;
    wr<='0';
    wait for period;
    --wr<='0';
    --re<='1';
    wait;
  end process;

end architecture;
