module cpu(
	clock, 
	clockM,
	reset,
	Data_BUS_READ,
	ADDR,
	Data_BUS_WRITE,
	we,
	cs,
);

input clock, reset, clockM;
input [31:0] Data_BUS_READ;
//output systemClock, multiplierClocklockedPLL,
output we, cs;
output [9:0] ADDR;
output [31:0] Data_BUS_WRITE;

assign wSystemClk = clock;
assign wMultiplierClk = clockM;

wire [31:0] wDataIn;
wire [31:0] wPLL;
wire [9:0] pCounter;
wire [31:0] inst;
wire [31:0] control;
wire [31:0] ctrl1;
wire [31:0] ctrl2;
wire [31:0] ctrl3;
wire [31:0] wA;
wire [31:0] wB;
wire [31:0] wIMM;
wire [31:0] outIMM;
wire [31:0] outMuxA;
wire [31:0] wD;
wire [31:0] outD;
wire [31:0] outD1;
wire [31:0] outB;
wire [31:0] M;
wire [31:0] outRB;
wire idle, done;
wire [31:0] outMulti;
wire [31:0] wAlu;
wire csDecode;
wire [31:0] outDecode;

//PLL PLL1(
//	.areset (reset),
//	.inclk0 (clock),
//	.c0 (wSystemClk),
//	.c1 (wMultiplierClk),
//	.locked (wPLL)
//);

pc ProgramCouter(wSystemClk, reset, pCounter);
instructionmemory IntructionMemory(wSystemClk, pCounter, inst);

control Control(inst, control);
registerfile RegisterFile(wSystemClk, reset, outRB, control[14:11], control[9:6], ctrl3[4:1], wA, wB);
extend Extend(inst[15:0], wIMM);
Register IMM(wSystemClk, wIMM, outIMM);
Register CTRL1(wSystemClk, control, ctrl1);

mux MuxA(outIMM, wB, ctrl1[20], outMuxA);
alu ALU(wA, outMuxA, ctrl1[17:16], wAlu);
Multiplicador multiplicador(idle, done, ctrl1[18], wMultiplierClk, outMulti, wA[15:0], wB[15:0]);
mux muxM (outMulti, wAlu, ctrl1[18], wD);
Register regB(wSystemClk, wB, outB);
Register regD(wSystemClk, wD, outD);
Register CTRL2(wSystemClk, ctrl1, ctrl2);

datamemory DataMemory(wSystemClk, ctrl2[21], ctrl2[0], outB, outD[9:0], M);
Register regD2(wSystemClk, outD, outD1);
Register CTRL3(wSystemClk, ctrl2, ctrl3);

ADDRDecoding ADDRDecode(outD1[15:0], csDecode);
mux dataRD(M, Data_BUS_READ, csDecode, outDecode);
mux WriteBack(outDecode, outD1, ctrl3[19], outRB); 

assign we = ctrl1[21];
assign cs = ctrl1[0];
assign ADDR = outD[9:0];
assign Data_BUS_WRITE = outB; 

endmodule








