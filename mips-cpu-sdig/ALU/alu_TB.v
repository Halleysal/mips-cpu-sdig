`timescale 1ns/10ps

module alu_TB();

reg [31:0] a, b;
reg [1:0] s;
wire [31:0] out;

alu DUT(
	.a(a),
	.b(b),
	.s(s),
	.out(out)
);

	initial begin
		a = 3000;
		b = 2222;
		$display("A=%d  B=%d", a, b);
		s = 0;
		#10
		$display("S=%d  Out=%d", s, out);
		s = 1;
		#10
		$display("S=%d  Out=%d", s, out);
		s = 2;
		#10
		$display("S=%d  Out=%d", s, out);
		s = 3;
		#10
		$display("S=%d  Out=%d", s, out);

	end

	initial #100 $stop;

endmodule
