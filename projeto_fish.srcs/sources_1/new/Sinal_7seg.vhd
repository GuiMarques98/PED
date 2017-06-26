----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.06.2017 23:29:08
-- Design Name: 
-- Module Name: Sinal_7seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sinal_7seg is
    Port (Input : IN STD_LOGIC;
          Output : OUT STD_LOGIC_VECTOR(0 TO 6)
          );
end Sinal_7seg;

architecture Behavioral of Sinal_7seg is

begin
    process(Input)
    begin
        if Input = '1' then
            Output <= "1111110";
        else
            Output <= "1111111";
        end if;
    end process;
end Behavioral;
