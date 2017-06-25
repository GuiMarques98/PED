library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux9x1 is
    Port ( Estado : in STD_LOGIC_VECTOR (2 downto 0); -- estao atual
           Prod,add,sub,modo,derivada : in STD_LOGIC;
           E0  : in STD_LOGIC_VECTOR (9 downto 0); -- processo modo
           E1  : in STD_LOGIC_VECTOR (9 downto 0); -- processo do grau do polinomio
           E2  : in STD_LOGIC_VECTOR (9 downto 0); -- processo dos coeficientes
           E3  : in STD_LOGIC_VECTOR (9 downto 0); -- processo do grau do segundo polinomio
           E4  : in STD_LOGIC_VECTOR (9 downto 0); -- processo dos coeficientes do segundo polinomio
           E5  : in STD_LOGIC_VECTOR (9 downto 0); -- processo do p(x)
           E6  : in STD_LOGIC_VECTOR (9 downto 0); -- processo do p'(x)
           E7  : in STD_LOGIC_VECTOR (9 downto 0); -- processo da adicao entre polinomios
           E8  : in STD_LOGIC_VECTOR (9 downto 0); -- processo da subtracao entre polinomios
           E9  : in STD_LOGIC_VECTOR (9 downto 0); -- processo da multiplicacao entre polinomios
           Disp1,Disp2,Disp3,Disp4 : out STD_LOGIC_VECTOR (6 downto 0); -- mensagens de ok,okp1,okp2,end,add,sub,Prod
           saidaBinario : out STD_LOGIC_VECTOR (9 downto 0)); -- saida para o display
end Demux9x1;

architecture Behavioral of Demux9x1 is
signal ProcessoAtual : STD_LOGIC_VECTOR (7 downto 0);
begin   
    process(estado)
    begin
        case estado is
            when "001"=> saidaBinario<= E1;
            when "010"=> saidaBinario<= E2;
            when "100"=> saidaBinario<= E3;
                Disp1<= "1111001"; -- 1 
                Disp2<= "0001100"; -- p
                Disp3<= "0001001"; -- k
                Disp4<= "1000000"; -- o
            when "101"=> saidaBinario<= E4;  
            when "011"=> 
                if derivada ='0' then
                    saidaBinario<= E5;
                else       
                    saidaBinario<= E6;
                end if;
                Disp1<= "0001001"; -- k
                Disp2<= "1000000"; -- o
                Disp3<= "1111111"; -- nada
                Disp4<= "1111111"; -- nada                  
            when "110"=>
                 Disp1<= "0100100"; -- 2 
                 Disp2<= "0001100"; -- p
                 Disp3<= "0001001"; -- k
                 Disp4<= "1000000"; -- o 
                if rising_edge(add) then
                     Disp1<= "0100001"; -- d
                     Disp2<= "0100001"; -- d
                     Disp3<= "0001000"; -- A
                     Disp4<= "1111111"; -- nada
                     saidaBinario<= E7; 
                elsif rising_edge(sub) then
                     Disp1<= "0000011"; -- b
                     Disp2<= "1100011"; -- u
                     Disp3<= "0010010"; -- S
                     Disp4<= "1111111"; -- nada
                     saidaBinario<= E8; 
                elsif rising_edge(prod) then
                     Disp1<= "0100001"; -- d
                     Disp2<= "1000000"; -- o
                     Disp3<= "0101111"; -- r
                     Disp4<= "0001100"; -- P
                     saidaBinario<= E9; 
                end if;                            
            when others => saidaBinario <= E0;
        end case;
    end process;
end Behavioral;
