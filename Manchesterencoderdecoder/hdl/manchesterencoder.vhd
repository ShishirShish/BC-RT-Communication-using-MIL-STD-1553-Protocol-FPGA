--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: manchesterencoder.vhd
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

entity Manchester_Encoder is
    port (
        i_clk        : in  std_logic;
        i_reset_n    : in  std_logic;

        -- Parallel input from FSM
        i_word_data  : in  std_logic_vector(15 downto 0);
        i_word_valid : in  std_logic;

        -- Serial Manchester output
        o_manchester : out std_logic;
        o_busy       : out std_logic
    );
end entity;

architecture rtl of Manchester_Encoder is

    type state_type is (IDLE, SYNC, DATA, PARITY);
    signal state : state_type := IDLE;

    signal shift_reg : std_logic_vector(15 downto 0);
    signal bit_cnt   : integer range 0 to 15 := 0;

    signal parity_bit : std_logic := '0';

    -- Clock divider for 1 Mbps (20 MHz / 20)
    constant BIT_PERIOD : integer := 20;
    signal clk_cnt  : integer range 0 to BIT_PERIOD-1 := 0;
    signal bit_tick : std_logic := '0';

    signal manchester_bit : std_logic := '0';

begin

    --------------------------------------------------
    -- Bit rate generator (1 Mbps)
    --------------------------------------------------
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            if clk_cnt = BIT_PERIOD-1 then
                clk_cnt  <= 0;
                bit_tick <= '1';
            else
                clk_cnt  <= clk_cnt + 1;
                bit_tick <= '0';
            end if;
        end if;
    end process;

    --------------------------------------------------
    -- Encoder FSM
    --------------------------------------------------
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            if i_reset_n = '0' then
                state         <= IDLE;
                o_busy        <= '0';
                bit_cnt       <= 0;
                manchester_bit<= '0';

            else
                case state is

                    --------------------------------------------------
                    when IDLE =>
                        o_busy <= '0';

                        if i_word_valid = '1' then
                            shift_reg <= i_word_data;

                            -- Even parity
                            parity_bit <= '0';
                            for i in 0 to 15 loop
                                parity_bit <= parity_bit xor i_word_data(i);
                            end loop;

                            state  <= SYNC;
                            o_busy <= '1';
                        end if;

                    --------------------------------------------------
                    when SYNC =>
                        if bit_tick = '1' then
                            -- Simple sync pattern (example: 3-bit high-low toggle)
                            manchester_bit <= not manchester_bit;
                            state <= DATA;
                            bit_cnt <= 0;
                        end if;

                    --------------------------------------------------
                    when DATA =>
                        if bit_tick = '1' then
                            -- Manchester encoding:
                            -- 0 = low-high
                            -- 1 = high-low
                            if shift_reg(15) = '1' then
                                manchester_bit <= not manchester_bit;
                            else
                                manchester_bit <= manchester_bit;
                            end if;

                            shift_reg <= shift_reg(14 downto 0) & '0';

                            if bit_cnt = 15 then
                                state <= PARITY;
                            else
                                bit_cnt <= bit_cnt + 1;
                            end if;
                        end if;

                    --------------------------------------------------
                    when PARITY =>
                        if bit_tick = '1' then
                            if parity_bit = '1' then
                                manchester_bit <= not manchester_bit;
                            else
                                manchester_bit <= manchester_bit;
                            end if;

                            state <= IDLE;
                        end if;

                end case;
            end if;
        end if;
    end process;

    o_manchester <= manchester_bit;

end architecture;
