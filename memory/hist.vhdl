library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity hist is
  port (
  clk : in std_logic;
  se : in std_logic;
  z_addr : in std_logic_vector(1 downto 0);
  i_addr : in std_logic_vector(1 downto 0);
  we : in std_logic;
  D : in std_logic_vector(3 downto 0);
  Q: out std_logic_vector(3 downto 0)
  );
end entity;

architecture hist of hist is
  type ram_type is array(6 downto 0) of std_logic_vector(3 downto 0);
  signal ram : ram_type := ("0000","0000","0000","0000","0000","0000","0000");
  signal Qt : std_logic_vector(3 downto 0) :="0000";
  begin
    process(clk)
    begin
      if rising_edge(clk) then
        if we = '1' then
          if se = '1' then
            --1 for increment, 0 for zeroing
            Q<=ram(conv_integer(i_addr)) + 1;
            ram(conv_integer((i_addr)))<=ram(conv_integer((i_addr))) + 1;
          elsif se = '0' then
            --addr<=z_addr;
            Q<=ram(conv_integer((z_addr)));
            ram(conv_integer((z_addr)))<="0000";
          end if;
        end if;
      end if;
    end process;
end architecture;
