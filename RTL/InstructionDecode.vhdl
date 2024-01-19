-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the decode stage. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

ENTITY InstructionDecode IS
	PORT (
		cpu_clk : IN STD_LOGIC := '0';
		cpu_data : IN STD_LOGIC_VECTOR(127 DOWNTO 0) := (OTHERS => '0');
		cpu_opcode : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
		cpu_funct3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
		cpu_funct7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
		cpu_reg_left : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
		cpu_reg_right : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
		cpu_offset : OUT STD_LOGIC_VECTOR(24 DOWNTO 0) := (OTHERS => '0')
	);
END InstructionDecode;

ARCHITECTURE InstructionDecodeArch OF InstructionDecode IS
BEGIN

	InstructionDecodePro : PROCESS
	BEGIN
		cpu_opcode <= cpu_data(0) & cpu_data(1) & cpu_data(2) & cpu_data(3) & cpu_data(4) &
			cpu_data(5) & cpu_data(6) & cpu_data(7);

		cpu_funct3 <= cpu_data(8) & cpu_data(9) & cpu_data(10) & cpu_data(11) & cpu_data(12) &
			cpu_data(13) & cpu_data(14) & cpu_data(15);

		cpu_funct7 <= cpu_data(16) & cpu_data(17) & cpu_data(18) & cpu_data(19) & cpu_data(20) &
			cpu_data(21) & cpu_data(22) & cpu_data(23);

		cpu_reg_left <= cpu_data(24) & cpu_data(25) & cpu_data(26) & cpu_data(27) & cpu_data(28) &
		cpu_data(29) & cpu_data(30) & cpu_data(31);

		REPORT "HT: DECODE: OPCODE: " & to_hstring(cpu_opcode) & ", FUNCT3: " & to_hstring(cpu_funct3) & ", FUNCT7: " & to_hstring(cpu_funct7) & ", RS: " & to_hstring(cpu_reg_left) & ", RD: " & to_hstring(cpu_reg_right) & ", OFF: " & to_hstring(cpu_offset);
		WAIT ON cpu_clk;
	END PROCESS; -- InstructionDecodePro

END InstructionDecodeArch; -- InstructionDecodeArch