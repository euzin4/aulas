module multp_pipeline(
	input [9:0] A,
	input [9:0] B,	
	input reset,
	input clk,
	output reg [19:0] S
);

reg [19:0] M;

always @(posedge clk)begin
	if(reset)begin
		s<=0;
		m<=0;
	end
	else begin
		M<=A*B;
		S<=M+S;
	end

end

endmodule
