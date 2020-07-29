`timescale 1ns/10ps

module registerfile_TB();

reg rst, clk;
reg [3:0] addr_a, addr_b, addr_wr;
reg [31:0] data;
wire [31:0] q_a, q_b;

integer i;

registerfile DUT(
.clk(clk),
.rst(rst),
.data(data),
.addr_a(addr_a),
.addr_b(addr_b),
.addr_wr(addr_wr),
.q_b(q_b),
.q_a(q_a)
);

initial begin
	clk=0;
	rst = 1;
	addr_wr = 0;
	addr_a = 0;
	addr_b = 1;
	data = 100;
	#10 rst = 0;

	for(i = 0; i <16; i = i +1) begin
		#40 $display("RF[%d]=%d", addr_wr, data);
		#40 addr_wr = addr_wr +1;
		#40 data = data+50;
	end

	for(i = 0; i <8; i = i +1) begin
		#40 $display("A=%d B=%d", q_a, q_b);
		#40 addr_a = addr_a +2;
		#40 addr_b = addr_b +2;
	end
	
end



always begin
	#20 clk = ~clk;
end

initial
	 #3000 $stop;

endmodule
