----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.06.2017 17:57:00
-- Design Name: 
-- Module Name: E0_Modo - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity E0_Modo is
    Port ( MODO_MUX : in STD_LOGIC;
           MODO_CHAVE : in STD_LOGIC;
           ENTER : in STD_LOGIC;
           MODO_OUT : buffer STD_LOGIC);
end E0_Modo;

architecture Behavioral of E0_Modo is

begin
    process(MODO_MUX, MODO_CHAVE,ENTER)
    begin
        if(MODO_MUX='1') then
            if rising_edge(ENTER) then
                MODO_OUT <= MODO_CHAVE;
            end if;
        end if;
    end process;
    


end Behavioral;
