--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: Subsystem.vhd
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

entity MIL1553_Memory_Subsystem is
    port (
        i_clk : in std_logic;

        --------------------------------------------------
        -- RT FSM Interface
        --------------------------------------------------
        rt_tx_bus_addr : in  std_logic_vector(9 downto 0);
        rt_tx_bus_data : out std_logic_vector(15 downto 0);

        rt_rx_bus_addr : in  std_logic_vector(9 downto 0);
        rt_rx_bus_data : in  std_logic_vector(15 downto 0);
        rt_rx_bus_we   : in  std_logic;

        --------------------------------------------------
        -- BC FSM Interface
        --------------------------------------------------
        bc_tx_bus_addr : in  std_logic_vector(9 downto 0);
        bc_tx_bus_data : out std_logic_vector(15 downto 0);

        bc_rx_bus_addr : in  std_logic_vector(9 downto 0);
        bc_rx_bus_data : in  std_logic_vector(15 downto 0);
        bc_rx_bus_we   : in  std_logic
    );
end entity;

architecture rtl of MIL1553_Memory_Subsystem is

    type ram_type is array (0 to 1023) of std_logic_vector(15 downto 0);

    signal RT_TX_RAM : ram_type := (others => (others => '0'));
    signal RT_RX_RAM : ram_type := (others => (others => '0'));
    signal BC_TX_RAM : ram_type := (others => (others => '0'));
    signal BC_RX_RAM : ram_type := (others => (others => '0'));

begin

    --------------------------------------------------
    -- RT TX RAM (FSM READ)
    --------------------------------------------------
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            rt_tx_bus_data <= RT_TX_RAM(to_integer(unsigned(rt_tx_bus_addr)));
        end if;
    end process;

    --------------------------------------------------
    -- RT RX RAM (FSM WRITE)
    --------------------------------------------------
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            if rt_rx_bus_we = '1' then
                RT_RX_RAM(to_integer(unsigned(rt_rx_bus_addr))) <= rt_rx_bus_data;
            end if;
        end if;
    end process;

    --------------------------------------------------
    -- BC TX RAM (FSM READ)
    --------------------------------------------------
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            bc_tx_bus_data <= BC_TX_RAM(to_integer(unsigned(bc_tx_bus_addr)));
        end if;
    end process;

    --------------------------------------------------
    -- BC RX RAM (FSM WRITE)
    --------------------------------------------------
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            if bc_rx_bus_we = '1' then
                BC_RX_RAM(to_integer(unsigned(bc_rx_bus_addr))) <= bc_rx_bus_data;
            end if;
        end if;
    end process;

end architecture;
