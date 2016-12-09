library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity trans_tb is
end entity;

architecture behav of trans_tb is
component trans is
  port (
  A : in std_logic_vector (3 downto 0);
  clk : in std_logic;
  se : in std_logic;
  C: out std_logic_vector(3 downto 0);
  sum : out std_logic_vector(2 downto 0)
  );
end component;

  signal A, C : std_logic_vector(3 downto 0):="0000";
  signal sum : std_logic_vector(2 downto 0) :="000";
  signal clk, se: std_logic :='0';
  constant period : time := 10 ns;

begin
  uut: trans port map (clk=>clk, A=>A, C=>C, se=>se, sum=>sum);
  clk_proc:
  process
    begin
      clk<=not clk;
      wait for period/2;
    end process;

    stim_proc:
    process
      begin
        se<='1';
        A<="1101";
        wait for 20 ns;

        se<='0';
        wait for 100 ns;
        wait;
      end process;

end architecture;
