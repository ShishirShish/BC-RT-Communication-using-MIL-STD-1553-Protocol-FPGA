--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: dual_port_memory.vhd
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

entity dual_port_memory is
    port (
        CLK    : in  std_logic;

        -- Port A
        A_WEN  : in  std_logic;
        A_ADDR : in  std_logic_vector(4 downto 0);
        A_DIN  : in  std_logic_vector(15 downto 0);
        A_DOUT : out std_logic_vector(15 downto 0);

        -- Port B
        B_WEN  : in  std_logic;
        B_ADDR : in  std_logic_vector(4 downto 0);
        B_DIN  : in  std_logic_vector(15 downto 0);
        B_DOUT : out std_logic_vector(15 downto 0)
    );
end entity dual_port_memory;

architecture behavioral of dual_port_memory is

    type ram_type is array (0 to 31) of std_logic_vector(15 downto 0);
    signal ram : ram_type := (others => (others => '0'));

begin

    ------------------------------------------------------------------
    -- WRITE PROCESS (RBW)
    ------------------------------------------------------------------
    process (CLK)
        variable addr_a : integer range 0 to 31;
        variable addr_b : integer range 0 to 31;
    begin
        if rising_edge(CLK) then
            addr_a := to_integer(unsigned(A_ADDR));
            addr_b := to_integer(unsigned(B_ADDR));

            if A_WEN = '1' then
                ram(addr_a) <= A_DIN;
            end if;

            if B_WEN = '1' then
                ram(addr_b) <= B_DIN;
            end if;
        end if;
    end process;

    ------------------------------------------------------------------
    -- READ PROCESS (OLD DATA)
    ------------------------------------------------------------------
    process (CLK)
        variable addr_a : integer range 0 to 31;
        variable addr_b : integer range 0 to 31;
    begin
        if rising_edge(CLK) then
            addr_a := to_integer(unsigned(A_ADDR));
            addr_b := to_integer(unsigned(B_ADDR));

            A_DOUT <= ram(addr_a);
            B_DOUT <= ram(addr_b);
        end if;
    end process;

end architecture behavioral;
