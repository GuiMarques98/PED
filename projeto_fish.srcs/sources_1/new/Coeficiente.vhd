library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Coeficiente is
    Port ( Coef_MUX : in STD_LOGIC;
           Chaves : in STD_LOGIC_VECTOR (3 downto 0);
           Enter : in STD_LOGIC;
           Grau : in STD_LOGIC_VECTOR (1 downto 0);
           Coef_out_0 : out STD_LOGIC_VECTOR (3 downto 0);
           Coef_out_1 : out STD_LOGIC_VECTOR (3 downto 0);
           Coef_out_2 : out STD_LOGIC_VECTOR (3 downto 0);
           Coef_out_3 : out STD_LOGIC_VECTOR (3 downto 0));
end Coeficiente;

architecture Behavioral of Coeficiente is

signal estado : STD_LOGIC_VECTOR (3 downto 0);

component MaquinaEstados_Coef is
    Port ( Enter : in STD_LOGIC;
           Estado : out STD_LOGIC_VECTOR (3 downto 0));
end component;

begin
C0: MaquinaEstados_Coef port map (Enter => Enter, Estado => estado);

end Behavioral;
