-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the fetch stage. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

ENTITY InstructionFetch IS
    PORT (
		cpu_data : IN STD_LOGIC_VECTOR(127 DOWNTO 0) := (OTHERS => '0')
    );
END InstructionFetch;

ARCHITECTURE InstructionFetchArch OF InstructionFetch IS

    SIGNAL cpu_clk_s : STD_LOGIC := '0';
    SIGNAL cpu_opcode_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cpu_funct3_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cpu_funct7_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

BEGIN

    HW_CLK_STAGE : ENTITY work.ClockCircuit PORT MAP(outgoing_cpu_clk=>cpu_clk_s);

    HW_FETCH_STAGE : ENTITY work.InstructionDecode PORT MAP(
        cpu_clk=>cpu_clk_s,
        cpu_data=>cpu_data,
        cpu_opcode=>cpu_opcode_s,
        cpu_funct3=>cpu_funct3_s,
        cpu_funct7=>cpu_funct7_s
    );

END InstructionFetchArch;