--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TTL_to_Machester_1553.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::PolarFireSoC> <Die::MPFS095T> <Package::FCSG325>
-- Author: <Name>
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity TTL_Manchester_Generator is
    port (
        i_clk_1MHz         : IN  std_logic;   -- 1 MHz clock (500 ns half-bit)
        i_reset_n          : IN  std_logic;
        i_ttl_data         : IN  std_logic;   -- 1 us TTL data
        o_pulse_manchester : OUT std_logic
    );
end entity;

architecture architecture_TTL_Manchester of TTL_Manchester_Generator is

    signal s_half_clk : std_logic := '0';

begin

    --------------------------------------------------
    -- Half-bit clock (toggles every 500 ns)
    --------------------------------------------------
    process(i_clk_1MHz)
    begin
        if rising_edge(i_clk_1MHz) then
            if i_reset_n = '0' then
                s_half_clk <= '0';
            else
                s_half_clk <= not s_half_clk;
            end if;
        end if;
    end process;

    --------------------------------------------------
    -- Manchester encoding (IEEE 802.3)
    -- Works for repeated bits and transitions
    --------------------------------------------------
    o_pulse_manchester <= not (i_ttl_data xor s_half_clk);

end architecture;  



