library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity polinomios is
    Port ( grau1 : in STD_LOGIC_VECTOR (3 downto 0);--grau do polinomio 1
           grau2 : in std_logic_vector (3 downto 0);--grau do polinomio 2
           enter : in STD_LOGIC;
           okp1: out std_logic; -- okp1 do display
           okp2: out std_logic;-- okp2 do display
           prod: in std_logic; -- seleciona o produto
           prod_disp: out std_logic; -- indicar produto no display
           add:  in std_logic;-- seleciona a soma
           add_disp: out std_logic;
           sub : in std_logic; -- seleciona a subtraçao
           sub_disp: out std_logic;
           switch1: in STD_LOGIC_VECTOR ( 3 downto 0);
           switch2: in STD_LOGIC_VECTOR ( 7 downto 4);
           switch3: in STD_LOGIC_VECTOR ( 11 downto 8);
           switch4: in STD_LOGIC_VECTOR ( 15 downto 12); -- preenchem cada um dos coeficientes
           clk: in std_logic);
           
end polinomios;

architecture Behavioral of polinomios is

signal coef1,coef2,coef3,coef4: std_logic_vector(3 downto 0); -- coeficientes do polilnomio 1
signal num1,num2,num3,num4: std_logic_vector (3 downto 0); -- coeficientes do polinomio 2
signal soma1,soma2,soma3,soma4  : std_logic_vector (4 downto 0);-- soma, subtração, e multiplicação de coeficiente por coeficiente
signal prod1,prod2,prod3,prod4  : std_logic_vector (7 downto 0);
signal sub1,sub2,sub3,sub4:   std_logic_vector (3 downto 0);

begin
    
    process(grau1) -- preenche os coeficientes do polinomio 1
    begin   
    case grau1 is
        when "100" =>
            if enter = '1' then
            coef4 <= switch4;
            coef3 <= switch3;
            coef2 <= switch2;
            coef1 <= switch1;
            end if;
        when "011" =>
            if enter = '1' then
            coef4 <= "0000";
            coef3 <= switch3;
            coef2 <= switch2;
            coef1 <= switch1;
            end if;    
        when "010" =>
            if enter = '1' then
            coef4 <= "0000";
            coef3 <=  "0000";
            coef2 <= switch2;
            coef1 <= switch1;
            end if;
        
        when "001" =>
            if enter = '1' then
            coef4 <= "0000";
            coef3 <= "0000";
            coef2 <= "0000";
            coef1 <= switch1;
            end if;
        end case;
    okp1 <= '1';
    end process;
    
    process(grau2) -- preenche os coeficientes do polinomio 2
    begin
    case grau2 is
        when "100" =>
            if enter = '1' then
            num4 <= switch4;
            num3 <= switch3;
            num2 <= switch2;
            num1 <= switch1;
            end if;
    
        when "011" =>
            if enter = '1' then
            num1 <= "0000";
            num3 <= switch3;
            num2 <= switch2;
            num1 <= switch1;
            end if;
    
        when "010" =>
            if enter = '1' then
            num4 <= "0000";
            num3 <=  "0000";
            num2 <= switch2;
            num1 <= switch1;
            end if;
    
        when "001" =>
            if enter = '1' then
            num4 <= "0000";
            num3 <=  "0000";
            num2 <= "0000";
            num1 <= switch1;
            end if;
        end case;
    okp2<= '1';
    end process;

process(add)
begin
    if add = '1' then
    soma4<= (coef4 + num4);
    soma3<= (coef3 + num3);
    soma2<= (coef2 + num2);
    soma1<= (coef1 + num1);
    add_disp <= '1';
    end if;
end process;

process(prod)
begin
    if prod = '1' then
    prod4<= (coef4*num4);
    prod3<= (coef3*num3);
    prod2<= (coef2*num2);
    prod1<= (coef1*num1);
    end if;
    prod_disp <= '1';
end process;

process(sub)
    begin
    if sub = '1' then
    sub4<= (coef4 - num4);
    sub3<= (coef3 - num3);
    sub2<= (coef2 - num2);
    sub1<= (coef1 - num1);
    sub_disp <= '1';
    end if;
end process;

end Behavioral;
