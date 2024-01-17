-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the circuit's clock. )

library IEEE;

use IEEE.std_logic_1164.all;

entity Clock is
  port(
    outgoing_cpu_clk: out std_logic
  );
end Clock;

architecture ClockArch of Clock is

  signal cpu_clk : std_logic := '0';

begin

  ClockPro : process
  begin
    cpu_clk <= not cpu_clk;
    wait for 100 ns;
    outgoing_cpu_clk <= cpu_clk;

    if (cpu_clk = '1') then
      report "CLK: RISE";
    end if;
  end process ; -- ClockPro

end ClockArch ; -- ClockArch