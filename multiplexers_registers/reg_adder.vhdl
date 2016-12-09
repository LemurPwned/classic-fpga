library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity reg_adder is
  port (
  A, B: in std_logic_vector (3 downto 0);
  clk : in std_logic;
  se : in std_logic;
  C: out std_logic_vector(3 downto 0);
  over : out std_logic
  );
end entity;

architecture reg_adder of reg_adder is
  signal a1,b1, o: std_logic_vector(3 downto 0) := "0000";
  signal c1, ci: std_logic :='0';
begin
  process(clk)
    begin
      if rising_edge(clk) then
      if se='1' then
        a1<= A;
        b1<= B;
      else
        c1<=a1(0) xor b1(0) xor ci;
        ci<=a1(0) and b1(0);
        a1<= '0'&a1(3 downto 1);
        b1<= '0'&b1(3 downto 1);
        o<=c1&o(3 downto 1);
      end if;
    end if;
  end process;
  over<=ci;
  C<=o;
end architecture;
