library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity coef_est is
    Port ( Coef_EST : in STD_LOGIC;
           Coef_Chave : in STD_LOGIC_VECTOR (3 downto 0);
           Coef_out : out STD_LOGIC_VECTOR (3 downto 0);
           Enter : in STD_LOGIC);
end coef_est;

architecture Behavioral of coef_est is

begin

    process(Enter, Coef_EST, Coef_Chave)
    begin
        if(Coef_EST = '1') then
            if rising_edge(Enter) then
                Coef_out <= Coef_Chave;
            end if;
        end if;
    end process;

end Behavioral;
