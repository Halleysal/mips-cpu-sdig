`timescale 1ns/10ps
module datamemory_TB;
	
	reg clk;
	reg [9:0] addr;
	wire [31:0] dataOut;
	reg [31:0] dataIn;
	reg cs;
	reg we;

datamemory DUT (
.clk(clk),
.addr(addr),
.dataOut(dataOut),
.dataIn(dataIn),
.cs(cs),
.we(we)
);

initial begin
	clk = 0;
	cs = 0;
	we=0;
	#10 cs = 1;
	we = 1;
	addr = 4;
	dataIn = 32'd999;
	#40 addr = 5;
	dataIn = 32'd100;
	#40 we = 0;
	addr = 0;
	
	forever begin
		#40 $display("Memoria[%d]=%d", addr, dataOut);	
		#40 addr = addr+1;
	end
end
	
always #20 clk = ~clk;
		
initial #600 $stop;
	
endmodule 