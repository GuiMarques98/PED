library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
    Port (  Enter : in STD_LOGIC;
            Enter_Coef : in STD_LOGIC;
            memoria : in STD_LOGIC;
            modo : buffer STD_LOGIC;
            devivada: in STD_LOGIC;
            operacao : in STD_LOGIC_VECTOR(1 downto 0);
            chave : in STD_LOGIC_VECTOR (3 downto 0));
end Main;

architecture Behavioral of Main is
--------------- Componentes ----------------
component MaquinaEstados is
    Port ( Enter : in STD_LOGIC;
           Modo :  buffer STD_LOGIC;
           saida : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component MUX3x7 is
    Port ( ProcessoSaida : out STD_LOGIC_VECTOR(6 downto 0);
           Processo :  in STD_LOGIC_VECTOR(2 downto 0));
end component;

component E0_Modo is
    Port ( MODO_MUX : in STD_LOGIC;
           MODO_CHAVE : in STD_LOGIC;
           ENTER : in STD_LOGIC;
           MODO_OUT : buffer STD_LOGIC);
end component;

component Pol_Grau is
    Port ( Grau_MUX : in STD_LOGIC;
           Grau_Chave : in STD_LOGIC_VECTOR (1 downto 0);
           Grau_out : out STD_LOGIC_VECTOR (1 downto 0);
           Enter : in STD_LOGIC);
end component;

component Coeficiente is
    Port ( Coef_MUX : in STD_LOGIC;
           Chaves : in STD_LOGIC_VECTOR (3 downto 0);
           Enter : in STD_LOGIC;
           Grau : in STD_LOGIC_VECTOR (1 downto 0);
           Coef_out_0 : out STD_LOGIC_VECTOR (3 downto 0) :="0000";
           Coef_out_1 : out STD_LOGIC_VECTOR (3 downto 0):="0000";
           Coef_out_2 : out STD_LOGIC_VECTOR (3 downto 0):="0000";
           Coef_out_3 : out STD_LOGIC_VECTOR (3 downto 0):="0000";
           Acabou : out STD_LOGIC);
end component;

----------------- Signal ------------------------
signal saidaEstado : STD_LOGIC_VECTOR(2 downto 0);
signal saidaMUX : STD_LOGIC_VECTOR(6 downto 0);
signal grauPol_1, grauPol_2: STD_LOGIC_VECTOR (1 downto 0);
signal Coef_1_0, Coef_1_1,Coef_1_2,Coef_1_3: STD_LOGIC_VECTOR (3 downto 0) :="0000";
signal Coef_2_0, Coef_2_1,Coef_2_2,Coef_2_3: STD_LOGIC_VECTOR (3 downto 0) :="0000";
signal Corf_end_1,Corf_end_2 : STD_LOGIC;

begin
G0: MaquinaEstados port map (Enter=>enter,modo=>modo,saida=>saidaEstado);
G1: MUX3x7 port map (ProcessoSaida=>saidaMUX,Processo=>saidaEstado);
G2: E0_Modo port map (MODO_MUX => saidaMUX(0), ENTER => Enter, MODO_CHAVE => Chave(0), MODO_OUT => Modo);
G3: Pol_Grau port map (Grau_MUX => saidaMUX(1), Grau_Chave(0) => chave(0), Grau_Chave(1) => chave(1), Grau_out=>grauPol_1, Enter=>Enter);
G4: Pol_Grau port map (Grau_MUX => saidaMUX(2), Grau_Chave(0) => chave(0), Grau_Chave(1) => chave(1), Grau_out=>grauPol_2, Enter=>Enter);
G5: Coeficiente port map (Coef_MUX => saidaMUX(2), Chaves => chave, Enter => Enter_Coef, Grau => grauPol_1,Coef_out_0=>Coef_1_0 ,Coef_out_1=>Coef_1_1 ,Coef_out_2=>Coef_1_2, Coef_out_3=>Coef_1_3, Acabou=>Corf_end_1);
G6: Coeficiente port map (Coef_MUX => saidaMUX(5), Chaves => chave, Enter => Enter_Coef, Grau => grauPol_2,Coef_out_0=>Coef_2_0 ,Coef_out_1=>Coef_2_1 ,Coef_out_2=>Coef_2_2, Coef_out_3=>Coef_2_3, Acabou=>Corf_end_2); 
end Behavioral;
