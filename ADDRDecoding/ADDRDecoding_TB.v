module ADDRDecoding_TB;

reg [15:0] adress;
wire muxC;

ADDRDecoding DUT(
	.adress(adress),
	.muxC(muxC)
);

initial begin
	adress = 16'h0000;
	
	$display("muxC = %b", muxC);
	
	#500
	
	adress = 16'hF003;
	
	$display("muxC = %b", muxC);
	
	#500 
	
	adress = 16'hFA21;
	
	$display("muxC = %b", muxC);

end

initial
	#1600 $stop;


endmodule