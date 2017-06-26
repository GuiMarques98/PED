----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.06.2017 20:34:56
-- Design Name: 
-- Module Name: Teste_Contador - Behavioral
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

entity Teste_Contador is
  Port (clk_in : in STD_LOGIC;
        clk_out1 : out STD_LOGIC;
        clk_out2 : out STD_LOGIC
   );
   

end Teste_Contador;

architecture Behavioral of Teste_Contador is

   component divisor_clk2 is
       Port (Clk_in : in std_logic;
             Clk_out : out std_logic
        );
   end component;
      component divisor_clk is
       Port (Clk_in : in std_logic;
             Clk_out : out std_logic
        );
   end component;
begin

    P1 : divisor_clk port map (Clk_in => Clk_in, Clk_out => clk_out1);
    P2 : divisor_clk2 port map (Clk_in => Clk_in, Clk_out => clk_out2);
    
end Behavioral;
