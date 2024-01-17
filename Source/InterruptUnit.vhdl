-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the Interrupt Unit. )

library IEEE;

use IEEE.std_logic_1164.all;

-- Interrupt unity entity
entity InterruptUnit is

    port(

        cpu_incoming_irq : in std_logic_vector(7 downto 0) := (others => '0');
        cpu_incoming_nmi : in std_logic_vector(7 downto 0) := (others => '0');
        cpu_incoming_clk : in std_logic := '1';
        cpu_outgoing_rst : out std_logic := '0';
        cpu_incoming_code_level : in std_logic_vector(7 downto 0) := (others => '0');
        cpu_outgoing_ip : out std_logic_vector(57 downto 0) := (others => '0')
    );

end InterruptUnit;

-- Interrupt unit body.
architecture InterruptUnitArch of InterruptUnit is

    -- Standard IRQ
    signal signal_irq : std_logic_vector(7 downto 0) := (others => '0');

    -- NMI irq
    signal signal_nmi_irq : std_logic_vector(7 downto 0) := (others => '0');

    signal cpu_ivt_ip : std_logic_vector(57 downto 0) := (others => '0');

begin
    
    InterruptUnitPro : process
    begin
        signal_irq <= cpu_incoming_irq;
        signal_nmi_irq <= cpu_incoming_nmi;

        cpu_outgoing_ip <= cpu_ivt_ip;

        report "IU: IRQ: " & to_hstring(signal_irq);

        if (signal_nmi_irq = std_logic_vector'(x"01")) then
            report "IU: INVALID_NMI_INTERRUPT";
            cpu_outgoing_rst <= '1';
        end if;

        wait on cpu_incoming_clk;
    end process ; -- InterruptUnitPro

end InterruptUnitArch ; -- InterruptUnitArch