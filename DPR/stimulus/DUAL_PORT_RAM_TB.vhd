----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Thu Feb  5 21:16:36 2026
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: DUAL_PORT_RAM_TB.vhd
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DUAL_PORT_RAM_TB is
end DUAL_PORT_RAM_TB;

architecture behavioral of DUAL_PORT_RAM_TB is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10 MHz

    signal SYSCLK    : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    signal sA_WEN   : std_logic := '0';
    signal sA_ADDR  : std_logic_vector(4 downto 0) := (others => '0');
    signal sA_DIN   : std_logic_vector(15 downto 0) := (others => '0');

    signal sB_WEN   : std_logic := '0';
    signal sB_ADDR  : std_logic_vector(4 downto 0) := (others => '0');
    signal sB_DIN   : std_logic_vector(15 downto 0) := (others => '0');

    signal sA_DOUT  : std_logic_vector(15 downto 0);
    signal sB_DOUT  : std_logic_vector(15 downto 0);

    component dual_port_memory
        port(
            CLK     : in  std_logic;
            A_WEN   : in  std_logic;
            A_ADDR  : in  std_logic_vector(4 downto 0);
            A_DIN   : in  std_logic_vector(15 downto 0);
            A_DOUT  : out std_logic_vector(15 downto 0);
            B_WEN   : in  std_logic;
            B_ADDR  : in  std_logic_vector(4 downto 0);
            B_DIN   : in  std_logic_vector(15 downto 0);
            B_DOUT  : out std_logic_vector(15 downto 0)
        );
    end component;

begin

    ------------------------------------------------------------------
    -- Clock : 10 MHz
    ------------------------------------------------------------------
    SYSCLK <= not SYSCLK after SYSCLK_PERIOD / 2;

    ------------------------------------------------------------------
    -- Reset
    ------------------------------------------------------------------
    reset_proc : process
    begin
        NSYSRESET <= '0';
        for i in 1 to 10 loop
            wait until rising_edge(SYSCLK);
        end loop;
        NSYSRESET <= '1';
        wait;
    end process;

    ------------------------------------------------------------------
    -- Stimulus
    ------------------------------------------------------------------
    stim_proc : process
    begin
        -- wait for reset release
        for i in 1 to 12 loop
            wait until rising_edge(SYSCLK);
        end loop;

        --------------------------------------------------------------
        -- WRITE PHASE (3 cycles per address)
        --------------------------------------------------------------
        sA_WEN <= '1';

        for addr in 0 to 15 loop
            sA_ADDR <= std_logic_vector(to_unsigned(addr, 5));
            sA_DIN  <= std_logic_vector(to_unsigned(addr * 10, 16));

            -- Cycle 1: DOUT shows PREVIOUS data (RBW)
            wait until rising_edge(SYSCLK);

            -- Cycle 2: Memory write completes
            wait until rising_edge(SYSCLK);

            -- Cycle 3: Hold for stability
            wait until rising_edge(SYSCLK);
        end loop;

        sA_WEN <= '0';
        sA_DIN <= (others => '0');
        wait until rising_edge(SYSCLK);

        --------------------------------------------------------------
        -- READ PHASE
        --------------------------------------------------------------
        for addr in 0 to 15 loop
            sA_ADDR <= std_logic_vector(to_unsigned(addr, 5));
            wait until rising_edge(SYSCLK);
        end loop;

        wait;
    end process;

    ------------------------------------------------------------------
    -- DUT instantiation
    ------------------------------------------------------------------
    MEMORY_0 : dual_port_memory
        port map(
            CLK     => SYSCLK,
            A_WEN   => sA_WEN,
            A_ADDR  => sA_ADDR,
            A_DIN   => sA_DIN,
            A_DOUT  => sA_DOUT,
            B_WEN   => sB_WEN,
            B_ADDR  => sB_ADDR,
            B_DIN   => sB_DIN,
            B_DOUT  => sB_DOUT
        );

end architecture behavioral;

