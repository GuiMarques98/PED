library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BinBCD is
  Port ( binario : in STD_LOGIC_VECTOR(10 downto 0);
         output : out STD_LOGIC_VECTOR(12 downto 0)
  );
end BinBCD;

architecture Behavioral of BinBCD is

begin
    bcd : process(binario)
        variable temp  : STD_LOGIC_VECTOR (21 downto 0);
        begin
            temp (21 downto 0) := (others => '0');
            temp (12 downto 3) := binario(9 downto 0); -- A variável binario é deslocada três casas para a esquerda utilizando a variável temporária
            -- O algoritmo funciona entre 999 e -999, pois caso exceda esses valores seriam necessários mais 4 bits para a saída
            -- O loop é executado 7 vezes pois ainda faltam 7 bits para deslocar da variável original binario
            for i in 0 to 6 loop
            
                if temp (13 downto 10) > 4 then
                    temp (13 downto 10) := temp(13 downto 10) + 3; -- 12 downto 9 corresponde as unidades
                end if;
                
                if temp (17 downto 14) > 4 then
                    temp(17 downto 14) := temp (17 downto 14) + 3; -- 16 downto 13 corresponde as dezenas
                end if;
                -- 20 donwto 17 corresponde as centenas
                temp(21 downto 1) := temp(20 downto 0); -- Faz a variável temp deslocar uma casa para esquerda
            end loop;
            
            output (11 downto 0) <= temp(21 downto 10); -- Os digitos bcd são passados
            
            if binario(10) = '1' then
                output(12) <= '1';
            else 
                output(12) <= '0';
            end if;
    end process;
end Behavioral;

