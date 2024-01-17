-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the General Purpose register. )

library IEEE;

use IEEE.std_logic_1164.all;

-- Interrupt unity entity
entity FPRegister is

    port(
        cpu_ingoing_mantissa : in std_logic_vector(57 downto 0) := (others => '0');
        cpu_ingoing_exponent : in std_logic_vector(27 downto 0) := (others => '0');
        cpu_ingoing_sign : in std_logic := '0';
        cpu_ingoing_ident : in natural := 0;
        cpu_incoming_clk : in std_logic := '1'
    );

end FPRegister;

-- Interrupt unit body.
architecture FPRegisterArch of FPRegister is

    -- Standard IRQ
    signal signal_mantissa : std_logic_vector(57 downto 0) := (others => '0');
    signal signal_exponent : std_logic_vector(27 downto 0) := (others => '0');
    signal signal_sign : std_logic := '0';
    signal signal_reset : std_logic := '1';
    signal signal_ident : natural := 0;

begin
    
    FPRegisterPro : process
    begin
        if (signal_reset = '1') then
            signal_ident <= cpu_ingoing_ident;
        end if;

        if (cpu_ingoing_ident = signal_ident) then
            signal_mantissa <= cpu_ingoing_mantissa;
            signal_exponent <= cpu_ingoing_exponent;
            signal_sign <= cpu_ingoing_sign;

            report "GP: DATA: " & to_hstring(signal_exponent) & "." & to_hstring(signal_mantissa);
        end if;

        wait on cpu_incoming_clk;
    end process ; -- FPRegisterPro

end FPRegisterArch ; -- FPRegisterArch