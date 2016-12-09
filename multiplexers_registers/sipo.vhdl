library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sipo is
  port (
  clk : in std_logic;
  se : in std_logic_vector(1 downto 0);
  D : in std_logic_vector(3 downto 0);
  Dl, Dr : in std_logic;
  Q : out std_logic_vector(3 downto 0) :="0000"
  );
end entity;

architecture behav of sipo is
  signal Qt : std_logic_vector(3 downto 0) :="0000";
begin
  process(clk, se)
  begin
    if rising_edge(clk) then
      if se(0) = '0' then
        Qt<=Dl&Qt(3 downto 1);
      elsif se(1) = '1' then
        Qt<=Qt(2 downto 0)&Dr;
      else
        Qt<=D;
      end if;
    end if;
end process;
Q<=Qt;
end architecture;
