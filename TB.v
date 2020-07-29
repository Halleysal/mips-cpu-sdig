`timescale 1ns/100ps

module TB;

reg clock, clockM;
reg reset;
reg [31:0] Data_BUS_READ;

wire [31:0] Data_BUS_WRITE;
wire [9:0] ADDR;
wire we, cs;


cpu DUT(
.clock(clock),
.clockM(clockM),
.reset(reset),
.Data_BUS_READ(Data_BUS_READ),
.ADDR(ADDR), 
.Data_BUS_WRITE(Data_BUS_WRITE),
.we(we),
.cs(cs)
);

initial begin
clock = 0;
clockM = 0;
reset = 1;
#32.5 reset = 0;
Data_BUS_READ = 0;

	forever begin
		#130 
		$display("we = %b cs = %b",we, cs);
		$display("ADDR = %b ", ADDR);
		$display("Data  = %d", Data_BUS_WRITE);
		$display("");
	end

end

always begin
 #65 clock = ~clock; //Aproximadamente 7.65 MHz 
end

always begin
 #2.6 clockM = ~clockM; //Aproximadamente 191.39 MHz
end

initial 
	#3120 $stop;

endmodule
