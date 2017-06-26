library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

entity soma_polinomio is
    Port (Coef0 ,Coef1, Coef2, Coef3, ValorX : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
          Resultado : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)          
    );
end soma_polinomio ;


architecture Behavioral of soma_polinomio is

begin

end Behavioral;