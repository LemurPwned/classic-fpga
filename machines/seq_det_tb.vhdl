library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seq_det_tb is
end entity;

architecture behav of seq_det_tb is
component seq_det is
  port(
    clk : in std_logic;
    reset : in std_logic;
    seq : in std_logic;
    det : out std_logic
  );
end component;

signal clk : std_logic :='1';
signal reset, det, seq : std_logic :='0';
constant period : time := 10 ns;

begin
  mapping: seq_det port map (clk=>clk, reset=>reset, seq=>seq, det=>det);
  clk_proc: process
  begin
    clk<=not clk;
    wait for period/2;
  end process;

  stim_proc: process
  begin
    seq<='1';
    wait for period;
    seq<='1';
    wait for period;
    seq<='0';
    wait for period;
    seq<='1';
    wait for period;
    seq<='0';
    wait for period;
    seq<='1';
    wait for period;
    seq<='0';
    wait for period;
    seq<='1';
    wait for period;
    seq<='1';
    wait for period;
    seq<='1';
    wait for period;
    wait;
  end process;
end architecture;
