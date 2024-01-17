-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the Interrupt Register. )

library IEEE;

use IEEE.std_logic_1164.all;

-- Interrupt unity entity
entity InterruptRegister is

    port(
        cpu_incoming_irq : in std_logic_vector(7 downto 0) := (others => '0');
        cpu_incoming_nmi : in std_logic_vector(7 downto 0) := (others => '0');
        cpu_incoming_clk : in std_logic := '1';
        cpu_outgoing_rst : out std_logic := '0';
        cpu_incoming_code_level : in std_logic_vector(7 downto 0) := (others => '0');
        cpu_outgoing_ip : out std_logic_vector(57 downto 0) := (others => '0')
    );

end InterruptRegister;

-- Interrupt unit body.
architecture InterruptRegisterArch of InterruptRegister is

    -- Standard IRQ
    signal signal_irq : std_logic_vector(7 downto 0) := (others => '0');

    -- NMI irq
    signal signal_nmi_irq : std_logic_vector(7 downto 0) := (others => '0');

    signal cpu_ivt_ip : std_logic_vector(57 downto 0) := (others => '0');

begin
    
    InterruptRegisterPro : process
    begin
        signal_irq <= cpu_incoming_irq;
        signal_nmi_irq <= cpu_incoming_nmi;

        cpu_outgoing_ip <= cpu_ivt_ip;

        report "IR: IRQ: " & to_hstring(signal_irq);

        wait on cpu_incoming_clk;
    end process ; -- InterruptRegisterPro

end InterruptRegisterArch ; -- InterruptRegisterArch