library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity code_det_tb is
end entity;

architecture code_det_tb of code_det_tb is
component code_det is
  port (
  clk : in std_logic;
  I : in std_logic_vector (3 downto 0);
  O : out std_logic
  );
end component;

  signal clk : std_logic :='1';
  signal O : std_logic :='0';
  signal I : std_logic_vector(3 downto 0) :="0000";
  constant period : time := 10 ns;
  begin
    mapping: code_det port map(clk=>clk, O=>O, I=>I);
    clk_proc : process
    begin
      clk<= not clk;
      wait for period/2;
    end process;

    stim_proc: process
    begin
      I<="0001";
      wait for 10 ns;
      I<="0011";
      wait for 10 ns;
      I<="1001";
      wait for 10 ns;
      I<="0001";
      wait for 10 ns;
      I<="1001";
      wait for 10 ns;
      I<="0111";
      wait for 10 ns;
      I<="0010";
      wait for 10 ns;
      I<="0001";
      wait for 10 ns;
      I<="0110";
      wait for 10 ns;
      wait;
    end process;

end architecture;
