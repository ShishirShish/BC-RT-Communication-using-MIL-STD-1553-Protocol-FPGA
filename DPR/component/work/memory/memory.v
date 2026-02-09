//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun Feb  8 11:10:34 2026
// Version: 2025.2 2025.2.0.14
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// memory
module memory(
    // Inputs
    A_ADDR,
    A_DIN,
    A_WEN,
    B_ADDR,
    B_DIN,
    B_WEN,
    CLK,
    // Outputs
    A_DOUT,
    B_DOUT
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [4:0]  A_ADDR;
input  [15:0] A_DIN;
input         A_WEN;
input  [4:0]  B_ADDR;
input  [15:0] B_DIN;
input         B_WEN;
input         CLK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [15:0] A_DOUT;
output [15:0] B_DOUT;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [4:0]  A_ADDR;
wire   [15:0] A_DIN;
wire   [15:0] A_DOUT_net_0;
wire          A_WEN;
wire   [4:0]  B_ADDR;
wire   [15:0] B_DIN;
wire   [15:0] B_DOUT_net_0;
wire          B_WEN;
wire          CLK;
wire   [15:0] A_DOUT_net_1;
wire   [15:0] B_DOUT_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign A_DOUT_net_1 = A_DOUT_net_0;
assign A_DOUT[15:0] = A_DOUT_net_1;
assign B_DOUT_net_1 = B_DOUT_net_0;
assign B_DOUT[15:0] = B_DOUT_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------dual_port_memory
dual_port_memory dual_port_memory_0(
        // Inputs
        .CLK    ( CLK ),
        .A_WEN  ( A_WEN ),
        .B_WEN  ( B_WEN ),
        .A_ADDR ( A_ADDR ),
        .A_DIN  ( A_DIN ),
        .B_ADDR ( B_ADDR ),
        .B_DIN  ( B_DIN ),
        // Outputs
        .A_DOUT ( A_DOUT_net_0 ),
        .B_DOUT ( B_DOUT_net_0 ) 
        );


endmodule
