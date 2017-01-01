library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity dram is
  port (
  clk : in std_logic;
  I : in std_logic;
  addr : in std_logic_vector(3 downto 0);
  di : in std_logic_vector(7 downto 0);
  do : out std_logic_vector(7 downto 0)
  );
end entity;

architecture dram of dram is
  type ram_tye is array(15 downto 0) of std_logic_vector(7 dowonto 0);
  signal RAM: ram_type;
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if I='1' then
        RAM(conv_integer(ADDR)) <= di;
      end if;
    end if;
  end process;
  do<=RAM(conv_integer(ADDR));
end architecture;
