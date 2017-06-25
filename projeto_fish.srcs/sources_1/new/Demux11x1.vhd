library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux11x1 is
    Port ( Estado : in STD_LOGIC_VECTOR (2 downto 0); -- estao atual
           E0  : in STD_LOGIC_VECTOR (9 downto 0); -- processo modo
           E1  : in STD_LOGIC_VECTOR (9 downto 0); -- processo do grau do polinomio
           E2  : in STD_LOGIC_VECTOR (9 downto 0); -- processo dos coeficientes
           E3  : in STD_LOGIC_VECTOR (9 downto 0); -- processo do p(x)
           E4  : in STD_LOGIC_VECTOR (9 downto 0); -- processo do p'(x)
           E5  : in STD_LOGIC_VECTOR (9 downto 0); -- processo da adicao entre polinomios
           E6  : in STD_LOGIC_VECTOR (9 downto 0); -- processo da subtração entre polinomios
           E7  : in STD_LOGIC_VECTOR (9 downto 0); -- processo da multicação entre polinomios
           derivada : in STD_LOGIC; -- chave que ativa a saida derivada
           operacao : in STD_LOGIC_VECTOR (1 downto 0); -- chave que ativa as operações polinomiais
           saidaBinario : out STD_LOGIC_VECTOR (9 downto 0)); -- saida para o display
end Demux11x1;

architecture Behavioral of Demux11x1 is
signal ProcessoAtual : STD_LOGIC_VECTOR (7 downto 0);
begin   
    process(estado,derivada,operacao)
    begin
        case estado is
            when "001"=> saidaBinario<= E1;
            when "010"=> saidaBinario<= E2;
            when "011"=> 
                if derivada ='1' then    
                    saidaBinario<= E4;
                else
                    saidaBinario<= E3;
                end if;
            when "100"=>
               case operacao is
                    when "01"=> saidaBinario<= E6; -- subtração
                    when "10"=> saidaBinario<= E7; -- multiplicação
                    when others => saidaBinario <= E5; -- adicao
               end case;
            when others => saidaBinario <= E0;
        end case;
    end process;
end Behavioral;
