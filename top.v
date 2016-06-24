//top.v
module top(clk,rst,mem8,mem9,mem10,mem11,mem12,mem13,mem14,mem15,mem16,mem17,mem18,mem19,mem20,mem21,mem22,mem23,mem24,mem25,mem26,mem27);
	input wire clk,rst;
	output wire [7:0] mem8,mem9,mem10,mem11,mem12,mem13,mem14,mem15,mem16,mem17,mem18,mem19,mem20,mem21,mem22,mem23,mem24,mem25,mem26,mem27;


	//selector
	wire [7:0] in00,in01,out0,in10,in11,out1;
	wire sel1,sel2;

//register
	wire [4:0] dst,src0,src1;
	wire [7:0] data1;
	wire reg_we;

//alu
	wire zf_in;
	wire [3:0] alu_op;

//zf
	wire zf_out;

//memory
	wire mem_we;

//pc
	wire [7:0] pc_in,pc_out;
	wire pc_we;

//imem
	wire [18:0] op;

//sel
sel s1(.a(in00),.b(in01),.sel(sel1),.c(out0));
sel s2(.a(in10),.b(in11),.sel(sel2),.c(out1));

//register
register r0(.src0(src0),.src1(src1),.we(reg_we),.dst(dst),.data0(in01),.data1(data1),.data(out1),.clk(clk),.rst(rst));

//alu
alu a0(.in0(out0),.in1(data1),.op(alu_op),.zf(zf_in),.out(in10));

//zf
zf z0(.zf_in(zf_in),.zf_out(zf_out),.clk(clk),.rst(rst));

//memory
memory m0(.din(in10),.dout(in11),.addr(data1),.we(mem_we),.clk(clk),.rst(rst),.mem8(mem8),.mem9(mem9),.mem10(mem10),.mem11(mem11),.mem12(mem12),.mem13(mem13),.mem14(mem14),.mem15(mem15),.mem16(mem16),.mem17(mem17),.mem18(mem18),.mem19(mem19),.mem20(mem20),.mem21(mem21),.mem22(mem22),.mem23(mem23),.mem24(mem24),.mem25(mem25),.mem26(mem26),.mem27(mem27));

//pc
pc p0(.pc_in(pc_in),.pc_out(pc_out),.we(pc_we),.clk(clk),.rst(rst));

//imem
imem i0(.pc(pc_out),.op(op));

//decoder
decoder d0(.op(op),.zf(zf_out),.pc_in(pc_in),.pc_we(pc_we),.dst(dst),.reg_we(reg_we),.src0(src0),.src1(src1),.sel1(sel1),.sel2(sel2),.data(in00),.alu_op(alu_op),.mem_we(mem_we));
endmodule
