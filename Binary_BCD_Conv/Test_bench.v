module BCD_tb( );
reg [9:0]in;
wire [9:0]out;
 Adder_3 DUT(.in(in), .out(out));
 initial
 begin 
 in = 10'b0011111111;
 #10 in = 10'b0011001111;
 #10 in = 10'b0011111000;
 #10 in = 10'b0011111100;
 #10 $finish;
 end
endmodule
