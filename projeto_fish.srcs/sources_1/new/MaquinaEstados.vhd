library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MaquinaEstados is
    Port ( Enter : in STD_LOGIC;
           Modo :  buffer STD_LOGIC;
           saida : out STD_LOGIC_VECTOR(2 downto 0));
end MaquinaEstados;

architecture Behavioral of MaquinaEstados is
    type Estado is (E0,E1,E2,E3,E4,E5); 
    signal Atual_estado, Proximo_estado : Estado;
    signal proximo : STD_LOGIC_VECTOR(2 downto 0);
    
begin
process(enter)
    begin
    if rising_edge(enter) then
        Atual_estado <= Proximo_estado;   
    end if;
    end process;
    transaicao : process(Atual_estado) 
        begin
            if modo ='0' then
                case Atual_estado is   
                    when E0 => Proximo_estado <=E1; -- modo       
                    when E1 => Proximo_estado <=E2; -- grau
                    when E2 => Proximo_estado <=E3; -- coeficientes
                    when E3 => Proximo_estado <=E0; --  valor de p(x)
                    when OTHERS => Proximo_estado <=E0;
                    
                    
                 end case;
             else
                case Atual_estado is   
                    when E0 => Proximo_estado <=E1; -- modo      
                    when E1 => Proximo_estado <=E2; -- grau primeiro 
                    when E2 => Proximo_estado <=E3; -- coeficientes
                    when E3 => Proximo_estado <=E4; -- grau segundo
                    when E4 => Proximo_estado <=E5; -- coeficientes do segundo
                    when E5 => Proximo_estado <=E0; -- operação polinomio
                    when others => Proximo_estado <=E0;
                end case;
             end if;
        end process;
    saida_maquina : process(Atual_estado)
        begin
            if modo ='0' then
            case Atual_estado is   
                when E0 => proximo <="000"; -- modo
                when E1 => proximo <="001"; -- grau
                when E2 => proximo <="010"; -- coeficiente
                when E3 => proximo <="011"; -- valor de p(x)
                when others=>proximo <="000";
            end case;
            else
            case Atual_estado is   
                when E0 => proximo <="000"; -- modo 
                when E1 => proximo <="001"; -- grau
                when E2 => proximo <="011"; -- coeficiente
                when E3 => proximo <="100"; -- grau 2
                when E4 => proximo <="101"; -- coeficiente 2
                when E5 => proximo <="110"; -- operação polinomial
                when others => proximo <="000";
            end case;               
            end if;
        end process;  
        saida <= proximo;
end Behavioral;
