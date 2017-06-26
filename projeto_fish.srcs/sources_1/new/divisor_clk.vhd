library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divisor_clk is
    Port (Clk_in : in std_logic;
          Clk_out : out std_logic
     );
end divisor_clk;

architecture Behavioral of divisor_clk is

signal contador : STD_LOGIC_VECTOR(0 TO 18) := "0000000000000000000";

begin
    begin
        if rising_edge (clk_in) then
            contador <= contador + 1;
            if(contador = "1111111111111111111") then
                contador <= "0000000000000000000";
            end if;
        end if;
     end process;
     clk_out <= contador(18);
end Behavioral;
