library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Pol_Grau is
    Port ( Grau_MUX : in STD_LOGIC;
           Grau_Chave : in STD_LOGIC_VECTOR (1 downto 0);
           Grau_out : out STD_LOGIC_VECTOR (1 downto 0);
           Enter : in STD_LOGIC);
end Pol_Grau;

architecture Behavioral of Pol_Grau is

begin
    process(Grau_MUX, Enter, Grau_Chave)
    begin
        if(Grau_MUX = '1') then
            if rising_edge(Enter) then
                Grau_out <= Grau_Chave;
            end if;
        end if;
    end process;
end Behavioral;
