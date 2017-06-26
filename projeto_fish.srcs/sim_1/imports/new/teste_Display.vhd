----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.06.2017 23:51:36
-- Design Name: 
-- Module Name: teste_Display - Behavioral
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

entity teste_Display is
  Port (numero : in std_logic_vector(12 downto 0);
        Clk : in std_logic
  );
end teste_Display;


architecture Behavioral of teste_Display is
component divisor_clk is
    Port (Clk_in : in std_logic;
          Clk_out : out std_logic
     );
end component;

component Mux is
    Port (Input : in STD_LOGIC_VECTOR(12 DOWNTO 0);
          clk_in : in STD_LOGIC_VECTOR(1 DOWNTO 0);
          Output, An : out STD_LOGIC_VECTOR(3 DOWNTO 0);
          Sinal : out STD_LOGIC
     );
end component;


component divisor_clk2 is
    Port (Clk_in : in std_logic;
          Clk_out : out std_logic
     );
end component;

component Sinal_7seg is
    Port (Input : IN STD_LOGIC;
          Output : OUT STD_LOGIC_VECTOR(0 TO 6)
          );
end component;

component BCD_7seg is
  Port (Input : in STD_LOGIC_VECTOR(0 TO 3);
        Output : out STD_lOGIC_VECTOR(0 TO 6)
        );
end component;

    signal clk1 : std_logic;
    signal clk2 : std_logic;
    signal num : std_logic_vector(3 downto 0);
    signal seg7 : std_logic_vector(6 downto 0);
    signal saidasinal : std_logic_vector(0 to 6);
    signal Sinal : std_logic;

begin
    P1 : divisor_clk port map (Clk_in=> Clk, Clk_out => clk1);
    P2 : divisor_clk2 port map(Clk_in=> Clk, Clk_out => clk2);
    P3 : Mux port map (Input => numero, clk_in(1) => clk1, clk_in(0)=> clk2, Output => num, Sinal => Sinal);
    P4 : BCD_7seg port map(Input => num, Output=> seg7);
    P5 : Sinal_7seg port map(Input=>Sinal, Output => saidasinal);


end Behavioral;
