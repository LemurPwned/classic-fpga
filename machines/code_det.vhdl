library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity code_det is
  port (
  clk : in std_logic;
  I : in std_logic_vector (3 downto 0);
  O : out std_logic
  );
end entity;
-- seq 9721
 architecture code_det of code_det is
 type state_type is (A, B, C, D);
 signal state : state_type := A;
 begin
   process(clk)
    begin
      if rising_edge(clk) then
        case state is
        when A=>
        O<='0';
        if I=9 then
          state<=B;
        else
          state<=A;
        end if;
        when B=>
        O<='0';
        if I=7 then
          state<=C;
        else
          state<=A;
        end if;
        when C=>
        O<='0';
        if I=2 then
          state<=D;
        else
          state<=C;
        end if;
        when D=>
        if I=1 then
          O<='1';
          state<=A;
        else
          O<='1';
          state<=A;
        end if;
      end case;
    end if;
    end process;
 end architecture;
