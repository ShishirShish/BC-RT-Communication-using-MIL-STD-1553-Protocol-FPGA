//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jan 16 12:56:53 2026
// Version: 2025.2 2025.2.0.14
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of BC_TX_RAM to TCL
# Family: PolarFireSoC
# Part Number: MPFS095T-1FCSG325E
# Create and Configure the core component BC_TX_RAM
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_SRAM_AHBL_AXI:1.2.115} -component_name {BC_TX_RAM} -params {\
"AHBL_TIMEOUT_COUNT:80" \
"AXI4_AWIDTH:32" \
"AXI4_DWIDTH:32" \
"AXI4_IDWIDTH:8" \
"AXI4_IFTYPE_RD:T" \
"AXI4_IFTYPE_WR:T" \
"AXI4_WRAP_SUPPORT:F" \
"AXI_READ_TIMEOUT_COUNT:80" \
"AXI_WRITE_TIMEOUT_COUNT:80" \
"BYTEENABLES:1" \
"BYTE_ENABLE_WIDTH:4" \
"B_REN_POLARITY:1" \
"CASCADE:1" \
"ECC_OPTIONS:0" \
"FABRIC_INTERFACE_TYPE:0" \
"HI_REL:F" \
"IMPORT_FILE:" \
"INIT_RAM:F" \
"LPM_HINT:0" \
"PIPELINE_OPTIONS:1" \
"RDEPTH:1024" \
"RESET_TYPE:ASYNCHRONOUS" \
"RWIDTH:40" \
"USE_NATIVE_INTERFACE:T" \
"WDEPTH:1024" \
"WWIDTH:40" }
# Exporting Component Description of BC_TX_RAM to TCL done
*/

// BC_TX_RAM
module BC_TX_RAM(
    // Inputs
    B_ADDR,
    B_BLK_EN,
    B_CLK,
    B_DIN,
    B_REN,
    B_WBYTE_EN,
    B_WEN,
    HADDR,
    HBURST,
    HCLK,
    HREADYIN,
    HRESETN,
    HSEL,
    HSIZE,
    HTRANS,
    HWDATA,
    HWRITE,
    // Outputs
    B_DOUT,
    HRDATA,
    HREADYOUT,
    HRESP
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [9:0]  B_ADDR;
input         B_BLK_EN;
input         B_CLK;
input  [31:0] B_DIN;
input         B_REN;
input  [3:0]  B_WBYTE_EN;
input         B_WEN;
input  [31:0] HADDR;
input  [2:0]  HBURST;
input         HCLK;
input         HREADYIN;
input         HRESETN;
input         HSEL;
input  [2:0]  HSIZE;
input  [1:0]  HTRANS;
input  [31:0] HWDATA;
input         HWRITE;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [31:0] B_DOUT;
output [31:0] HRDATA;
output        HREADYOUT;
output [1:0]  HRESP;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [31:0]  HADDR;
wire   [2:0]   HBURST;
wire   [31:0]  AHBSlaveInterface_HRDATA;
wire           HREADYIN;
wire           AHBSlaveInterface_HREADYOUT;
wire   [1:0]   AHBSlaveInterface_HRESP;
wire           HSEL;
wire   [2:0]   HSIZE;
wire   [1:0]   HTRANS;
wire   [31:0]  HWDATA;
wire           HWRITE;
wire   [9:0]   B_ADDR;
wire           B_BLK_EN;
wire           B_CLK;
wire   [0:0]   B_DIN_slice_0;
wire   [1:1]   B_DIN_slice_1;
wire   [2:2]   B_DIN_slice_2;
wire   [3:3]   B_DIN_slice_3;
wire   [4:4]   B_DIN_slice_4;
wire   [5:5]   B_DIN_slice_5;
wire   [6:6]   B_DIN_slice_6;
wire   [7:7]   B_DIN_slice_7;
wire   [8:8]   B_DIN_slice_8;
wire   [9:9]   B_DIN_slice_9;
wire   [10:10] B_DIN_slice_10;
wire   [11:11] B_DIN_slice_11;
wire   [12:12] B_DIN_slice_12;
wire   [13:13] B_DIN_slice_13;
wire   [14:14] B_DIN_slice_14;
wire   [15:15] B_DIN_slice_15;
wire   [16:16] B_DIN_slice_16;
wire   [17:17] B_DIN_slice_17;
wire   [18:18] B_DIN_slice_18;
wire   [19:19] B_DIN_slice_19;
wire   [20:20] B_DIN_slice_20;
wire   [21:21] B_DIN_slice_21;
wire   [22:22] B_DIN_slice_22;
wire   [23:23] B_DIN_slice_23;
wire   [24:24] B_DIN_slice_24;
wire   [25:25] B_DIN_slice_25;
wire   [26:26] B_DIN_slice_26;
wire   [27:27] B_DIN_slice_27;
wire   [28:28] B_DIN_slice_28;
wire   [29:29] B_DIN_slice_29;
wire   [30:30] B_DIN_slice_30;
wire   [31:31] B_DIN_slice_31;
wire   [0:0]   B_DOUT_net_0;
wire   [1:1]   B_DOUT_0;
wire   [2:2]   B_DOUT_1;
wire   [3:3]   B_DOUT_2;
wire   [4:4]   B_DOUT_3;
wire   [5:5]   B_DOUT_4;
wire   [6:6]   B_DOUT_5;
wire   [7:7]   B_DOUT_6;
wire   [10:10] B_DOUT_7;
wire   [11:11] B_DOUT_8;
wire   [12:12] B_DOUT_9;
wire   [13:13] B_DOUT_10;
wire   [14:14] B_DOUT_11;
wire   [15:15] B_DOUT_12;
wire   [16:16] B_DOUT_13;
wire   [17:17] B_DOUT_14;
wire   [20:20] B_DOUT_15;
wire   [21:21] B_DOUT_16;
wire   [22:22] B_DOUT_17;
wire   [23:23] B_DOUT_18;
wire   [24:24] B_DOUT_19;
wire   [25:25] B_DOUT_20;
wire   [26:26] B_DOUT_21;
wire   [27:27] B_DOUT_22;
wire   [30:30] B_DOUT_23;
wire   [31:31] B_DOUT_24;
wire   [32:32] B_DOUT_25;
wire   [33:33] B_DOUT_26;
wire   [34:34] B_DOUT_27;
wire   [35:35] B_DOUT_28;
wire   [36:36] B_DOUT_29;
wire   [37:37] B_DOUT_30;
wire           B_REN;
wire   [3:0]   B_WBYTE_EN;
wire           B_WEN;
wire   [0:0]   COREAHBLSRAM_PF_0_mem_addr0to0;
wire   [1:1]   COREAHBLSRAM_PF_0_mem_addr1to1;
wire   [2:2]   COREAHBLSRAM_PF_0_mem_addr2to2;
wire   [3:3]   COREAHBLSRAM_PF_0_mem_addr3to3;
wire   [4:4]   COREAHBLSRAM_PF_0_mem_addr4to4;
wire   [5:5]   COREAHBLSRAM_PF_0_mem_addr5to5;
wire   [6:6]   COREAHBLSRAM_PF_0_mem_addr6to6;
wire   [7:7]   COREAHBLSRAM_PF_0_mem_addr7to7;
wire   [8:8]   COREAHBLSRAM_PF_0_mem_addr8to8;
wire   [9:9]   COREAHBLSRAM_PF_0_mem_addr9to9;
wire   [0:0]   COREAHBLSRAM_PF_0_mem_byteen0to0;
wire   [1:1]   COREAHBLSRAM_PF_0_mem_byteen1to1;
wire   [2:2]   COREAHBLSRAM_PF_0_mem_byteen2to2;
wire   [3:3]   COREAHBLSRAM_PF_0_mem_byteen3to3;
wire           COREAHBLSRAM_PF_0_mem_ren;
wire   [0:0]   COREAHBLSRAM_PF_0_mem_wdata0to0;
wire   [1:1]   COREAHBLSRAM_PF_0_mem_wdata1to1;
wire   [2:2]   COREAHBLSRAM_PF_0_mem_wdata2to2;
wire   [3:3]   COREAHBLSRAM_PF_0_mem_wdata3to3;
wire   [4:4]   COREAHBLSRAM_PF_0_mem_wdata4to4;
wire   [5:5]   COREAHBLSRAM_PF_0_mem_wdata5to5;
wire   [6:6]   COREAHBLSRAM_PF_0_mem_wdata6to6;
wire   [7:7]   COREAHBLSRAM_PF_0_mem_wdata7to7;
wire   [8:8]   COREAHBLSRAM_PF_0_mem_wdata8to8;
wire   [9:9]   COREAHBLSRAM_PF_0_mem_wdata9to9;
wire   [10:10] COREAHBLSRAM_PF_0_mem_wdata10to10;
wire   [11:11] COREAHBLSRAM_PF_0_mem_wdata11to11;
wire   [12:12] COREAHBLSRAM_PF_0_mem_wdata12to12;
wire   [13:13] COREAHBLSRAM_PF_0_mem_wdata13to13;
wire   [14:14] COREAHBLSRAM_PF_0_mem_wdata14to14;
wire   [15:15] COREAHBLSRAM_PF_0_mem_wdata15to15;
wire   [16:16] COREAHBLSRAM_PF_0_mem_wdata16to16;
wire   [17:17] COREAHBLSRAM_PF_0_mem_wdata17to17;
wire   [18:18] COREAHBLSRAM_PF_0_mem_wdata18to18;
wire   [19:19] COREAHBLSRAM_PF_0_mem_wdata19to19;
wire   [20:20] COREAHBLSRAM_PF_0_mem_wdata20to20;
wire   [21:21] COREAHBLSRAM_PF_0_mem_wdata21to21;
wire   [22:22] COREAHBLSRAM_PF_0_mem_wdata22to22;
wire   [23:23] COREAHBLSRAM_PF_0_mem_wdata23to23;
wire   [24:24] COREAHBLSRAM_PF_0_mem_wdata24to24;
wire   [25:25] COREAHBLSRAM_PF_0_mem_wdata25to25;
wire   [26:26] COREAHBLSRAM_PF_0_mem_wdata26to26;
wire   [27:27] COREAHBLSRAM_PF_0_mem_wdata27to27;
wire   [28:28] COREAHBLSRAM_PF_0_mem_wdata28to28;
wire   [29:29] COREAHBLSRAM_PF_0_mem_wdata29to29;
wire   [30:30] COREAHBLSRAM_PF_0_mem_wdata30to30;
wire   [31:31] COREAHBLSRAM_PF_0_mem_wdata31to31;
wire           COREAHBLSRAM_PF_0_mem_wen;
wire           HCLK;
wire           HRESETN;
wire   [11:0]  mem_addr;
wire   [3:0]   mem_byteen;
wire   [31:0]  mem_wdata;
wire   [0:0]   PF_DPSRAM_AHB_AXI_0_A_DOUT0to0;
wire   [1:1]   PF_DPSRAM_AHB_AXI_0_A_DOUT1to1;
wire   [2:2]   PF_DPSRAM_AHB_AXI_0_A_DOUT2to2;
wire   [3:3]   PF_DPSRAM_AHB_AXI_0_A_DOUT3to3;
wire   [4:4]   PF_DPSRAM_AHB_AXI_0_A_DOUT4to4;
wire   [5:5]   PF_DPSRAM_AHB_AXI_0_A_DOUT5to5;
wire   [6:6]   PF_DPSRAM_AHB_AXI_0_A_DOUT6to6;
wire   [7:7]   PF_DPSRAM_AHB_AXI_0_A_DOUT7to7;
wire   [10:10] PF_DPSRAM_AHB_AXI_0_A_DOUT10to10;
wire   [11:11] PF_DPSRAM_AHB_AXI_0_A_DOUT11to11;
wire   [12:12] PF_DPSRAM_AHB_AXI_0_A_DOUT12to12;
wire   [13:13] PF_DPSRAM_AHB_AXI_0_A_DOUT13to13;
wire   [14:14] PF_DPSRAM_AHB_AXI_0_A_DOUT14to14;
wire   [15:15] PF_DPSRAM_AHB_AXI_0_A_DOUT15to15;
wire   [16:16] PF_DPSRAM_AHB_AXI_0_A_DOUT16to16;
wire   [17:17] PF_DPSRAM_AHB_AXI_0_A_DOUT17to17;
wire   [20:20] PF_DPSRAM_AHB_AXI_0_A_DOUT20to20;
wire   [21:21] PF_DPSRAM_AHB_AXI_0_A_DOUT21to21;
wire   [22:22] PF_DPSRAM_AHB_AXI_0_A_DOUT22to22;
wire   [23:23] PF_DPSRAM_AHB_AXI_0_A_DOUT23to23;
wire   [24:24] PF_DPSRAM_AHB_AXI_0_A_DOUT24to24;
wire   [25:25] PF_DPSRAM_AHB_AXI_0_A_DOUT25to25;
wire   [26:26] PF_DPSRAM_AHB_AXI_0_A_DOUT26to26;
wire   [27:27] PF_DPSRAM_AHB_AXI_0_A_DOUT27to27;
wire   [30:30] PF_DPSRAM_AHB_AXI_0_A_DOUT30to30;
wire   [31:31] PF_DPSRAM_AHB_AXI_0_A_DOUT31to31;
wire   [32:32] PF_DPSRAM_AHB_AXI_0_A_DOUT32to32;
wire   [33:33] PF_DPSRAM_AHB_AXI_0_A_DOUT33to33;
wire   [34:34] PF_DPSRAM_AHB_AXI_0_A_DOUT34to34;
wire   [35:35] PF_DPSRAM_AHB_AXI_0_A_DOUT35to35;
wire   [36:36] PF_DPSRAM_AHB_AXI_0_A_DOUT36to36;
wire   [37:37] PF_DPSRAM_AHB_AXI_0_A_DOUT37to37;
wire   [31:0]  AHBSlaveInterface_HRDATA_net_0;
wire           AHBSlaveInterface_HREADYOUT_net_0;
wire   [1:0]   AHBSlaveInterface_HRESP_net_0;
wire   [0:0]   B_DOUT_net_1;
wire   [10:10] B_DOUT_9_net_0;
wire   [11:11] B_DOUT_10_net_0;
wire   [12:12] B_DOUT_11_net_0;
wire   [13:13] B_DOUT_12_net_0;
wire   [14:14] B_DOUT_13_net_0;
wire   [15:15] B_DOUT_14_net_0;
wire   [16:16] B_DOUT_15_net_0;
wire   [17:17] B_DOUT_16_net_0;
wire   [18:18] B_DOUT_17_net_0;
wire   [19:19] B_DOUT_18_net_0;
wire   [1:1]   B_DOUT_0_net_0;
wire   [20:20] B_DOUT_19_net_0;
wire   [21:21] B_DOUT_20_net_0;
wire   [22:22] B_DOUT_21_net_0;
wire   [23:23] B_DOUT_22_net_0;
wire   [24:24] B_DOUT_23_net_0;
wire   [25:25] B_DOUT_24_net_0;
wire   [26:26] B_DOUT_25_net_0;
wire   [27:27] B_DOUT_26_net_0;
wire   [28:28] B_DOUT_27_net_0;
wire   [29:29] B_DOUT_28_net_0;
wire   [2:2]   B_DOUT_1_net_0;
wire   [30:30] B_DOUT_29_net_0;
wire   [31:31] B_DOUT_30_net_0;
wire   [3:3]   B_DOUT_2_net_0;
wire   [4:4]   B_DOUT_3_net_0;
wire   [5:5]   B_DOUT_4_net_0;
wire   [6:6]   B_DOUT_5_net_0;
wire   [7:7]   B_DOUT_6_net_0;
wire   [8:8]   B_DOUT_7_net_0;
wire   [9:9]   B_DOUT_8_net_0;
wire   [10:10] mem_addr_slice_0;
wire   [11:11] mem_addr_slice_1;
wire   [18:18] A_DOUT_slice_0;
wire   [19:19] A_DOUT_slice_1;
wire   [28:28] A_DOUT_slice_2;
wire   [29:29] A_DOUT_slice_3;
wire   [38:38] A_DOUT_slice_4;
wire   [39:39] A_DOUT_slice_5;
wire   [8:8]   A_DOUT_slice_6;
wire   [9:9]   A_DOUT_slice_7;
wire   [18:18] B_DOUT_slice_0;
wire   [19:19] B_DOUT_slice_1;
wire   [28:28] B_DOUT_slice_2;
wire   [29:29] B_DOUT_slice_3;
wire   [38:38] B_DOUT_slice_4;
wire   [39:39] B_DOUT_slice_5;
wire   [8:8]   B_DOUT_slice_6;
wire   [9:9]   B_DOUT_slice_7;
wire   [31:0]  B_DIN;
wire   [31:0]  mem_rdata_net_0;
wire   [39:0]  A_DIN_net_0;
wire   [9:0]   A_ADDR_net_0;
wire   [39:0]  B_DIN_net_0;
wire   [9:0]   B_ADDR_net_0;
wire   [39:0]  A_DOUT_net_0;
wire   [39:0]  B_DOUT_net_2;
wire   [3:0]   A_WBYTE_EN_net_0;
wire   [3:0]   B_WBYTE_EN_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net     = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign AHBSlaveInterface_HRDATA_net_0    = AHBSlaveInterface_HRDATA;
assign HRDATA[31:0]                      = AHBSlaveInterface_HRDATA_net_0;
assign AHBSlaveInterface_HREADYOUT_net_0 = AHBSlaveInterface_HREADYOUT;
assign HREADYOUT                         = AHBSlaveInterface_HREADYOUT_net_0;
assign AHBSlaveInterface_HRESP_net_0     = AHBSlaveInterface_HRESP;
assign HRESP[1:0]                        = AHBSlaveInterface_HRESP_net_0;
assign B_DOUT_net_1[0]                   = B_DOUT_net_0[0];
assign B_DOUT[0:0]                       = B_DOUT_net_1[0];
assign B_DOUT_9_net_0[10]                = B_DOUT_9[12];
assign B_DOUT[10:10]                     = B_DOUT_9_net_0[10];
assign B_DOUT_10_net_0[11]               = B_DOUT_10[13];
assign B_DOUT[11:11]                     = B_DOUT_10_net_0[11];
assign B_DOUT_11_net_0[12]               = B_DOUT_11[14];
assign B_DOUT[12:12]                     = B_DOUT_11_net_0[12];
assign B_DOUT_12_net_0[13]               = B_DOUT_12[15];
assign B_DOUT[13:13]                     = B_DOUT_12_net_0[13];
assign B_DOUT_13_net_0[14]               = B_DOUT_13[16];
assign B_DOUT[14:14]                     = B_DOUT_13_net_0[14];
assign B_DOUT_14_net_0[15]               = B_DOUT_14[17];
assign B_DOUT[15:15]                     = B_DOUT_14_net_0[15];
assign B_DOUT_15_net_0[16]               = B_DOUT_15[20];
assign B_DOUT[16:16]                     = B_DOUT_15_net_0[16];
assign B_DOUT_16_net_0[17]               = B_DOUT_16[21];
assign B_DOUT[17:17]                     = B_DOUT_16_net_0[17];
assign B_DOUT_17_net_0[18]               = B_DOUT_17[22];
assign B_DOUT[18:18]                     = B_DOUT_17_net_0[18];
assign B_DOUT_18_net_0[19]               = B_DOUT_18[23];
assign B_DOUT[19:19]                     = B_DOUT_18_net_0[19];
assign B_DOUT_0_net_0[1]                 = B_DOUT_0[1];
assign B_DOUT[1:1]                       = B_DOUT_0_net_0[1];
assign B_DOUT_19_net_0[20]               = B_DOUT_19[24];
assign B_DOUT[20:20]                     = B_DOUT_19_net_0[20];
assign B_DOUT_20_net_0[21]               = B_DOUT_20[25];
assign B_DOUT[21:21]                     = B_DOUT_20_net_0[21];
assign B_DOUT_21_net_0[22]               = B_DOUT_21[26];
assign B_DOUT[22:22]                     = B_DOUT_21_net_0[22];
assign B_DOUT_22_net_0[23]               = B_DOUT_22[27];
assign B_DOUT[23:23]                     = B_DOUT_22_net_0[23];
assign B_DOUT_23_net_0[24]               = B_DOUT_23[30];
assign B_DOUT[24:24]                     = B_DOUT_23_net_0[24];
assign B_DOUT_24_net_0[25]               = B_DOUT_24[31];
assign B_DOUT[25:25]                     = B_DOUT_24_net_0[25];
assign B_DOUT_25_net_0[26]               = B_DOUT_25[32];
assign B_DOUT[26:26]                     = B_DOUT_25_net_0[26];
assign B_DOUT_26_net_0[27]               = B_DOUT_26[33];
assign B_DOUT[27:27]                     = B_DOUT_26_net_0[27];
assign B_DOUT_27_net_0[28]               = B_DOUT_27[34];
assign B_DOUT[28:28]                     = B_DOUT_27_net_0[28];
assign B_DOUT_28_net_0[29]               = B_DOUT_28[35];
assign B_DOUT[29:29]                     = B_DOUT_28_net_0[29];
assign B_DOUT_1_net_0[2]                 = B_DOUT_1[2];
assign B_DOUT[2:2]                       = B_DOUT_1_net_0[2];
assign B_DOUT_29_net_0[30]               = B_DOUT_29[36];
assign B_DOUT[30:30]                     = B_DOUT_29_net_0[30];
assign B_DOUT_30_net_0[31]               = B_DOUT_30[37];
assign B_DOUT[31:31]                     = B_DOUT_30_net_0[31];
assign B_DOUT_2_net_0[3]                 = B_DOUT_2[3];
assign B_DOUT[3:3]                       = B_DOUT_2_net_0[3];
assign B_DOUT_3_net_0[4]                 = B_DOUT_3[4];
assign B_DOUT[4:4]                       = B_DOUT_3_net_0[4];
assign B_DOUT_4_net_0[5]                 = B_DOUT_4[5];
assign B_DOUT[5:5]                       = B_DOUT_4_net_0[5];
assign B_DOUT_5_net_0[6]                 = B_DOUT_5[6];
assign B_DOUT[6:6]                       = B_DOUT_5_net_0[6];
assign B_DOUT_6_net_0[7]                 = B_DOUT_6[7];
assign B_DOUT[7:7]                       = B_DOUT_6_net_0[7];
assign B_DOUT_7_net_0[8]                 = B_DOUT_7[10];
assign B_DOUT[8:8]                       = B_DOUT_7_net_0[8];
assign B_DOUT_8_net_0[9]                 = B_DOUT_8[11];
assign B_DOUT[9:9]                       = B_DOUT_8_net_0[9];
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign B_DIN_slice_0[0]                      = B_DIN[0:0];
assign B_DIN_slice_1[1]                      = B_DIN[1:1];
assign B_DIN_slice_2[2]                      = B_DIN[2:2];
assign B_DIN_slice_3[3]                      = B_DIN[3:3];
assign B_DIN_slice_4[4]                      = B_DIN[4:4];
assign B_DIN_slice_5[5]                      = B_DIN[5:5];
assign B_DIN_slice_6[6]                      = B_DIN[6:6];
assign B_DIN_slice_7[7]                      = B_DIN[7:7];
assign B_DIN_slice_8[8]                      = B_DIN[8:8];
assign B_DIN_slice_9[9]                      = B_DIN[9:9];
assign B_DIN_slice_10[10]                    = B_DIN[10:10];
assign B_DIN_slice_11[11]                    = B_DIN[11:11];
assign B_DIN_slice_12[12]                    = B_DIN[12:12];
assign B_DIN_slice_13[13]                    = B_DIN[13:13];
assign B_DIN_slice_14[14]                    = B_DIN[14:14];
assign B_DIN_slice_15[15]                    = B_DIN[15:15];
assign B_DIN_slice_16[16]                    = B_DIN[16:16];
assign B_DIN_slice_17[17]                    = B_DIN[17:17];
assign B_DIN_slice_18[18]                    = B_DIN[18:18];
assign B_DIN_slice_19[19]                    = B_DIN[19:19];
assign B_DIN_slice_20[20]                    = B_DIN[20:20];
assign B_DIN_slice_21[21]                    = B_DIN[21:21];
assign B_DIN_slice_22[22]                    = B_DIN[22:22];
assign B_DIN_slice_23[23]                    = B_DIN[23:23];
assign B_DIN_slice_24[24]                    = B_DIN[24:24];
assign B_DIN_slice_25[25]                    = B_DIN[25:25];
assign B_DIN_slice_26[26]                    = B_DIN[26:26];
assign B_DIN_slice_27[27]                    = B_DIN[27:27];
assign B_DIN_slice_28[28]                    = B_DIN[28:28];
assign B_DIN_slice_29[29]                    = B_DIN[29:29];
assign B_DIN_slice_30[30]                    = B_DIN[30:30];
assign B_DIN_slice_31[31]                    = B_DIN[31:31];
assign B_DOUT_net_0[0]                       = B_DOUT_net_2[0:0];
assign B_DOUT_0[1]                           = B_DOUT_net_2[1:1];
assign B_DOUT_1[2]                           = B_DOUT_net_2[2:2];
assign B_DOUT_2[3]                           = B_DOUT_net_2[3:3];
assign B_DOUT_3[4]                           = B_DOUT_net_2[4:4];
assign B_DOUT_4[5]                           = B_DOUT_net_2[5:5];
assign B_DOUT_5[6]                           = B_DOUT_net_2[6:6];
assign B_DOUT_6[7]                           = B_DOUT_net_2[7:7];
assign B_DOUT_7[10]                          = B_DOUT_net_2[10:10];
assign B_DOUT_8[11]                          = B_DOUT_net_2[11:11];
assign B_DOUT_9[12]                          = B_DOUT_net_2[12:12];
assign B_DOUT_10[13]                         = B_DOUT_net_2[13:13];
assign B_DOUT_11[14]                         = B_DOUT_net_2[14:14];
assign B_DOUT_12[15]                         = B_DOUT_net_2[15:15];
assign B_DOUT_13[16]                         = B_DOUT_net_2[16:16];
assign B_DOUT_14[17]                         = B_DOUT_net_2[17:17];
assign B_DOUT_15[20]                         = B_DOUT_net_2[20:20];
assign B_DOUT_16[21]                         = B_DOUT_net_2[21:21];
assign B_DOUT_17[22]                         = B_DOUT_net_2[22:22];
assign B_DOUT_18[23]                         = B_DOUT_net_2[23:23];
assign B_DOUT_19[24]                         = B_DOUT_net_2[24:24];
assign B_DOUT_20[25]                         = B_DOUT_net_2[25:25];
assign B_DOUT_21[26]                         = B_DOUT_net_2[26:26];
assign B_DOUT_22[27]                         = B_DOUT_net_2[27:27];
assign B_DOUT_23[30]                         = B_DOUT_net_2[30:30];
assign B_DOUT_24[31]                         = B_DOUT_net_2[31:31];
assign B_DOUT_25[32]                         = B_DOUT_net_2[32:32];
assign B_DOUT_26[33]                         = B_DOUT_net_2[33:33];
assign B_DOUT_27[34]                         = B_DOUT_net_2[34:34];
assign B_DOUT_28[35]                         = B_DOUT_net_2[35:35];
assign B_DOUT_29[36]                         = B_DOUT_net_2[36:36];
assign B_DOUT_30[37]                         = B_DOUT_net_2[37:37];
assign COREAHBLSRAM_PF_0_mem_addr0to0[0]     = mem_addr[0:0];
assign COREAHBLSRAM_PF_0_mem_addr1to1[1]     = mem_addr[1:1];
assign COREAHBLSRAM_PF_0_mem_addr2to2[2]     = mem_addr[2:2];
assign COREAHBLSRAM_PF_0_mem_addr3to3[3]     = mem_addr[3:3];
assign COREAHBLSRAM_PF_0_mem_addr4to4[4]     = mem_addr[4:4];
assign COREAHBLSRAM_PF_0_mem_addr5to5[5]     = mem_addr[5:5];
assign COREAHBLSRAM_PF_0_mem_addr6to6[6]     = mem_addr[6:6];
assign COREAHBLSRAM_PF_0_mem_addr7to7[7]     = mem_addr[7:7];
assign COREAHBLSRAM_PF_0_mem_addr8to8[8]     = mem_addr[8:8];
assign COREAHBLSRAM_PF_0_mem_addr9to9[9]     = mem_addr[9:9];
assign COREAHBLSRAM_PF_0_mem_byteen0to0[0]   = mem_byteen[0:0];
assign COREAHBLSRAM_PF_0_mem_byteen1to1[1]   = mem_byteen[1:1];
assign COREAHBLSRAM_PF_0_mem_byteen2to2[2]   = mem_byteen[2:2];
assign COREAHBLSRAM_PF_0_mem_byteen3to3[3]   = mem_byteen[3:3];
assign COREAHBLSRAM_PF_0_mem_wdata0to0[0]    = mem_wdata[0:0];
assign COREAHBLSRAM_PF_0_mem_wdata1to1[1]    = mem_wdata[1:1];
assign COREAHBLSRAM_PF_0_mem_wdata2to2[2]    = mem_wdata[2:2];
assign COREAHBLSRAM_PF_0_mem_wdata3to3[3]    = mem_wdata[3:3];
assign COREAHBLSRAM_PF_0_mem_wdata4to4[4]    = mem_wdata[4:4];
assign COREAHBLSRAM_PF_0_mem_wdata5to5[5]    = mem_wdata[5:5];
assign COREAHBLSRAM_PF_0_mem_wdata6to6[6]    = mem_wdata[6:6];
assign COREAHBLSRAM_PF_0_mem_wdata7to7[7]    = mem_wdata[7:7];
assign COREAHBLSRAM_PF_0_mem_wdata8to8[8]    = mem_wdata[8:8];
assign COREAHBLSRAM_PF_0_mem_wdata9to9[9]    = mem_wdata[9:9];
assign COREAHBLSRAM_PF_0_mem_wdata10to10[10] = mem_wdata[10:10];
assign COREAHBLSRAM_PF_0_mem_wdata11to11[11] = mem_wdata[11:11];
assign COREAHBLSRAM_PF_0_mem_wdata12to12[12] = mem_wdata[12:12];
assign COREAHBLSRAM_PF_0_mem_wdata13to13[13] = mem_wdata[13:13];
assign COREAHBLSRAM_PF_0_mem_wdata14to14[14] = mem_wdata[14:14];
assign COREAHBLSRAM_PF_0_mem_wdata15to15[15] = mem_wdata[15:15];
assign COREAHBLSRAM_PF_0_mem_wdata16to16[16] = mem_wdata[16:16];
assign COREAHBLSRAM_PF_0_mem_wdata17to17[17] = mem_wdata[17:17];
assign COREAHBLSRAM_PF_0_mem_wdata18to18[18] = mem_wdata[18:18];
assign COREAHBLSRAM_PF_0_mem_wdata19to19[19] = mem_wdata[19:19];
assign COREAHBLSRAM_PF_0_mem_wdata20to20[20] = mem_wdata[20:20];
assign COREAHBLSRAM_PF_0_mem_wdata21to21[21] = mem_wdata[21:21];
assign COREAHBLSRAM_PF_0_mem_wdata22to22[22] = mem_wdata[22:22];
assign COREAHBLSRAM_PF_0_mem_wdata23to23[23] = mem_wdata[23:23];
assign COREAHBLSRAM_PF_0_mem_wdata24to24[24] = mem_wdata[24:24];
assign COREAHBLSRAM_PF_0_mem_wdata25to25[25] = mem_wdata[25:25];
assign COREAHBLSRAM_PF_0_mem_wdata26to26[26] = mem_wdata[26:26];
assign COREAHBLSRAM_PF_0_mem_wdata27to27[27] = mem_wdata[27:27];
assign COREAHBLSRAM_PF_0_mem_wdata28to28[28] = mem_wdata[28:28];
assign COREAHBLSRAM_PF_0_mem_wdata29to29[29] = mem_wdata[29:29];
assign COREAHBLSRAM_PF_0_mem_wdata30to30[30] = mem_wdata[30:30];
assign COREAHBLSRAM_PF_0_mem_wdata31to31[31] = mem_wdata[31:31];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT0to0[0]     = A_DOUT_net_0[0:0];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT1to1[1]     = A_DOUT_net_0[1:1];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT2to2[2]     = A_DOUT_net_0[2:2];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT3to3[3]     = A_DOUT_net_0[3:3];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT4to4[4]     = A_DOUT_net_0[4:4];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT5to5[5]     = A_DOUT_net_0[5:5];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT6to6[6]     = A_DOUT_net_0[6:6];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT7to7[7]     = A_DOUT_net_0[7:7];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT10to10[10]  = A_DOUT_net_0[10:10];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT11to11[11]  = A_DOUT_net_0[11:11];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT12to12[12]  = A_DOUT_net_0[12:12];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT13to13[13]  = A_DOUT_net_0[13:13];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT14to14[14]  = A_DOUT_net_0[14:14];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT15to15[15]  = A_DOUT_net_0[15:15];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT16to16[16]  = A_DOUT_net_0[16:16];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT17to17[17]  = A_DOUT_net_0[17:17];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT20to20[20]  = A_DOUT_net_0[20:20];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT21to21[21]  = A_DOUT_net_0[21:21];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT22to22[22]  = A_DOUT_net_0[22:22];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT23to23[23]  = A_DOUT_net_0[23:23];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT24to24[24]  = A_DOUT_net_0[24:24];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT25to25[25]  = A_DOUT_net_0[25:25];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT26to26[26]  = A_DOUT_net_0[26:26];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT27to27[27]  = A_DOUT_net_0[27:27];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT30to30[30]  = A_DOUT_net_0[30:30];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT31to31[31]  = A_DOUT_net_0[31:31];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT32to32[32]  = A_DOUT_net_0[32:32];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT33to33[33]  = A_DOUT_net_0[33:33];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT34to34[34]  = A_DOUT_net_0[34:34];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT35to35[35]  = A_DOUT_net_0[35:35];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT36to36[36]  = A_DOUT_net_0[36:36];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT37to37[37]  = A_DOUT_net_0[37:37];
assign mem_addr_slice_0[10]                  = mem_addr[10:10];
assign mem_addr_slice_1[11]                  = mem_addr[11:11];
assign A_DOUT_slice_0[18]                    = A_DOUT_net_0[18:18];
assign A_DOUT_slice_1[19]                    = A_DOUT_net_0[19:19];
assign A_DOUT_slice_2[28]                    = A_DOUT_net_0[28:28];
assign A_DOUT_slice_3[29]                    = A_DOUT_net_0[29:29];
assign A_DOUT_slice_4[38]                    = A_DOUT_net_0[38:38];
assign A_DOUT_slice_5[39]                    = A_DOUT_net_0[39:39];
assign A_DOUT_slice_6[8]                     = A_DOUT_net_0[8:8];
assign A_DOUT_slice_7[9]                     = A_DOUT_net_0[9:9];
assign B_DOUT_slice_0[18]                    = B_DOUT_net_2[18:18];
assign B_DOUT_slice_1[19]                    = B_DOUT_net_2[19:19];
assign B_DOUT_slice_2[28]                    = B_DOUT_net_2[28:28];
assign B_DOUT_slice_3[29]                    = B_DOUT_net_2[29:29];
assign B_DOUT_slice_4[38]                    = B_DOUT_net_2[38:38];
assign B_DOUT_slice_5[39]                    = B_DOUT_net_2[39:39];
assign B_DOUT_slice_6[8]                     = B_DOUT_net_2[8:8];
assign B_DOUT_slice_7[9]                     = B_DOUT_net_2[9:9];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign mem_rdata_net_0  = { PF_DPSRAM_AHB_AXI_0_A_DOUT37to37[37] , PF_DPSRAM_AHB_AXI_0_A_DOUT36to36[36] , PF_DPSRAM_AHB_AXI_0_A_DOUT35to35[35] , PF_DPSRAM_AHB_AXI_0_A_DOUT34to34[34] , PF_DPSRAM_AHB_AXI_0_A_DOUT33to33[33] , PF_DPSRAM_AHB_AXI_0_A_DOUT32to32[32] , PF_DPSRAM_AHB_AXI_0_A_DOUT31to31[31] , PF_DPSRAM_AHB_AXI_0_A_DOUT30to30[30] , PF_DPSRAM_AHB_AXI_0_A_DOUT27to27[27] , PF_DPSRAM_AHB_AXI_0_A_DOUT26to26[26] , PF_DPSRAM_AHB_AXI_0_A_DOUT25to25[25] , PF_DPSRAM_AHB_AXI_0_A_DOUT24to24[24] , PF_DPSRAM_AHB_AXI_0_A_DOUT23to23[23] , PF_DPSRAM_AHB_AXI_0_A_DOUT22to22[22] , PF_DPSRAM_AHB_AXI_0_A_DOUT21to21[21] , PF_DPSRAM_AHB_AXI_0_A_DOUT20to20[20] , PF_DPSRAM_AHB_AXI_0_A_DOUT17to17[17] , PF_DPSRAM_AHB_AXI_0_A_DOUT16to16[16] , PF_DPSRAM_AHB_AXI_0_A_DOUT15to15[15] , PF_DPSRAM_AHB_AXI_0_A_DOUT14to14[14] , PF_DPSRAM_AHB_AXI_0_A_DOUT13to13[13] , PF_DPSRAM_AHB_AXI_0_A_DOUT12to12[12] , PF_DPSRAM_AHB_AXI_0_A_DOUT11to11[11] , PF_DPSRAM_AHB_AXI_0_A_DOUT10to10[10] , PF_DPSRAM_AHB_AXI_0_A_DOUT7to7[7] , PF_DPSRAM_AHB_AXI_0_A_DOUT6to6[6] , PF_DPSRAM_AHB_AXI_0_A_DOUT5to5[5] , PF_DPSRAM_AHB_AXI_0_A_DOUT4to4[4] , PF_DPSRAM_AHB_AXI_0_A_DOUT3to3[3] , PF_DPSRAM_AHB_AXI_0_A_DOUT2to2[2] , PF_DPSRAM_AHB_AXI_0_A_DOUT1to1[1] , PF_DPSRAM_AHB_AXI_0_A_DOUT0to0[0] };
assign A_DIN_net_0      = { 1'b0 , 1'b0 , COREAHBLSRAM_PF_0_mem_wdata31to31[31] , COREAHBLSRAM_PF_0_mem_wdata30to30[30] , COREAHBLSRAM_PF_0_mem_wdata29to29[29] , COREAHBLSRAM_PF_0_mem_wdata28to28[28] , COREAHBLSRAM_PF_0_mem_wdata27to27[27] , COREAHBLSRAM_PF_0_mem_wdata26to26[26] , COREAHBLSRAM_PF_0_mem_wdata25to25[25] , COREAHBLSRAM_PF_0_mem_wdata24to24[24] , 1'b0 , 1'b0 , COREAHBLSRAM_PF_0_mem_wdata23to23[23] , COREAHBLSRAM_PF_0_mem_wdata22to22[22] , COREAHBLSRAM_PF_0_mem_wdata21to21[21] , COREAHBLSRAM_PF_0_mem_wdata20to20[20] , COREAHBLSRAM_PF_0_mem_wdata19to19[19] , COREAHBLSRAM_PF_0_mem_wdata18to18[18] , COREAHBLSRAM_PF_0_mem_wdata17to17[17] , COREAHBLSRAM_PF_0_mem_wdata16to16[16] , 1'b0 , 1'b0 , COREAHBLSRAM_PF_0_mem_wdata15to15[15] , COREAHBLSRAM_PF_0_mem_wdata14to14[14] , COREAHBLSRAM_PF_0_mem_wdata13to13[13] , COREAHBLSRAM_PF_0_mem_wdata12to12[12] , COREAHBLSRAM_PF_0_mem_wdata11to11[11] , COREAHBLSRAM_PF_0_mem_wdata10to10[10] , COREAHBLSRAM_PF_0_mem_wdata9to9[9] , COREAHBLSRAM_PF_0_mem_wdata8to8[8] , 1'b0 , 1'b0 , COREAHBLSRAM_PF_0_mem_wdata7to7[7] , COREAHBLSRAM_PF_0_mem_wdata6to6[6] , COREAHBLSRAM_PF_0_mem_wdata5to5[5] , COREAHBLSRAM_PF_0_mem_wdata4to4[4] , COREAHBLSRAM_PF_0_mem_wdata3to3[3] , COREAHBLSRAM_PF_0_mem_wdata2to2[2] , COREAHBLSRAM_PF_0_mem_wdata1to1[1] , COREAHBLSRAM_PF_0_mem_wdata0to0[0] };
assign A_ADDR_net_0     = { COREAHBLSRAM_PF_0_mem_addr9to9[9] , COREAHBLSRAM_PF_0_mem_addr8to8[8] , COREAHBLSRAM_PF_0_mem_addr7to7[7] , COREAHBLSRAM_PF_0_mem_addr6to6[6] , COREAHBLSRAM_PF_0_mem_addr5to5[5] , COREAHBLSRAM_PF_0_mem_addr4to4[4] , COREAHBLSRAM_PF_0_mem_addr3to3[3] , COREAHBLSRAM_PF_0_mem_addr2to2[2] , COREAHBLSRAM_PF_0_mem_addr1to1[1] , COREAHBLSRAM_PF_0_mem_addr0to0[0] };
assign B_DIN_net_0      = { 1'b0 , 1'b0 , B_DIN_slice_31[31] , B_DIN_slice_30[30] , B_DIN_slice_29[29] , B_DIN_slice_28[28] , B_DIN_slice_27[27] , B_DIN_slice_26[26] , B_DIN_slice_25[25] , B_DIN_slice_24[24] , 1'b0 , 1'b0 , B_DIN_slice_23[23] , B_DIN_slice_22[22] , B_DIN_slice_21[21] , B_DIN_slice_20[20] , B_DIN_slice_19[19] , B_DIN_slice_18[18] , B_DIN_slice_17[17] , B_DIN_slice_16[16] , 1'b0 , 1'b0 , B_DIN_slice_15[15] , B_DIN_slice_14[14] , B_DIN_slice_13[13] , B_DIN_slice_12[12] , B_DIN_slice_11[11] , B_DIN_slice_10[10] , B_DIN_slice_9[9] , B_DIN_slice_8[8] , 1'b0 , 1'b0 , B_DIN_slice_7[7] , B_DIN_slice_6[6] , B_DIN_slice_5[5] , B_DIN_slice_4[4] , B_DIN_slice_3[3] , B_DIN_slice_2[2] , B_DIN_slice_1[1] , B_DIN_slice_0[0] };
assign B_ADDR_net_0     = { B_ADDR };
assign A_WBYTE_EN_net_0 = { COREAHBLSRAM_PF_0_mem_byteen3to3[3] , COREAHBLSRAM_PF_0_mem_byteen2to2[2] , COREAHBLSRAM_PF_0_mem_byteen1to1[1] , COREAHBLSRAM_PF_0_mem_byteen0to0[0] };
assign B_WBYTE_EN_net_0 = { B_WBYTE_EN };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------BC_TX_RAM_COREAHBLSRAM_PF_0_COREAHBLSRAM_PF   -   Actel:DirectCore:COREAHBLSRAM_PF:3.0.102
BC_TX_RAM_COREAHBLSRAM_PF_0_COREAHBLSRAM_PF #( 
        .AHB_TIMEOUT   ( 80 ),
        .ECC           ( 0 ),
        .FAMILY        ( 26 ),
        .HI_REL        ( 0 ),
        .MEM_DEPTH     ( 4096 ),
        .PIPE          ( 1 ),
        .SEL_SRAM_TYPE ( 0 ),
        .SYNC_RESET    ( 0 ) )
COREAHBLSRAM_PF_0(
        // Inputs
        .HCLK       ( HCLK ),
        .HRESETN    ( HRESETN ),
        .HSEL       ( HSEL ),
        .HREADYIN   ( HREADYIN ),
        .HSIZE      ( HSIZE ),
        .HTRANS     ( HTRANS ),
        .HBURST     ( HBURST ),
        .HADDR      ( HADDR ),
        .HWRITE     ( HWRITE ),
        .HWDATA     ( HWDATA ),
        .mem_rdata  ( mem_rdata_net_0 ),
        // Outputs
        .HREADYOUT  ( AHBSlaveInterface_HREADYOUT ),
        .HRDATA     ( AHBSlaveInterface_HRDATA ),
        .HRESP      ( AHBSlaveInterface_HRESP ),
        .mem_wen    ( COREAHBLSRAM_PF_0_mem_wen ),
        .mem_ren    ( COREAHBLSRAM_PF_0_mem_ren ),
        .mem_addr   ( mem_addr ),
        .mem_byteen ( mem_byteen ),
        .mem_wdata  ( mem_wdata ),
        .FAULT_DET  (  ) 
        );

//--------BC_TX_RAM_PF_DPSRAM_AHB_AXI_0_PF_DPSRAM   -   Actel:SgCore:PF_DPSRAM:1.1.110
BC_TX_RAM_PF_DPSRAM_AHB_AXI_0_PF_DPSRAM PF_DPSRAM_AHB_AXI_0(
        // Inputs
        .A_DIN      ( A_DIN_net_0 ),
        .A_ADDR     ( A_ADDR_net_0 ),
        .B_DIN      ( B_DIN_net_0 ),
        .B_ADDR     ( B_ADDR_net_0 ),
        .A_WBYTE_EN ( A_WBYTE_EN_net_0 ),
        .B_WBYTE_EN ( B_WBYTE_EN_net_0 ),
        .A_WEN      ( COREAHBLSRAM_PF_0_mem_wen ),
        .A_REN      ( COREAHBLSRAM_PF_0_mem_ren ),
        .B_WEN      ( B_WEN ),
        .B_BLK_EN   ( B_BLK_EN ),
        .B_REN      ( B_REN ),
        .A_CLK      ( HCLK ),
        .B_CLK      ( B_CLK ),
        // Outputs
        .A_DOUT     ( A_DOUT_net_0 ),
        .B_DOUT     ( B_DOUT_net_2 ) 
        );


endmodule
