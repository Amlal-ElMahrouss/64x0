-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the Hardware Thread Unit. )

library IEEE;

use IEEE.std_logic_1164.all;
use std.textio.all;

entity HardwareThread is

    port(

        -- address to fetch on.
        cpu_incoming_ip : in std_logic_vector(57 downto 0) := (others => '0');
        cpu_incoming_clk_signal : in std_logic := '1'

    );

end HardwareThread;

architecture HardwareThreadArch of HardwareThread is

    signal cpu_signal_reset : std_logic := '1';

    signal cpu_signal_ip : std_logic_vector(57 downto 0) := (others => '0');
    signal cpu_signal_reset_ip : std_logic_vector(57 downto 0) := (others => '0');
    
begin

    HardwareThreadPro : process
    begin
        cpu_signal_ip <= cpu_incoming_ip;

        if cpu_signal_reset = '1' then
            cpu_signal_ip <= cpu_signal_reset_ip;
        end if ;

        report "HT: STEP";

        wait on cpu_incoming_clk_signal;
    end process; -- HardwareThreadPro

end HardwareThreadArch; -- HardwareThread