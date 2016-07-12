//register.v
module register(src0,src1,we,dst,data0,data1,data,clk,rst);
	input [4:0] src0,src1,dst;
	input we,clk,rst;
	input [7:0] data;
	output wire [7:0] data0,data1;

	reg [7:0] regfile [0:31];

	wire [7:0] reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,DC,DR0,DR1,DR2,OP_TMP;

	always @(posedge clk) begin
		if(!rst) begin
			regfile[0]<=0;
			regfile[1]<=0;
			regfile[2]<=0;
			regfile[3]<=0;
			regfile[4]<=0;
			regfile[5]<=0;
			regfile[6]<=0;
			regfile[7]<=0;
			regfile[8]<=0;
			regfile[9]<=0;
			regfile[10]<=0;
			regfile[11]<=0;
			regfile[12]<=0;
			regfile[13]<=0;
			regfile[14]<=0;
			regfile[15]<=0;
			regfile[16]<=0;
			regfile[17]<=0;
			regfile[18]<=0;
			regfile[19]<=0;
			regfile[20]<=0;
			regfile[21]<=0;
			regfile[22]<=0;
			regfile[23]<=0;
			regfile[24]<=0;
			regfile[25]<=0;
			regfile[26]<=0;
			regfile[27]<=0;
			regfile[28]<=0;
			regfile[29]<=0;
			regfile[30]<=0;
			regfile[31]<=0;
		end else begin
			if (we) begin
				regfile[dst] <= data;
			end else begin
				regfile[dst] <= regfile[dst];
			end
		end
	end

	assign data0 = regfile[src0];
	assign data1 = regfile[src1];

	assign reg0=regfile[0];
	assign reg1=regfile[1];
	assign reg2=regfile[2];
	assign reg3=regfile[3];
	assign reg4=regfile[4];
	assign reg5=regfile[5];
	assign reg6=regfile[6];
	assign reg7=regfile[7];
	assign DC=regfile[17];
	assign DR1=regfile[18];
	assign DR2=regfile[19];
	assign DR3=regfile[20];
	assign TMP=regfile[21];
	assign OP_TMP=regfile[22];

endmodule
