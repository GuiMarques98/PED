library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Circuito_Aritimetico is
    Port ( Coef_0_1 : in STD_LOGIC_VECTOR (3 downto 0);
           Coef_1_1 : in STD_LOGIC_VECTOR (3 downto 0);
           Coef_2_1 : in STD_LOGIC_VECTOR (3 downto 0);
           Coef_3_1 : in STD_LOGIC_VECTOR (3 downto 0);
           Coef_0_2 : in STD_LOGIC_VECTOR (3 downto 0);
           Coef_1_2 : in STD_LOGIC_VECTOR (3 downto 0);
           Coef_2_2 : in STD_LOGIC_VECTOR (3 downto 0);
           Coef_3_2 : in STD_LOGIC_VECTOR (3 downto 0);
           Prod : in STD_LOGIC;
           Soma : in STD_LOGIC;
           Sub : in STD_LOGIC;
           Enter : in STD_LOGIC;
           Estado_MUX : in STD_LOGIC;
           Resposta_0 : out STD_LOGIC_VECTOR (9 downto 0);
           Resposta_1 : out STD_LOGIC_VECTOR (9 downto 0);
           Resposta_2 : out STD_LOGIC_VECTOR (9 downto 0);
           Resposta_3 : out STD_LOGIC_VECTOR (9 downto 0));
end Circuito_Aritimetico;

architecture Behavioral of Circuito_Aritimetico is

begin

    calculos: process(sub, soma)
        variable intcoef_0_1, intcoef_1_1, intcoef_2_1, intcoef_3_1 : integer range -999 to 999;
        variable intcoef_0_2, intcoef_1_2, intcoef_2_2, intcoef_3_2 : integer range -999 to 999;
        variable resp_0,resp_1,resp_2,resp_3 : integer range -999 to 999;
    begin
    if Estado_MUX = '1' then
        if rising_edge(soma) then 
            intcoef_0_1 := to_integer(signed(Coef_0_1));
            intcoef_1_1 := to_integer(signed(Coef_1_1));
            intcoef_2_1 := to_integer(signed(Coef_2_1));
            intcoef_3_1 := to_integer(signed(Coef_3_1));
            intcoef_0_2 := to_integer(signed(Coef_0_2));
            intcoef_1_2 := to_integer(signed(Coef_1_2));
            intcoef_2_2 := to_integer(signed(Coef_2_2));
            intcoef_3_2 := to_integer(signed(Coef_3_2));
            
            resp_0 := intcoef_0_1 + intcoef_0_2;
            resp_1 := intcoef_1_1 + intcoef_1_2;
            resp_2 := intcoef_2_1 + intcoef_2_2;
            resp_3 := intcoef_3_1 + intcoef_3_2;
            
            Resposta_0 <= std_logic_vector(to_signed(resp_0, 10));
            Resposta_1 <= std_logic_vector(to_signed(resp_1, 10));
            Resposta_2 <= std_logic_vector(to_signed(resp_2, 10));
            Resposta_3 <= std_logic_vector(to_signed(resp_3, 10));
            
        end if;
        if rising_edge(Sub) then
            intcoef_0_1 := to_integer(signed(Coef_0_1));
            intcoef_1_1 := to_integer(signed(Coef_1_1));
            intcoef_2_1 := to_integer(signed(Coef_2_1));
            intcoef_3_1 := to_integer(signed(Coef_3_1));
            intcoef_0_2 := to_integer(signed(Coef_0_2));
            intcoef_1_2 := to_integer(signed(Coef_1_2));
            intcoef_2_2 := to_integer(signed(Coef_2_2));
            intcoef_3_2 := to_integer(signed(Coef_3_2));
            
            resp_0 := intcoef_0_1 - intcoef_0_2;
            resp_1 := intcoef_1_1 - intcoef_1_2;
            resp_2 := intcoef_2_1 - intcoef_2_2;
            resp_3 := intcoef_3_1 - intcoef_3_2;
            
            Resposta_0 <= std_logic_vector(to_signed(resp_0, 10));
            Resposta_1 <= std_logic_vector(to_signed(resp_1, 10));
            Resposta_2 <= std_logic_vector(to_signed(resp_2, 10));
            Resposta_3 <= std_logic_vector(to_signed(resp_3, 10));
        
        end if;
    end if;
    end process;


end Behavioral;
