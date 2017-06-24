library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX3x7 is
    Port ( ProcessoSaida : out STD_LOGIC_VECTOR(6 downto 0);
           Processo :  in STD_LOGIC_VECTOR(2 downto 0));
end MUX3x7;

architecture Behavioral of MUX3x7 is

begin

process (processo)
begin
    case processo is
        when "000" => ProcessoSaida <="0000001"; -- Para escolha do modo
        when "001" => ProcessoSaida <="0000010"; -- Para o processo de coleta do grau do polinomio 
        when "010" => ProcessoSaida <="0000100"; -- Para o processo de coleta dos coeficientes do polinomio
        when "011" => ProcessoSaida <="0001000"; -- Para o processo de calculo do valor do polinomio 
        when "100" => ProcessoSaida <="0010000"; -- Para o processo de coleta do grau do segundo polinomio 
        when "101" => ProcessoSaida <="0100000"; -- Para o processo de coleta dos coeficientes do segundo polinomio
        when "110" => ProcessoSaida <="1000000"; -- Para o processo de calculo da operacao entre polinomios
    end case;
end process;
end Behavioral;
