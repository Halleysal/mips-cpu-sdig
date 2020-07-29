module Control (Idle, Done, St, Load, Sh, Ad, Clk, K, M, rst);
input St, Clk;
input M, K;
output reg Idle, Done;
output reg Load, Sh, Ad;
output reg rst;


reg [1:0] estado_atual=0;
parameter S0=2'd0, S1=2'd1, S2=2'd2, S3=2'd3;

	always @(posedge Clk) begin
	
		case(estado_atual)
			S0: begin	
					if (St == 1) begin
						estado_atual = S1;
					end
					else begin
						estado_atual = S0;
					end
			end
			
			S1: begin
					if (M == 0)
					begin
						if (K == 0)
							estado_atual = S1;
						else
							estado_atual = S3;
					end
					else begin
						estado_atual = S2;
					end
			end
			S2: begin
					if (K == 0)
						estado_atual = S1;
					else
						estado_atual = S3;
			end
			S3: begin
					estado_atual = S0;
			end
		endcase
	end

	always @(Clk) begin
	
		case(estado_atual)
			S0: begin	
					if (St == 1)
					begin
						Done = 0;
						Load = 1;
						Ad = 0;
						Sh = 0;
						Idle = 0;
					end
					else begin
						Done = 0;
						Load = 0;
						Ad = 0;
						Sh = 0;
						Idle = 1;
					end
			end
			S1: begin
				Load = 0;
					if (M == 0)
					begin
						Sh = 1;
						Ad = 0;
					end
					else begin
						Ad = 1;
						Sh = 0;
					end
			end
			S2: begin
					Sh = 1;
					Ad = 0;
			end
			S3: begin
					Sh = 0;
					Ad = 0;
					Done = 1;
			end
		endcase
	end

endmodule
