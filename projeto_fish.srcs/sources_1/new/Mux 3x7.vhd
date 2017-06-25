----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.06.2017 14:52:36
-- Design Name: 
-- Module Name: Mux 3x7 - Behavioral
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

entity Mux 3x7 is
    Port ( MaquinaEstado : in STD_LOGIC_VECTOR (2 downto 0);
           P : out STD_LOGIC_VECTOR (6 downto 0));
end Mux 3x7;

architecture Behavioral of Mux 3x7 is

begin


end Behavioral;
