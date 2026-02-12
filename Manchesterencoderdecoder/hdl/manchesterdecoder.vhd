--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: manchesterdecoder.vhd
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
use IEEE.numeric_std.all;

entity Manchester_Decoder is
    port (
        i_clk        : in  std_logic;
        i_reset_n    : in  std_logic;

        -- Serial Manchester input
        i_manchester : in  std_logic;

        -- Decoded parallel output
        o_word_data  : out std_logic_vector(15 downto 0);
        o_word_valid : out std_logic
    );
end entity;

architecture rtl of Manchester_Decoder is

    type state_type is (IDLE, SYNC_DETECT, DATA, PARITY);
    signal state : state_type := IDLE;

    signal bit_cnt  : integer range 0 to 15 := 0;
    signal shift_reg: std_logic_vector(15 downto 0) := (others => '0');

    -- Edge detection
    signal prev_sample : std_logic := '0';
    signal edge_detect : std_logic;

begin

    --------------------------------------------------
    -- Simple edge detection (Manchester transition)
    --------------------------------------------------
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            prev_sample <= i_manchester;
            edge_detect <= i_manchester xor prev_sample;
        end if;
    end process;

    --------------------------------------------------
    -- Decoder FSM
    --------------------------------------------------
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            if i_reset_n = '0' then
                state        <= IDLE;
                bit_cnt      <= 0;
                shift_reg    <= (others => '0');
                o_word_valid <= '0';

            else
                o_word_valid <= '0';

                case state is

                    --------------------------------------------------
                    -- Wait for sync pattern (simplified)
                    --------------------------------------------------
                    when IDLE =>
                        if edge_detect = '1' then
                            state <= DATA;
                            bit_cnt <= 0;
                        end if;

                    --------------------------------------------------
                    -- Collect 16 data bits
                    --------------------------------------------------
                    when DATA =>
                        if edge_detect = '1' then
                            shift_reg <= shift_reg(14 downto 0) & i_manchester;

                            if bit_cnt = 15 then
                                state <= PARITY;
                            else
                                bit_cnt <= bit_cnt + 1;
                            end if;
                        end if;

                    --------------------------------------------------
                    -- Ignore parity (simplified)
                    --------------------------------------------------
                    when PARITY =>
                        o_word_data  <= shift_reg;
                        o_word_valid <= '1';
                        state <= IDLE;

                end case;
            end if;
        end if;
    end process;

end architecture;
