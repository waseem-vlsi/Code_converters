`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU
// Engineer: WASEEM
// 
// Create Date: 03.09.2025 02:02:58
// Design Name: CONVERTERS 
// Module Name: bcd_to_binary_conv
// 
//////////////////////////////////////////////////////////////////////////////////


module full_adder(
input a,b,c,
output sum,carry);

assign sum = a^b^c;
assign carry = a&b|b&c|c&a;

endmodule

module RCA(
input [3:0]A,B,
input Cin,
output [3:0]SUM,
output CARRY);
wire w1,w2,w3;
full_adder A1( .a(A[0]), .b(B[0]), .c(Cin), .sum(SUM[0]), .carry(w1));
full_adder A2( .a(A[1]), .b(B[1]), .c(w1), .sum(SUM[1]), .carry(w2));
full_adder A3( .a(A[2]), .b(B[2]), .c(w2), .sum(SUM[2]), .carry(w3));
full_adder A4( .a(A[3]), .b(B[3]), .c(w3), .sum(SUM[3]), .carry(CARRY));
endmodule
module bcd_to_binary_conv(
input [7:0]X,
output [7:0]Y);
wire w4,w5,w6,w7,w8;
assign Y[0] = X[0];
RCA R1( .A({X[5], X[3], X[2], X[1]}), .B({1'b0, X[4], X[5], X[4]}), .Cin(1'b0), .SUM({w4,w5,w7,w8}), .CARRY(w6));
RCA R2( .A({1'b0, w6, w4, w5}), .B({X[7], X[6], X[7], X[6]}), .Cin(1'b0), .SUM({Y[6],Y[5],Y[4],Y[3]}), .CARRY(Y[7]));
assign  Y[2] = w7;
assign  Y[1] = w8;
endmodule
