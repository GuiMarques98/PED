library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity valorPolinomial is
    Port ( Grau_poli_1 : in STD_LOGIC_VECTOR (1 downto 0);
           Coef1_poli_1 : in STD_LOGIC_VECTOR (4 downto 0);
           Coef2_poli_1 : in STD_LOGIC_VECTOR (4 downto 0);
           Coef3_poli_1 : in STD_LOGIC_VECTOR (4 downto 0);
           Coef4_poli_1 : in STD_LOGIC_VECTOR (4 downto 0);  
           Grau_poli_2 : in STD_LOGIC_VECTOR (1 downto 0);
           Coef1_poli_2 : in STD_LOGIC_VECTOR (4 downto 0); 
           Coef2_poli_2 : in STD_LOGIC_VECTOR (4 downto 0);
           Coef3_poli_2 : in STD_LOGIC_VECTOR (4 downto 0);
           Coef4_poli_2 : in STD_LOGIC_VECTOR (4 downto 0); 
           Resultado_adi : out STD_LOGIC_VECTOR (9 downto 0);
           Resultado_sub : out STD_LOGIC_VECTOR (9 downto 0);
           Resultado_mul : out STD_LOGIC_VECTOR (9 downto 0);
           Entrada_Mux : in STD_LOGIC;
           Enter : in STD_LOGIC);
end valorPolinomial;

architecture Behavioral of valorPolinomial is

begin


end Behavioral;
