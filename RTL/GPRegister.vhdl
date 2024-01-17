-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the General Purpose register. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

-- Interrupt unity entity
ENTITY GPRegister IS

    PORT (
        cpu_ingoing_data : IN STD_LOGIC_VECTOR(127 DOWNTO 0) := (OTHERS => '0');
        cpu_ingoing_ident : IN NATURAL := 0;
        cpu_incoming_clk : IN STD_LOGIC := '1'
    );

END GPRegister;

-- Interrupt unit body.
ARCHITECTURE GPRegisterArch OF GPRegister IS

    -- Standard IRQ
    SIGNAL signal_data : STD_LOGIC_VECTOR(127 DOWNTO 0) := (OTHERS => '0');
    SIGNAL signal_reset : STD_LOGIC := '1';
    SIGNAL signal_ident : NATURAL := 0;

BEGIN

    GPRegisterPro : PROCESS
    BEGIN
        IF (signal_reset = '1') THEN
            signal_ident <= cpu_ingoing_ident;
        END IF;

        IF (cpu_ingoing_ident = signal_ident) THEN
            signal_data <= cpu_ingoing_data;

            REPORT "GP: DATA: " & to_hstring(signal_data);
        END IF;

        WAIT ON cpu_incoming_clk;
    END PROCESS; -- GPRegisterPro

END GPRegisterArch; -- GPRegisterArch