`timescale 1ps/1ps

module test;
	reg clk,rst;
	wire [7:0] mem0,mem1,mem2,mem3,mem4,mem5,mem6,mem7;

	parameter STEP=10;

	top t0(clk,rst,mem0,mem1,mem2,mem3,mem4,mem5,mem6,mem7);

	always #(STEP/2) clk =~ clk;

	initial begin
//		$dumpfile("test.vcd");
//		$dumpvars(0,t0);
//		$dumplimit(1000000);
		clk=0;
		rst=0;
		$monitor($stime,": mem0:%b,mem1:%b,mem2:%b,mem3:%b,mem4:%b,mem5:%b,mem6:%b,mem7:%b",mem0,mem1,mem2,mem3,mem4,mem5,mem6,mem7);
	#STEP
		rst=1;
	#(STEP*1000000000);

	$finish;

	end
endmodule
