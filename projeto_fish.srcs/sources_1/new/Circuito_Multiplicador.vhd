library IEEE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Circuito_Multiplicador is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (8 downto 0));
end Circuito_Multiplicador;

architecture Behavioral of Circuito_Multiplicador is
signal mult_1: STD_LOGIC_VECTOR (8 downto 0);
begin


end Behavioral;
