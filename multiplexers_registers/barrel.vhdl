library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity barrel is
  port (
  clk : in std_logic;
  se : in std_logic_vector(1 downto 0);
  I : in std_logic_vector(3 downto 0);
  Q : out std_logic_vector(3 downto 0);
  Q2 : out std_logic_vector(3 downto 0)
  );
end entity;

architecture arch of barrel is
  signal Qt, Qt2 : std_logic_vector(3 downto 0):="0000";

begin
  process(clk, se)
    begin
      if rising_edge(clk) then
        if (se(0)='0' and se(1)='0') then
          Qt<=I;
          Qt2<=I;
        elsif (se(0)='1' and se(1)='0') then
          Qt<=I(3 downto 1)&"0";
          Qt2<=I(3)&I(3 downto 1);
        elsif (se(0)='0' and se(1)='1') then
          Qt<=I(3 downto 2)&"00";
          Qt2<=I(3)&I(3)&I(3 downto 2);
        else
          Qt<=I(3)&"000";
          Qt2<=(others =>I(3));
        end if;
      end if;
    end process;
    Q<=Qt;
    Q2<=Qt2;
end architecture;
