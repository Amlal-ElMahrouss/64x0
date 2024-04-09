-- ( (c) Mahrouss-Logic 2024, all rights reserved. )
-- ( This file handles the decode stage. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY InstructionDecode IS
	PORT (
		cpu_clk : IN STD_LOGIC := '1';
		cpu_data : IN STD_LOGIC_VECTOR(0 TO 127) := (OTHERS => '0');
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
		cpu_reg_right <= cpu_data(95) & cpu_data(94) & cpu_data(93) & cpu_data(92) & cpu_data(91) &
			cpu_data(90) & cpu_data(89) & cpu_data(88);

		cpu_reg_left <= cpu_data(103) & cpu_data(102) & cpu_data(101) & cpu_data(100) & cpu_data(99) &
			cpu_data(98) & cpu_data(97) & cpu_data(96);

		cpu_funct7 <= cpu_data(111) & cpu_data(110) & cpu_data(109) & cpu_data(108) & cpu_data(107) &
			cpu_data(106) & cpu_data(105) & cpu_data(104);

		cpu_funct3 <= cpu_data(119) & cpu_data(118) & cpu_data(117) & cpu_data(116) & cpu_data(115) &
		cpu_data(114) & cpu_data(113) & cpu_data(112);

		cpu_opcode <= cpu_data(127) & cpu_data(126) & cpu_data(125) & cpu_data(124) & cpu_data(123) &
		cpu_data(122) & cpu_data(121) & cpu_data(120);

		REPORT "HT: DECODE: OPCODE: " & to_hstring(cpu_opcode) & ", FUNCT3: " & to_hstring(cpu_funct3) & ", FUNCT7: " & to_hstring(cpu_funct7) & ", RS: " & to_hstring(cpu_reg_left) & ", RD: " & to_hstring(cpu_reg_right) & ", OFF: " & to_hstring(cpu_offset);
		WAIT ON cpu_clk;
	END PROCESS; -- InstructionDecodePro

END InstructionDecodeArch; -- InstructionDecodeArch