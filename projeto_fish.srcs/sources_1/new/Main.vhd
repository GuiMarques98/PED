library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
    Port (  Enter : in STD_LOGIC;
            memoria : in STD_LOGIC;
            modo : buffer STD_LOGIC;
            devivada: in STD_LOGIC;
            operacao : in STD_LOGIC_VECTOR(1 downto 0);
            chave : in STD_LOGIC_VECTOR (4 downto 0));
end Main;

architecture Behavioral of Main is
--------------- Componentes ----------------
component MaquinaEstados is
    Port ( Enter : in STD_LOGIC;
           Modo :  in STD_LOGIC;
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

----------------- Signal ------------------------
signal saidaEstado : STD_LOGIC_VECTOR(2 downto 0);
signal saidaMUX : STD_LOGIC_VECTOR(6 downto 0);

begin
    G0: MaquinaEstados port map (Enter=>enter,modo=>modo,saida=>saidaEstado);
    G1 : MUX3x7 port map (ProcessoSaida=>saidaEstado,Processo=>saidaMUX);
    G2 : E0_Modo port map (MODO_MUX => saidaMUX(0), ENTER => Enter, MODO_CHAVE => Chave(0), MODO_OUT => Modo);
end Behavioral;
