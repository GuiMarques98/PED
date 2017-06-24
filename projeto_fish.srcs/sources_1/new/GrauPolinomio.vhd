library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GrauPolinomio is
  Port ( entradaMux :in STD_LOGIC;
         enter :in STD_LOGIC;
         SaidaDemux : out STD_LOGIC_VECTOR(4 downto 0));
end GrauPolinomio;

architecture Behavioral of GrauPolinomio is

begin
    process(entradaMux,enter)
    begin
        if entradaMux ='1' then
            if rising_edge(enter) then
                
            end if;
        end if;
    end process;

end Behavioral;
