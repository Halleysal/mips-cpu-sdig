`timescale 1ns/10ps
module pc_TB;
	reg clk;
	reg reset;
	wire [9:0] count;
	
pc DUT (
	.clk(clk),
	.reset(reset),
	.count(count)
);

initial begin
	clk = 0;
	reset = 1;
	#15 reset = 0;
	#400 reset = 1;
	end
	
	always	#10 clk = ~clk;
		
initial
#900 $stop;
endmodule 