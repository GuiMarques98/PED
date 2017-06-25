library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MaquinaEstados_Coef is
    Port ( Enter : in STD_LOGIC;
           Grau : in STD_LOGIC_VECTOR (1 downto 0);
           Estado : out STD_LOGIC_VECTOR (4 downto 0));
end MaquinaEstados_Coef;


architecture Behavioral of MaquinaEstados_Coef is
    type Estado_coef is (E0,E1,E2,E3, E4);
    signal Atual_estado, Proximo_estado : Estado_coef;
    
    signal proximo : STD_LOGIC_VECTOR (4 downto 0);
begin
    process(Enter)
    begin
        if rising_edge(enter) then
            Atual_estado <= Proximo_estado;
        end if;
    end process;
    
    transicao : process(Atual_estado )
    begin
    if (Grau = "00") then
        case Atual_estado is
            when E0 => Proximo_estado <=E4;
            when E4 => Proximo_estado <= E0;
            when others => Proximo_estado <= E0;
        end case;
    elsif (Grau = "01") then
        case Atual_estado is
            when E0 => Proximo_estado <=E1;       
            when E1 => Proximo_estado <=E4; 
            when E4 => Proximo_estado <= E0;
            when others => Proximo_estado <= E0;
        end case;
    elsif (Grau = "10") then
        case Atual_estado is
            when E0 => Proximo_estado <=E1;       
            when E1 => Proximo_estado <=E2; 
            when E2 => Proximo_estado <=E4; 
            when E4 => Proximo_estado <= E0;            
            when others => Proximo_estado <= E0;
        end case;
    else
        case Atual_estado is
            when E0 => Proximo_estado <=E1;       
            when E1 => Proximo_estado <=E2; 
            when E2 => Proximo_estado <=E3; 
            when E3 => Proximo_estado <=E4;
            when E4 => Proximo_estado <= E0;
            when others => Proximo_estado <= E0;
        end case;
    end if;
    end process;
    
    saida_maquina : process(Atual_estado)
    begin
    case Atual_estado is
        when E0 => proximo <="00001";       
        when E1 => proximo <="00010"; 
        when E2 => proximo <="00100"; 
        when E3 => proximo <="01000";
        when E4 => proximo <="10000";
        when others => proximo <= "00001";
    end case;

    end process;
    Estado <= proximo;
end Behavioral;
