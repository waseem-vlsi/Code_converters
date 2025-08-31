`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU
// Engineer: WASEEM
// 
// Create Date: .08.2025 16:42:39
// Design Name: BINARY TO BCD CONVERTER
// Module Name: Binary-BCD_conv

// 
//////////////////////////////////////////////////////////////////////////////////



module adder(
input a,b,c,
output p,g,sum); 
 assign g = a&b;
 assign p = a^b;
 assign sum = a^b^c; 
endmodule
module carry_gen(
input [3:0]p,g,
input cin,
output cout,P0,G0,
output c1,c2,c3,c4);
assign c1 = g[0]|(p[0]&cin), c2 = g[1]|(p[1]&g[0])|(p[1]&p[0]&cin) , c3 = g[2]| (p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin),  c4 = g[3]|(p[3]&g[2])| (p[3]&g[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);
assign P0 = p[3] & p[2] & p[1] & p[0], G0 = g[3] | (p[3] &g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]); 
assign cout = c4;
endmodule

module CLA_4bit(
input [3:0]a,b,
input cin,
output [3:0]sum,
output cout);
wire [3:0]p,g;
wire c1,c2,c3,c4,P0,G0;
adder A1(.a(a[0]), .b(b[0]), .sum(sum[0]),.p(p[0]), .g(g[0]), .c(cin));
adder A2(.a(a[1]), .b(b[1]), .sum(sum[1]),.p(p[1]), .g(g[1]), .c(c1));
adder A3(.a(a[2]), .b(b[2]), .sum(sum[2]),.p(p[2]), .g(g[2]), .c(c2));
adder A4(.a(a[3]), .b(b[3]), .sum(sum[3]),.p(p[3]), .g(g[3]),.c(c3));
carry_gen A5(.p(p), .g(g), .c1(c1), .c2(c2),.c3(c3), .c4(cout), .P0(P0), .G0(G0), .cin(cin));
endmodule

module mux(
input [3:0]a,b,
input sel,
output [3:0]out);
assign out=sel?b:a;
   endmodule 
 
   
   
  module Block_1(
  input A,B,C,D,
  output y1);
  wire w;
   assign w = B|C|D;
   assign y1 = A&w;
   endmodule
   
   module Binary_BCD(
   input [3:0]p,
   output [3:0]q);
   wire cin,y1,m,k2; 
   wire [3:0]a,k1;
   Block_1 A3(.A(p[2]), .B(p[0]), .C(p[1]), .D(p[3]),.y1(k2));
   CLA_4bit cla1(.a(4'b0011), .b(p), .sum(k1), .cin(1'b0),.cout(m) );
   mux mux1 ( .a(p), .b(k1), .sel(k2), .out(q));
   endmodule
   
     module Adder_3(
   input [9:0]in,
   output [9:0]out);
   wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28;
   //assign in[9:8] = 2'b00;
    Binary_BCD A1(.p({in[8], in[7], in[6], in[5]}), .q({w4,w3,w2,w1}));    // p[3]=in[8], p[2]=in[7], p[1]=in[6], p[0]=in[5]
    Binary_BCD A2(.p({w3, w2, w1, in[4]}), .q({w8,w7,w6,w5}));  // p[3]=W3, p[2]=W2, p[1]=W1, p[0]=in[4] 
    Binary_BCD A3(.p({w7, w6, w5, in[3]}), .q({w12,w11,w10,w9}));  // p[3]=W7, p[2]=W6, p[1]=W5, p[0]=in[3] 
    Binary_BCD A41(.p({w11, w10, w9, in[2]}), .q({w16,w15,w14,w13}));  // p[3]=W11, p[2]=W10, p[1]=W9, p[0]=in[2] 
    Binary_BCD A42(.p({in[9], w4, w8, w12}), .q({w20,w19,w18,w17}));  // p[3]=in[9], p[2]=W4, p[1]=W8, p[0]=W12 
    Binary_BCD A51(.p({w15, w14, w13, in[1]}), .q({w24,w23,w22,w21}));  // p[3]=W15, p[2]=W14, p[1]=W13, p[0]=in[1] 
    Binary_BCD A52(.p({w19, w18, w17, w16}), .q({w28,w27,w26,w25}));  // p[3]=W19, p[2]=W18, p[1]=W17, p[0]=W16 
    assign out = {w20,w28,w27,w26,w25,w24,w23,w22,w21,in[0]};

         endmodule 
  
  
