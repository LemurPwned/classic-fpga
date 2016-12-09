library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sipo_tb is
end entity;

architecture arch of sipo_tb is
  component sipo is
    port (
    clk : in std_logic;
    se : in std_logic_vector(1 downto 0);
    D : in std_logic_vector(3 downto 0);
    Dl, Dr : in std_logic;
    Q : out std_logic_vector(3 downto 0)
    );
  end component;

  for sipo_0 : sipo use entity work.sipo;
    signal clk : std_logic :='1';
    signal Q, D : std_logic_vector(3 downto 0);
    signal Dl, Dr : std_logic;
    signal se : std_logic_vector(1 downto 0);
    constant period : time := 10 ns;

begin
  sipo_0 : sipo port map (clk=>clk, D=>D, Dr=>Dr, Dl=>Dl, Q=>Q, se=>se);
  clk_proc:
  process
  begin
    clk<=not clk;
    wait for period/2;
  end process;

  stim_proc:
  process
  begin
    se<="00";
    D<="1011";
    Dl<='1';
    Dr<='1';
    wait for 35 ns;

    se<="01";
    wait for 20 ns;

    se<="11";
    wait for 15 ns;

    wait;
  end process;

end architecture;
