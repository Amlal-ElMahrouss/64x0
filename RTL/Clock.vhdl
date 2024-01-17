-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the circuit's clock. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

ENTITY Clock IS
  PORT (
    outgoing_cpu_clk : OUT STD_LOGIC
  );
END Clock;

ARCHITECTURE ClockArch OF Clock IS

  SIGNAL cpu_clk : STD_LOGIC := '0';

BEGIN

  ClockPro : PROCESS
  BEGIN
    cpu_clk <= NOT cpu_clk;
    WAIT FOR 100 ns;
    outgoing_cpu_clk <= cpu_clk;

    IF (cpu_clk = '1') THEN
      REPORT "CLK: RISE";
    END IF;
  END PROCESS; -- ClockPro

END ClockArch; -- ClockArch