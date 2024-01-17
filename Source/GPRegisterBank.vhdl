-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the General Purpose register bank. )

library IEEE;

use IEEE.std_logic_1164.all;

entity GPRegisterBank is
  port (
    cpu_register_select : in natural := 0;
    cpu_register_data : in std_logic_vector(127 downto 0) := (others => '0');
    cpu_clk : in std_logic
  ) ;
end GPRegisterBank;

architecture GPRegisterBankArch of GPRegisterBank is

    signal cpu_reset : std_logic := '1';

begin

    GPRegisterBankLogic : process
    begin
        if (cpu_reset = '1') then
            report "GPRB: RESET";
        end if;
        
        wait on cpu_clk;
    end process ; -- GPRegisterBankLogic

end GPRegisterBankArch ; -- GPRegisterBankArch