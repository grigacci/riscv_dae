-- Universidade Federal de Minas Gerais
-- Escola de Engenharia
-- Departamento de Engenharia Eletronica
-- Autoria: Professor Ricardo de Oliveira Duarte
-- Memória de Programas ou Memória de Instruções de tamanho genérico
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memi is
	generic (
		INSTR_WIDTH   : natural := 32; -- tamanho da instrucaoo em numero de bits
		MI_ADDR_WIDTH : natural := 32 -- tamanho do endereco da memoria de instrucoes em numero de bits
	);
	port (
		clk       : in std_logic;
		reset     : in std_logic;
		Endereco  : in std_logic_vector(MI_ADDR_WIDTH - 1 downto 0);
		Instrucao : out std_logic_vector(INSTR_WIDTH - 1 downto 0)
	);
end entity;

architecture comportamental of memi is
	type rom_type is array (0 to 2 ** 11 - 1) of std_logic_vector(INSTR_WIDTH - 1 downto 0);
	--signal aux : std_logic_vector(32 downto 0);
	constant codigo : rom_type := (
		0 =>     "00000000110100000000010110010011",
		1 =>     "00000000000000000000011000010011",
		2 =>     "00000000000000000000100100010011",
		3 =>     "00000000000100000000010010010011",
		4 =>     "00000001000100000000011010010011",
		5 =>     "00000000000000000000100110010011",
		6 =>     "00000000000110010000100100010011",
		7 =>     "00000000100101100010000000100011",
		8 =>     "00000000000000000000000000010011",
		9 =>     "00000000000000000000000000010011",
		10 =>     "00000001001001011000110001100011",
		11 =>     "00000000000000000000000000010011",
		12 =>     "00000001000001100000011000010011",
		13 =>     "00000000000000000000000000010011",
		14 =>     "00000000000000000000000000010011",
		15 =>     "11111100000000000000111011100011",
		16 =>     "00000000000000000000001010010011",
		17 =>     "00000000000100000000100100010011",
		18 =>     "00000000000000000000011000010011",
		19 =>     "00000000000000000000000000010011",
		20 =>     "00000000000000000000000000010011",
		21 =>     "00000000000000000000000000010011",
		22 =>     "00000001001000000000001010110011",
		23 =>     "00000000000000000000000000010011",
		24 =>     "00000000000000000000000000010011",
		25 =>     "00000000000000000000000000010011",
		26 =>     "00000101001100101000101001100011",
		27 =>     "00000000000000000000000000010011",
		28 =>     "00000000000001100010001100000011",
		29 =>     "00000000000000000000000000010011",
		30 =>     "00000000000000000000000000010011",
		31 =>     "00000000000101100000011000010011",
		32 =>     "00000000000000000000000000010011",
		33 =>     "00000000000000000000000000010011",
		34 =>     "00000000000000000000000000010011",
		35 =>     "00000000000001100010001110000011",
		36 =>     "00000000000000000000000000010011",
		37 =>     "00000000000000000000000000010011",
		38 =>     "00000000011100110000111000110011",
		39 =>     "00000000000000000000000000010011",
		40 =>     "00000000000000000000000000010011",
		41 =>     "00000000000000000000000000010011",
		42 =>     "00000001110001101010000000100011",
		43 =>     "00000000000000000000000000010011",
		44 =>     "00000000000110011000100110010011",
		45 =>     "00000000000101101000011010010011",
		46 =>     "11111010000000000000000011100011",
		47 =>     "00000000000110010000100100010011",
		48 =>     "00000000000000000000000000010011",
		49 =>     "00000000000000000000000000010011",
		50 =>     "00000000000000000000000000010011",
		51 =>     "00000010101110010000010001100011",
		52 =>     "00000000000000000000000000010011",
		53 =>     "01000000010101100000011000110011",
		54 =>     "01000000010101101000011010110011",
		55 =>     "00000000000000000000000000010011",
		56 =>     "00000000000000000000000000010011",
		57 =>     "00000001000001100000011000010011",
		58 =>     "00000001000001101000011010010011",
		59 =>     "00000000000000000000100110010011",
		60 =>     "11110110000000000000010011100011",
		others =>     X"00000013");

	signal index : std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
        begin
					index(29 downto 0)<= Endereco(31 downto 2);
					instrucao <= codigo(to_integer(unsigned(index))) when Endereco < x"10000000" else x"00000000";

end comportamental;