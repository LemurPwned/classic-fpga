  library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.STD_LOGIC_UNSIGNED.ALL;

  entity counter is
    port(
    clk, res_as, up : in std_logic;
    count : out std_logic_vector (3 downto 0)
    );
  end entity;

  architecture behav of counter is
    signal Q : std_logic_vector (3 downto 0) := "0000";
    signal N : std_logic_vector (3 downto 0) := "1001";
    signal t : std_logic;
  begin
    process (clk, res_as)
    begin
      if res_as = '1' or (Q(2)='1' and Q(0)='1') then
        Q<=(others=>'0');
      elsif rising_edge(clk) then
        if up='1' then
          Q<=Q+1;
        elsif up='0' then
          Q<=Q-1;
        end if;
      end if;
    end process;
    count <= Q;
  end architecture;
