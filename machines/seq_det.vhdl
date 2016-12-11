library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seq_det is
  port(
    clk : in std_logic;
    reset : in std_logic;
    seq : in std_logic;
    det : out std_logic
  );
end entity;
architecture seq_det of seq_det is
type state_type is (A,B,C,D);
signal state : state_type := A;
begin
  process(clk)
    begin
      if reset='1' then
        det<='0';
        state<=A;
      elsif rising_edge(clk) then
        case state is
          when A =>
            det<='0';
            if seq = '0' then
              state<=A;
            else
              state<=B;
            end if;
          when B =>
            if seq = '0' then
              state<=C;
            else
              state<=B;
            end if;
          when C =>
            if seq = '0' then
              state<=A;
            else
              state<=D;
            end if;
          when D=>
            if seq = '0' then
              state<=C;
            else
              state<=A;
              det<='1';
            end if;
          when others => NULL;
        end case;
      end if;
    end process;
end architecture;
