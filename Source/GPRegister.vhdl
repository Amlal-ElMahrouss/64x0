-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the General Purpose register. )

library IEEE;

use IEEE.std_logic_1164.all;

-- Interrupt unity entity
entity GPRegister is

    port(
        cpu_ingoing_data : in std_logic_vector(127 downto 0) := (others => '0');
        cpu_incoming_clk : in std_logic := '1'
    );

end GPRegister;

-- Interrupt unit body.
architecture GPRegisterArch of GPRegister is

    -- Standard IRQ
    signal signal_data : std_logic_vector(127 downto 0) := (others => '0');

begin
    
    GPRegisterPro : process
    begin
        signal_data <= cpu_ingoing_data;

        report "GP: DATA: " & to_hstring(signal_data);

        wait on cpu_incoming_clk;
    end process ; -- GPRegisterPro

end GPRegisterArch ; -- GPRegisterArch