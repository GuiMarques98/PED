library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ValorPolinomio is
      Port(enter : in STD_LOGIC;
           grau1 : in STD_LOGIC_VECTOR (3 downto 0);--grau do polinomio 1
           ok: out std_logic; -- okp1 do display
           switch1: in STD_LOGIC_VECTOR (3 downto 0);
           switch2: in STD_LOGIC_VECTOR (7 downto 4);
           switch3: in STD_LOGIC_VECTOR (11 downto 8);
           switch4: in STD_LOGIC_VECTOR (15 downto 12); -- valor para cada um dos coeficientes sendo o valor maximo 
           clk: in std_logic);
end ValorPolinomio;

architecture Behavioral of ValorPolinomio is
signal coef1,coef2,coef3,coef4: std_logic_vector(3 downto 0); -- coeficientes do polilnomio 1
signal num1,num2,num3,num4: std_logic_vector (3 downto 0); -- coeficientes do polinomio 2

begin
 process(grau1) -- preenche os coeficientes do polinomio 1
   begin   
   case (grau1) is
       when "0100" =>
           if enter = '1' then
           coef4 <= switch4;
           coef3 <= switch3;
           coef2 <= switch2;
           coef1 <= switch1;
           end if;
       when "0011" =>
           if enter = '1' then
           coef4 <= "0000";
           coef3 <= switch3;
           coef2 <= switch2;
           coef1 <= switch1;
           end if;    
       when "0010" =>
           if enter = '1' then
           coef4 <= "0000";
           coef3 <=  "0000";
           coef2 <= switch2;
           coef1 <= switch1;
           end if;
       
       when "0001" =>
           if enter = '1' then
           coef4 <= "0000";
           coef3 <= "0000";
           coef2 <= "0000";
           coef1 <= switch1;
           end if;
    
       when others => 
            if enter ='1' then
            coef4 <= "XXXX";
            coef3 <= "XXXX";
            coef2 <= "XXXX";
            coef1 <= "XXXX";
            end if;
       end case;
   ok <= '1';
   end process;
end Behavioral;
