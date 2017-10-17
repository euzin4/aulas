module multp(
	input [9:0] A,
	input [9:0] B,	
	input reset,
	input clk,
	output reg [19:0] S
);

always @(posedge clk) begin
	if (reset)
		S<=0;
	else
		s<=A*B+s;
	end


endmodule
