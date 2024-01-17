-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the General Purpose register bank. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

ENTITY GPRegisterBank IS
  PORT (
    cpu_register_select : IN NATURAL := 0;
    cpu_register_data : IN STD_LOGIC_VECTOR(127 DOWNTO 0) := (OTHERS => '0');
    cpu_clk : IN STD_LOGIC
  );
END GPRegisterBank;

ARCHITECTURE GPRegisterBankArch OF GPRegisterBank IS

  SIGNAL cpu_reset : STD_LOGIC := '1';

BEGIN

  cpu_r0_inst : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => (OTHERS => '0'),
    cpu_ingoing_ident => 0,
    cpu_incoming_clk => cpu_clk);
  GPRegisterBankLogic : PROCESS
  BEGIN
    IF (cpu_reset = '1') THEN
      REPORT "GPRB: RESET";
    END IF;

    WAIT ON cpu_clk;
  END PROCESS; -- GPRegisterBankLogic

END GPRegisterBankArch; -- GPRegisterBankArch