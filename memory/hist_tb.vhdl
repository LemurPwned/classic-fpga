library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hist_tb is
end entity;
architecture hist_tb of hist_tb is
  component hist is
    port (
    clk : in std_logic;
    se : in std_logic;
    z_addr : in std_logic_vector(1 downto 0);
    i_addr : in std_logic_vector(1 downto 0);
    we : in std_logic;
    D : in std_logic_vector(3 downto 0);
    Q: out std_logic_vector(3 downto 0)
    );
  end component;

  signal z_addr : std_logic_vector(1 downto 0):="00";
  signal i_addr : std_logic_vector(1 downto 0):="00";
  signal clk : std_logic :='1';
  signal we, se : std_logic :='0';
  signal Q, D : std_logic_vector(3 downto 0) := "0000";
  constant period : time := 10 ns;
begin
  mapping: hist port map(clk=>clk, se=>se, i_addr=>i_addr, z_addr=>z_addr,
                        we=>we, Q=>Q, D=>D);
  clk_proc :
  process
  begin
    clk<=not clk;
    wait for period/2;
  end process;

  stim_proc : process
  begin
    we<='1';

    se<='0';
    wait for 20 ns;

    se<='1';
    wait for 40 ns;
    se<='0';
    wait for 20 ns;

    i_addr<="10";
    z_addr<="10";
    wait for 10 ns;
    se<='1';
    wait for 40 ns;

    i_addr<="00";
    wait for 30 ns;
    z_addr<="00";
    se<='0';
    wait for 10 ns;
    i_addr<="10";
    se<='1';
    wait for 30 ns;
    se<='0';
    wait for 10 ns;
    wait;
  end process;
end architecture;
