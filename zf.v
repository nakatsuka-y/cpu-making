module zf(zf_in,zf_out,clk,rst);
	input wire clk,rst;
	input wire zf_in;
	output reg zf_out;

	always @(posedge clk)begin
		if(!rst)begin
			zf_out <=0;
		end else begin
			zf_out <= zf_in;
		end
	end
endmodule
