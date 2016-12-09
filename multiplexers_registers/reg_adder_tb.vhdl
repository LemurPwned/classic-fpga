library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg_adder_tb is
end entity;

architecture reg_adder_tb of reg_adder_tb is
component reg_adder is
  port (
  A, B: in std_logic_vector (3 downto 0);
  clk : in std_logic;
  se : in std_logic;
  C: out std_logic_vector(3 downto 0);
  over : out std_logic
  );
end component;

  signal A,B,C : std_logic_vector(3 downto 0):="0000";
  signal clk, se, over : std_logic :='0';
  constant period : time := 10 ns;

begin
  uut: reg_adder port map (clk=>clk, A=>A, B=>B, C=>C, se=>se, over=>over);
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
        B<="0110";
        wait for 20 ns;

        se<='0';
        wait for 100 ns;
        wait;
      end process;

end architecture;
