library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity compar_fsm is
  port(
    clk : in std_logic;
    reset : in std_logic;
    ab : in std_logic_vector(1 downto 0);
    --this is pair of bits of two numbers, a0b0, a1b1, etc.., easier to process
    o: out std_logic_vector(1 downto 0)
    -- 00 is equal, 10 a is bigger, 01 b is bigger
  );
end entity;

architecture compar_fsm of compar_fsm is
type state_type is (A,B,C);
signal state : state_type := C;
begin
  process(clk)
    begin
      if reset = '1' then
        state<=C;
        o<="00";
      elsif rising_edge(clk) then
        case state is
          when C =>
            o<="00";
            if (ab(0)='1' and ab(1)='0') then
              state<=B;
              o<="01";
            elsif (ab(0)='0' and ab(1)='1') then
              state<=A;
              o<="10";
            else
              state<=C;
            end if;
          when B =>
            o<="01";
            if (ab(0)='0' and ab(1)='1') then
              state<=A;
              o<="10";
            else
              state<=B;
              o<="01";
            end if;
          when A =>
            o<="10";
            if (ab(0)='1' and ab(1)='0') then
              state<=B;
              o<="01";
            else
              state<=A;
              o<="10";
            end if;
            when others => NULL;
          end case;
          end if;
        end process;
end architecture;
