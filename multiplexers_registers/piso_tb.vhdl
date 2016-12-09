library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity piso_tb is
end entity;

architecture behav of piso_tb is
  component piso is
    port (
    clk : in std_logic;
    se : in std_logic_vector(1 downto 0);
    D : in std_logic_vector(3 downto 0);
    Din : in std_logic;
    Q : out std_logic :='0'
    );
  end component;
  for piso_0 : piso use entity work.piso;
  signal clk, Din, Q : std_logic :='0';
  signal D : std_logic_vector(3 downto 0);
  signal se : std_logic_vector(1 downto 0);
  constant period : time := 10 ns;
begin
  piso_0 : piso port map (clk=>clk, se=>se, D=>D, Din=>Din, Q=>Q);
  clk_process:
  process
    begin
      clk <= not clk;
      wait for period/2;
    end process;

  stim_proc:
  process
    begin
      D<="1101";
      se<="01";
      wait for 5 ns;

      se<="10";
      wait for 50 ns;

      se<="01";
      wait for 10 ns;

      Din<='1';
      se<="10";
      wait for 80 ns;
      wait ;
  end process;

end architecture;
