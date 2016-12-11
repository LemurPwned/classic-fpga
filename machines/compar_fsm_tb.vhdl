library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity compar_fsm_tb is
end entity;

architecture behav of compar_fsm_tb is
component compar_fsm is
  port(
  clk : in std_logic;
  reset : in std_logic;
  ab : in std_logic_vector(1 downto 0);
  --this is pair of bits of two numbers, a0b0, a1b1, etc.., easier to process
  o: out std_logic_vector(1 downto 0)
  -- 00 is equal, 10 a is bigger, 01 b is bigger
  );
end component;

signal clk : std_logic :='1';
signal reset : std_logic :='0';
signal ab, o : std_logic_vector(1 downto 0) :="00";
constant period : time := 20 ns;

begin
  mapping: compar_fsm port map (clk=>clk, reset=>reset, ab=>ab, o=>o);
  clk_proc: process
  begin
    clk<=not clk;
    wait for period/4;
  end process;

  stim_proc: process
  begin
    ab<="00";
    wait for period;
    ab<="00";
    wait for period;
    ab<="10";
    wait for period;
    ab<="01";
    wait for period;
    ab<="10";
    wait for period;
    ab<="10";
    wait for period;
    ab<="10";
    wait for period;
    ab<="01";
    wait for period;
    ab<="00";
    wait for period;
    ab<="00";
    wait for period;
    wait;
  end process;
end architecture;
