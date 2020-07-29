`timescale 1ns/10ps

module Register_TB;
reg clk;
reg [31:0] in;
wire [31:0] out;

Register DUT(
.clk(clk),
.in(in),
.out(out)
);

initial begin
	clk = 0;
	in = 0;
end

always begin
	#10 clk = ~clk;
	in = in + 10;
end

initial #300 $stop;

endmodule
