
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity meio_somador is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           CIN : in STD_LOGIC;
           COUT : out STD_LOGIC;
           S : OUT STD_LOGIC);
end meio_somador;

architecture Behavioral of meio_somador is

begin
    S <= CIN XOR A XOR B; -- realiza a soma ja com carry in
    COUT <= (A AND B) OR (CIN AND B) OR (CIN AND A); -- calcula  o carry out
end Behavioral;
