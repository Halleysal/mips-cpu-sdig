`timescale 1ns/10ps

module extend_TB;
 reg [15:0] in;
 wire [31:0] out;
 
 extend DUT (
 .in(in),
 .out(out)
 );
 
	initial begin
		#50
		in = 16'hF001;
		#10
		$display("In = %b        Out = %b", in, out);
		#50
		in = 16'h6231;
		#10
		$display("In = %b        Out = %b", in, out);
	end

	initial #200 $stop;	

endmodule
