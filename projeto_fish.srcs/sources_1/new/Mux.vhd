

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port (Input : in STD_LOGIC_VECTOR(12 DOWNTO 0);
          clk_in : in STD_LOGIC_VECTOR(1 DOWNTO 0);
          Output, An : out STD_LOGIC_VECTOR(3 DOWNTO 0);
          Sinal : out STD_LOGIC
     );
end Mux;

architecture Behavioral of Mux is

begin
    An(3) <= Clk_in(1) and Clk_in(0);
    An(2) <= Clk_in(1) and  not Clk_in(0);
    An(1) <= not Clk_in(1) and Clk_in(0);
    An(0) <= not Clk_in(1) and not Clk_in(0);
    
    process(Input)
        begin
            case clk_in is
                when "00" => Output <= Input(3 downto 0);
                when "01" => Output <= Input(7 downto 4);
                when "10" => Output <= Input(11 downto 8);
                when "11" => Sinal <= Input(12);
            end case;
    end process;
                
        
end Behavioral;
