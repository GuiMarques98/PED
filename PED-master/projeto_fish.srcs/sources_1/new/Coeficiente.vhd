library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Coeficiente is
    Port ( Coef_MUX : in STD_LOGIC;
           Chaves : in STD_LOGIC_VECTOR (3 downto 0);
           Enter : in STD_LOGIC;
           Grau : in STD_LOGIC_VECTOR (1 downto 0);
           Coef_out_0 : out STD_LOGIC_VECTOR (3 downto 0) :="0000";
           Coef_out_1 : out STD_LOGIC_VECTOR (3 downto 0):="0000";
           Coef_out_2 : out STD_LOGIC_VECTOR (3 downto 0):="0000";
           Coef_out_3 : out STD_LOGIC_VECTOR (3 downto 0):="0000";
           Acabou : out STD_LOGIC);
end Coeficiente;

architecture Behavioral of Coeficiente is

signal estado : STD_LOGIC_VECTOR (4 downto 0);

component MaquinaEstados_Coef is
   Port ( Mux_entrada : in STD_LOGIC;
           Enter : in STD_LOGIC;
           Grau : in STD_LOGIC_VECTOR (1 downto 0);
           Estado : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component coef_est is
    Port ( Coef_EST : in STD_LOGIC;
           Coef_Chave : in STD_LOGIC_VECTOR (3 downto 0);
           Coef_out : out STD_LOGIC_VECTOR (3 downto 0);
           Enter : in STD_LOGIC);
end component;

begin
C0: MaquinaEstados_Coef port map (Enter => Enter, Grau => Grau, Estado => estado,Mux_entrada=>Coef_MUX);
C1: coef_est port map (Coef_EST => estado(0), Coef_Chave => Chaves, Coef_out=>Coef_out_0, Enter =>Enter);
C2: coef_est port map (Coef_EST => estado(1), Coef_Chave => Chaves, Coef_out=>Coef_out_1, Enter =>Enter);
C3: coef_est port map (Coef_EST => estado(2), Coef_Chave => Chaves, Coef_out=>Coef_out_2, Enter =>Enter);
C4: coef_est port map (Coef_EST => estado(3), Coef_Chave => Chaves, Coef_out=>Coef_out_3, Enter =>Enter);
Acabou <= estado(4);

end Behavioral;
