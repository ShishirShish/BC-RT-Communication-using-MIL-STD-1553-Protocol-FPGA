`timescale 1 ns/100 ps
// Version: 2025.2 2025.2.0.14


module BC_TX_RAM_PF_DPSRAM_AHB_AXI_0_PF_DPSRAM(
       A_DIN,
       A_DOUT,
       B_DIN,
       B_DOUT,
       A_ADDR,
       B_ADDR,
       B_BLK_EN,
       A_REN,
       B_REN,
       A_CLK,
       B_CLK,
       A_WEN,
       B_WEN,
       A_WBYTE_EN,
       B_WBYTE_EN
    );
input  [39:0] A_DIN;
output [39:0] A_DOUT;
input  [39:0] B_DIN;
output [39:0] B_DOUT;
input  [9:0] A_ADDR;
input  [9:0] B_ADDR;
input  B_BLK_EN;
input  A_REN;
input  B_REN;
input  A_CLK;
input  B_CLK;
input  A_WEN;
input  B_WEN;
input  [3:0] A_WBYTE_EN;
input  [3:0] B_WBYTE_EN;

    wire \WBYTEENA[0] , \WBYTEENA[1] , \WBYTEENA[2] , \WBYTEENA[3] , 
        \WBYTEENB[0] , \WBYTEENB[1] , \WBYTEENB[2] , \WBYTEENB[3] , 
        \ACCESS_BUSY[0][0] , \ACCESS_BUSY[0][1] , VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    CFG2 #( .INIT(4'h8) )  \AND2WBYTEENA[3]  (.A(A_WBYTE_EN[3]), .B(
        A_WEN), .Y(\WBYTEENA[3] ));
    CFG2 #( .INIT(4'h8) )  \AND2WBYTEENB[2]  (.A(B_WBYTE_EN[2]), .B(
        B_WEN), .Y(\WBYTEENB[2] ));
    RAM1K20 #( .RAMINDEX("BC_TX_RAM%1024-1024%40-40%POWER%0%0%DUAL-PORT%ECC_EN-0")
         )  BC_TX_RAM_PF_DPSRAM_AHB_AXI_0_PF_DPSRAM_R0C0 (.A_DOUT({
        A_DOUT[19], A_DOUT[18], A_DOUT[17], A_DOUT[16], A_DOUT[15], 
        A_DOUT[14], A_DOUT[13], A_DOUT[12], A_DOUT[11], A_DOUT[10], 
        A_DOUT[9], A_DOUT[8], A_DOUT[7], A_DOUT[6], A_DOUT[5], 
        A_DOUT[4], A_DOUT[3], A_DOUT[2], A_DOUT[1], A_DOUT[0]}), 
        .B_DOUT({B_DOUT[19], B_DOUT[18], B_DOUT[17], B_DOUT[16], 
        B_DOUT[15], B_DOUT[14], B_DOUT[13], B_DOUT[12], B_DOUT[11], 
        B_DOUT[10], B_DOUT[9], B_DOUT[8], B_DOUT[7], B_DOUT[6], 
        B_DOUT[5], B_DOUT[4], B_DOUT[3], B_DOUT[2], B_DOUT[1], 
        B_DOUT[0]}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][0] ), .A_ADDR({A_ADDR[9], A_ADDR[8], A_ADDR[7], 
        A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], A_ADDR[2], 
        A_ADDR[1], A_ADDR[0], GND, GND, GND, GND}), .A_BLK_EN({VCC, 
        VCC, VCC}), .A_CLK(A_CLK), .A_DIN({A_DIN[19], A_DIN[18], 
        A_DIN[17], A_DIN[16], A_DIN[15], A_DIN[14], A_DIN[13], 
        A_DIN[12], A_DIN[11], A_DIN[10], A_DIN[9], A_DIN[8], A_DIN[7], 
        A_DIN[6], A_DIN[5], A_DIN[4], A_DIN[3], A_DIN[2], A_DIN[1], 
        A_DIN[0]}), .A_REN(A_REN), .A_WEN({\WBYTEENA[1] , 
        \WBYTEENA[0] }), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({
        B_BLK_EN, VCC, VCC}), .B_CLK(B_CLK), .B_DIN({B_DIN[19], 
        B_DIN[18], B_DIN[17], B_DIN[16], B_DIN[15], B_DIN[14], 
        B_DIN[13], B_DIN[12], B_DIN[11], B_DIN[10], B_DIN[9], B_DIN[8], 
        B_DIN[7], B_DIN[6], B_DIN[5], B_DIN[4], B_DIN[3], B_DIN[2], 
        B_DIN[1], B_DIN[0]}), .B_REN(B_REN), .B_WEN({\WBYTEENB[1] , 
        \WBYTEENB[0] }), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("BC_TX_RAM%1024-1024%40-40%POWER%0%1%DUAL-PORT%ECC_EN-0")
         )  BC_TX_RAM_PF_DPSRAM_AHB_AXI_0_PF_DPSRAM_R0C1 (.A_DOUT({
        A_DOUT[39], A_DOUT[38], A_DOUT[37], A_DOUT[36], A_DOUT[35], 
        A_DOUT[34], A_DOUT[33], A_DOUT[32], A_DOUT[31], A_DOUT[30], 
        A_DOUT[29], A_DOUT[28], A_DOUT[27], A_DOUT[26], A_DOUT[25], 
        A_DOUT[24], A_DOUT[23], A_DOUT[22], A_DOUT[21], A_DOUT[20]}), 
        .B_DOUT({B_DOUT[39], B_DOUT[38], B_DOUT[37], B_DOUT[36], 
        B_DOUT[35], B_DOUT[34], B_DOUT[33], B_DOUT[32], B_DOUT[31], 
        B_DOUT[30], B_DOUT[29], B_DOUT[28], B_DOUT[27], B_DOUT[26], 
        B_DOUT[25], B_DOUT[24], B_DOUT[23], B_DOUT[22], B_DOUT[21], 
        B_DOUT[20]}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][1] ), .A_ADDR({A_ADDR[9], A_ADDR[8], A_ADDR[7], 
        A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], A_ADDR[2], 
        A_ADDR[1], A_ADDR[0], GND, GND, GND, GND}), .A_BLK_EN({VCC, 
        VCC, VCC}), .A_CLK(A_CLK), .A_DIN({A_DIN[39], A_DIN[38], 
        A_DIN[37], A_DIN[36], A_DIN[35], A_DIN[34], A_DIN[33], 
        A_DIN[32], A_DIN[31], A_DIN[30], A_DIN[29], A_DIN[28], 
        A_DIN[27], A_DIN[26], A_DIN[25], A_DIN[24], A_DIN[23], 
        A_DIN[22], A_DIN[21], A_DIN[20]}), .A_REN(A_REN), .A_WEN({
        \WBYTEENA[3] , \WBYTEENA[2] }), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[9], 
        B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], B_ADDR[4], 
        B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0], GND, GND, GND, GND})
        , .B_BLK_EN({B_BLK_EN, VCC, VCC}), .B_CLK(B_CLK), .B_DIN({
        B_DIN[39], B_DIN[38], B_DIN[37], B_DIN[36], B_DIN[35], 
        B_DIN[34], B_DIN[33], B_DIN[32], B_DIN[31], B_DIN[30], 
        B_DIN[29], B_DIN[28], B_DIN[27], B_DIN[26], B_DIN[25], 
        B_DIN[24], B_DIN[23], B_DIN[22], B_DIN[21], B_DIN[20]}), 
        .B_REN(B_REN), .B_WEN({\WBYTEENB[3] , \WBYTEENB[2] }), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    CFG2 #( .INIT(4'h8) )  \AND2WBYTEENB[3]  (.A(B_WBYTE_EN[3]), .B(
        B_WEN), .Y(\WBYTEENB[3] ));
    CFG2 #( .INIT(4'h8) )  \AND2WBYTEENB[0]  (.A(B_WBYTE_EN[0]), .B(
        B_WEN), .Y(\WBYTEENB[0] ));
    CFG2 #( .INIT(4'h8) )  \AND2WBYTEENA[0]  (.A(A_WBYTE_EN[0]), .B(
        A_WEN), .Y(\WBYTEENA[0] ));
    CFG2 #( .INIT(4'h8) )  \AND2WBYTEENA[2]  (.A(A_WBYTE_EN[2]), .B(
        A_WEN), .Y(\WBYTEENA[2] ));
    CFG2 #( .INIT(4'h8) )  \AND2WBYTEENA[1]  (.A(A_WBYTE_EN[1]), .B(
        A_WEN), .Y(\WBYTEENA[1] ));
    CFG2 #( .INIT(4'h8) )  \AND2WBYTEENB[1]  (.A(B_WBYTE_EN[1]), .B(
        B_WEN), .Y(\WBYTEENB[1] ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
