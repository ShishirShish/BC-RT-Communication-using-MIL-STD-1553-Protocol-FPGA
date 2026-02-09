----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Mon Jan 19 11:34:27 2026
-- Parameters for CORE1553BRT_APB
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant BCASTEN : integer := 1;
    constant CLKSPD : integer := 16;
    constant CLKSYNC : integer := 1;
    constant ECC : integer := 0;
    constant EXTERNAL_BIST : integer := 0;
    constant FAMILY : integer := 27;
    constant HDL_license : string( 1 to 1 ) := "E";
    constant INITLASTSW : integer := 0;
    constant INT_POLARITY : integer := 1;
    constant INTENBBR : integer := 0;
    constant LEGMODE : integer := 2;
    constant LOCKRT : integer := 1;
    constant SA30LOOP : integer := 0;
    constant testbench : string( 1 to 4 ) := "User";
    constant TESTTXTOUTEN : integer := 1;
end coreparameters;
