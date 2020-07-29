module instructionmemory_TB;

reg clk;
reg[9:0] addr;
wire [31:0] q;

instructionmemory DUT(
	.clk(clk),
	.addr(addr),
	.q(q)
);

initial begin
	clk = 0;
	addr = 0;
end

initial
	#1800 $stop;

initial begin
		#10;
		forever begin
			#40 $display("PC = %d        InstructionOut = %b", addr, q);
			#40 addr = addr +1;
		end
end


always begin
	#20 clk = ~clk;
end

endmodule