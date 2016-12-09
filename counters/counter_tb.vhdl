library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_tb is
end entity;

architecture behavv of counter_tb is
component counter is
  port(
  clk, res_as, up : in std_logic;
  count : out std_logic_vector (3 downto 0)
  );
end component;
for counter_0 : counter use entity work.counter;
  signal clk,up : std_logic :='1';
  signal res_as : std_logic:='0';
  signal count : std_logic_vector(3 downto 0);
  constant period : time := 10 ns;
begin
  counter_0 : counter port map (clk=>clk, res_as=>res_as, up=>up, count=>count);
  clk_process: process
  begin
    clk<=not clk;
    wait for period/2;
  end process;
  stim_proc : process
  begin
    res_as<='0';
    up<='1';
    wait for 80 ns;

    up<='0';
    wait for 30 ns;

    res_as<='1';
    wait for 10 ns;
    wait;
  end process;

end architecture;
