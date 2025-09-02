module BCD_to_BINARY_Conv_tb( );
reg  [7:0]X;
wire [7:0]Y;
bcd_to_binary_conv DUT(.X(X), .Y(Y));
initial 
begin 
X = 8'b00011001;
# 10 X =  8'b00011000;
end 
endmodule
