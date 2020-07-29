`timescale 1ns/10ps

module mux_TB();

	reg [31:0] a, b;
	reg s;
	wire [31:0] out;

	mux DUT(
	.a(a),
	.b(b),
	.s(s),
	.out(out)
	);

	initial begin
		 a <= 32'd100;
		 b <= 32'd50;
		 s <= 0;
		 #10
		 $display("A=%d B=%d S=%d  =>  Out=%d", a, b, s, out);
		 s <= 1;
		 #10 
		 $display("A=%d B=%d S=%d  =>  Out=%d", a, b, s, out);
		 a <= 32'd23;
		 #10 
		 $display("A=%d B=%d S=%d  =>  Out=%d", a, b, s, out);
		 b <= 32'd99;
		 #10
		 $display("A=%d B=%d S=%d  =>  Out=%d", a, b, s, out);
		 s <= 0;
		 #10
		 $display("A=%d B=%d S=%d  =>  Out=%d", a, b, s, out);
	end

	initial #60 $stop;

endmodule
