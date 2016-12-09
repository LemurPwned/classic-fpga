library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ring_counter is
 port (
 clk : in std_logic;
 Q, Q2 : out std_logic_vector(3 downto 0)
 );
end entity;

architecture ring_counter of ring_counter is
  signal Qt1 : std_logic_vector(3 downto 0) :="0001";
  signal Qt2 : std_logic_vector(3 downto 0) :="0000";

begin
  process(clk)
    begin
      if rising_edge(clk) then
        --Qt1 is one hot, Qt2 is Johnson
        Qt1(0)<=Qt1(3);
        Qt1(1)<=Qt1(0);
        Qt1(2)<=Qt1(1);
        Qt1(3)<=Qt1(2);

        Qt2(0)<=not Qt2(3);
        Qt2(1)<=Qt2(0);
        Qt2(2)<=Qt2(1);
        Qt2(3)<=Qt2(2);
      end if;
    end process;
    Q<=Qt1;
    Q2<=Qt2;
end architecture;
