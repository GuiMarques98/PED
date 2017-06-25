library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity E0_Modo is
    Port ( MODO_MUX : in STD_LOGIC;
           MODO_CHAVE : in STD_LOGIC;
           ENTER : in STD_LOGIC;
           MODO_OUT : buffer STD_LOGIC);
end E0_Modo;

architecture Behavioral of E0_Modo is

begin
    process(MODO_MUX, MODO_CHAVE,ENTER)
    begin
        if(MODO_MUX='1') then
            if rising_edge(ENTER) then
                MODO_OUT <= MODO_CHAVE;
            end if;
        end if;
    end process;    
end Behavioral;
