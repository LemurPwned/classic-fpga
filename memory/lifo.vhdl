library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lifo is
  port (
  x : in std_logic_vector(3 downto 0);
  y : out std_logic_vector(3 downto 0) :="0000";
  clk : in std_logic;
  wr : in std_logic; -- wr =1 to write wr = 0 to read
  empty, full : out std_logic :='0'
  );
end entity;

architecture lifo of lifo is
  type ram_type is array(5 downto 0) of std_logic_vector(3 downto 0);
  signal lifo : ram_type :=("0000","0000","0000","0000","0000","0000");
  signal last : integer range -1 to 5 := -1;
begin
  process(clk)
  begin
      if rising_edge(clk) then
        if wr = '1' then
          if last < 5 then
            lifo(last+1)<=x;
            last <= last +1;
            if last = 5 then
              full <= '1';
            end if;
          end if;
        elsif wr = '0' then
          if last > -1 then
            y<=lifo(last);
            last <= last -1;
            if last = -1 then
              empty <= '1';
            end if;
          end if;
        end if;
      end if;
end process;

end architecture;
