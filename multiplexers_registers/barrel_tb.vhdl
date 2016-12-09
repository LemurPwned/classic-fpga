library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity barrel_tb is
end entity;

architecture barrel_tb of barrel_tb is
component barrel is
  port (
  clk : in std_logic;
  se : in std_logic_vector(1 downto 0);
  I : in std_logic_vector(3 downto 0);
  Q,Q2 : out std_logic_vector(3 downto 0)
  );
end component;

for barrel_0 : barrel use entity work.barrel;
signal clk : std_logic :='1';
signal se : std_logic_vector(1 downto 0);
signal Q,Q2,I : std_logic_vector(3 downto 0);
constant period : time := 10 ns;
begin
  barrel_0: barrel port map(clk=>clk, se=>se, I=>I, Q=>Q, Q2=>Q2);
  clk_proc:
  process
    begin
      clk<=not clk;
      wait for period/2;
    end process;

    stim_proc:
    process
      begin
        I<="1001";
        se<="00";
        wait for 20 ns;


        se<="01";
        wait for 20 ns;


        se<="10";
        wait for 20 ns;


        se<="11";
        wait for 20 ns;
        wait;
      end process;

end architecture;
