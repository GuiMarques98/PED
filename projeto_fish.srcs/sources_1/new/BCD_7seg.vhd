library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_7seg is
  Port (Input : in STD_LOGIC_VECTOR(0 TO 3);
        Output : out STD_lOGIC_VECTOR(0 TO 6)
        );
end BCD_7seg;

architecture Behavioral of BCD_7seg is

begin
    with Input select
        Output <=    "1111101" when "0001",
                     "0100100" when "0010",
                     "0110000" when "0011",
                     "0011001" when "0100",
                     "0010010" when "0101",
                     "0000010" when "0110",
                     "1111000" when "0111",
                     "0000000" when "1000",
                     "0010000" when "1001",
                     "XXXXXXX" when others;
end Behavioral;