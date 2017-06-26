library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divisor_clk2 is
    Port (Clk_in : in std_logic;
          Clk_out : out std_logic
     );
end divisor_clk2;

architecture Behavioral of divisor_clk2 is

signal contador : STD_LOGIC_VECTOR(0 TO 17) := "000000000000000000";

begin
    process(Clk_in)
    begin
        if rising_edge (clk_in) then
            contador <= contador + 1;
            if(contador = "111111111111111111") then
                contador <= "000000000000000000";
            end if;
        end if;
     end process;
     clk_out <= contador(17);
end Behavioral;