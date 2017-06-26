library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Complemento_2 is
    Port ( Sel : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0));
end Complemento_2;

architecture Behavioral of Complemento_2 is

begin
    process(Sel, A)
    variable sinal : STD_LOGIC := '0';
    begin
        sinal := Sel xor A(3);
        if(sinal = '1') then
            S <= (not A) + '1';
        else
            S<=A;
        end if;
    end process;

end Behavioral;
