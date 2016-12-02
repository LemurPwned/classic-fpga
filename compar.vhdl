library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compar is
  port (
  a : in std_logic_vector(3 downto 0);
  b : in std_logic_vector(3 downto 0);
  so_a : out std_logic;
  so_b : out std_logic
  );
end entity;

architecture behav of compar is
signal a_b, b_b,a_b1, b_b1,a_b2, b_b2,a_b3, b_b3, a_b4, b_b4: std_logic;
begin
  a_b<='0';
  b_b<='0';
  a_b1<=(a(0) and (not b(0))) or (a_b and a(0)) or ((a_b and (not (b(0)))));
  b_b1<=((not a(0)) and b(0)) or ((not a(0)) and b_b) or (b(0) and b_b);
  a_b2<=(a(1) and (not b(1))) or (a_b1 and a(1)) or ((a_b1 and (not (b(1)))));
  b_b2<=((not a(1)) and b(1)) or ((not a(1)) and b_b1) or (b(1) and b_b1);
  a_b3<=(a(2) and (not b(2))) or (a_b2 and a(2)) or ((a_b2 and (not (b(1)))));
  b_b3<=((not a(2)) and b(2)) or ((not a(2)) and b_b2) or (b(2) and b_b2);
  a_b4<=(a(3) and (not b(3))) or (a_b3 and a(3)) or ((a_b3 and (not (b(3)))));
  b_b4<=((not a(3)) and b(3)) or ((not a(3)) and b_b3) or (b(3) and b_b3);
  so_a <= a_b4;
  so_b <= b_b4;
end architecture;
