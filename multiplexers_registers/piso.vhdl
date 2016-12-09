library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity piso is
  port (
  clk : in std_logic;
  se : in std_logic_vector(1 downto 0);
  D : in std_logic_vector(3 downto 0);
  Din : in std_logic;
  Q : out std_logic :='0'
  );
end entity;

architecture arch of piso is
  signal Qt : std_logic_vector (3 downto 0) := "0000";
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if se(0) = '1' then
        Qt<= D;
      else
        Qt(3 downto 0)<= Qt(2 downto 0) & Din;
      end if;
    end if;
    Q<=Qt(3);
  end process;
end architecture;
