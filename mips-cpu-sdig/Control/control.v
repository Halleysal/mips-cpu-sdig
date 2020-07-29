module control(
	input [31:0] inst,
	output [31:0]ctrl
);
	
	reg cs, wr, ctrl_muxA, ctrl_muxR, ctrl_muxM;
	reg [1:0] alu;
	reg [4:0] rs, rt, rd;
	reg [5:0] op, funct;
	
		always @(inst) begin
		
		op = inst[31:26];
		rs = inst[25:21];
		rt = inst[20:16];
		funct = inst[5:0];
		
		if(op == 18) begin	//Add, sub, mul, and e or 
			case(funct)
				6'd32: begin   		// add
						 alu = 2'b00;
						 ctrl_muxM = 0;
				end
				6'd34: begin   		// sub
						 alu = 2'b01;
						 ctrl_muxM = 0;
				end
				6'd36: begin   		// and
						 alu = 2'b10;
				       ctrl_muxM = 0;
				end
				6'd37: begin   		// or
				       alu = 2'b11;
						 ctrl_muxM = 0;
				end
				6'd50: begin   		// mul
						 ctrl_muxM = 1;
				end
			endcase
			
		ctrl_muxA = 0;
		ctrl_muxR = 0;
		rd = inst[15:11];
		wr = 0;
	 end
		
		if(op == 19) begin	//lw
			alu = 2'b00;
			ctrl_muxA = 1;
			ctrl_muxR = 1;
			ctrl_muxM = 0;
			cs = 1;
			wr = 0; 
			rd = rt; 
		end
		
		if(op == 20) begin	//sw
			alu = 2'b00;
			ctrl_muxA = 1;
			ctrl_muxR = 1;
			ctrl_muxM = 0;
			cs = 1;
			wr = 1; 
			rd = rt; 
		end
	end
	
	assign ctrl = {{10'b0}, {wr}, {ctrl_muxA}, {ctrl_muxR}, {ctrl_muxM}, {alu}, {rs}, {rt}, {rd}, {cs}};
	//					[31:22]	[21]		[20]			  [19]	 	   [18]    [17:16][15:11][10:6][5:1]  [0]			

endmodule
		
		
				