//pc.v
// we = write enable
module pc(pc_in,pc_out,we,clk,rst);
	input [7:0] pc_in;
	input we;
	input clk,rst;
	output reg [7:0] pc_out;

	always @(posedge clk) begin
		if(!rst) begin
			pc_out<=0;
		end else begin
			if(we)begin
				pc_out<=pc_in;
			end else begin
				pc_out<=pc_out + 1;
			end
		end
	end
endmodule
