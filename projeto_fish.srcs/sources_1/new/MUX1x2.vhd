library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX1x2 is
  Port ( Prod,add,sub : in STD_LOGIC;
         Disp1_out,Disp2_out,Disp3_out,Disp4_out : out STD_LOGIC_VECTOR (6 downto 0);
         Disp1,Disp2,Disp3,Disp4 : in STD_LOGIC_VECTOR (6 downto 0));
end MUX1x2;

architecture Behavioral of MUX1x2 is

begin
process
begin
    if rising_edge(add) or rising_edge(sub) or rising_edge(Prod) then
            Disp1_out<=Disp1;
            Disp2_out<=Disp2;
            Disp3_out<=Disp2;
            Disp4_out<=Disp2;
        wait for 2000 ms; -- 2 segundos
            Disp1_out <= "0100001"; --d
            Disp2_out <= "0101011"; --n
            Disp3_out <= "0000110"; --E
            Disp4_out <= "1111111"; --nada
        wait;
    end if;
end process;


end Behavioral;
