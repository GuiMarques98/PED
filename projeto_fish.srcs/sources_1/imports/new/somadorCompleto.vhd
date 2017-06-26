
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador_4bits is
    Port ( A : in STD_LOGIC_VECTOR (0 to 3);
           S : out STD_LOGIC_VECTOR (4 downto 0);
           B : in STD_LOGIC_VECTOR (0 to 3));
end somador_4bits;

architecture Behavioral of somador_4bits is

component meio_somador is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           CIN : in STD_LOGIC;
           COUT : out STD_LOGIC;
           S : OUT STD_LOGIC);
end component;

signal CIN:STD_LOGIC_VECTOR (0 TO 2);

begin -- realiza a soma de cada um dos bits do nosso numero e coloca o carry out no ultimo bit da saida
Somador1: meio_somador port map(A=>A(0) , B =>B(0), CIN =>'0', COUT =>CIN(0) , S=>S(0));
Somador2: meio_somador port map(A=>A(1) , B =>B(1), CIN =>CIN(0), COUT =>CIN(1) , S=>S(1));
Somador3: meio_somador port map(A=>A(2) , B =>B(2), CIN =>CIN(1), COUT =>CIN(2) , S=>S(2));
Somador4: meio_somador port map(A=>A(3) , B =>B(3), CIN =>CIN(2), COUT =>S(4), S=>S(3));

end Behavioral;
