library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MaquinaEstados_Coef is
    Port ( Enter : in STD_LOGIC;
           Estado : out STD_LOGIC_VECTOR (3 downto 0));
end MaquinaEstados_Coef;


architecture Behavioral of MaquinaEstados_Coef is
    type Estado_coef is (E0,E1,E2,E3);
    signal Atual_estado, Proximo_estado : Estado_coef;
    
    signal proximo : STD_LOGIC_VECTOR (3 downto 0);
begin
    process(Enter)
    begin
        if rising_edge(enter) then
            Atual_estado <= Proximo_estado;
        end if;
    end process;
    
    transicao : process(Atual_estado )
    begin
        case Atual_estado is
            when E0 => Proximo_estado <=E1;       
            when E1 => Proximo_estado <=E2; 
            when E2 => Proximo_estado <=E3; 
            when E3 => Proximo_estado <=E0;
            when others => Proximo_estado <= E0;
        end case;
    end process;
    
    saida_maquina : process(Atual_estado)
    begin
        case Atual_estado is
        when E0 => proximo <="0001";       
        when E1 => proximo <="0010"; 
        when E2 => proximo <="0100"; 
        when E3 => proximo <="1000";
        when others => proximo <= "0000";
    end case;        
    end process;
    
    Estado <= proximo;
end Behavioral;
