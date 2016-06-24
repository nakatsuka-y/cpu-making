`timescale 1ps/1ps

module test;
	reg clk,rst;
	wire [7:0] mem8,mem9,mem10,mem11,mem12,mem13,mem14,mem15,mem16,mem17,mem18,mem19,mem20,mem21,mem22,mem23,mem24,mem25,mem26,mem27;

	parameter STEP=10;

	top t0(clk,rst,mem8,mem9,mem10,mem11,mem12,mem13,mem14,mem15,mem16,mem17,mem18,mem19,mem20,mem21,mem22,mem23,mem24,mem25,mem26,mem27);

	always #(STEP/2) clk =~ clk;

	initial begin
//		$dumpfile("test.vcd");
//		$dumpvars(0,t0);
//		$dumplimit(1000000);
		clk=0;
		rst=0;
		$monitor($stime,": mem8:%d,mem9:%d,mem10:%d,mem11:%d,mem12:%d,mem13:%d,mem14:%d,mem15:%d,mem16:%d,mem17:%d,mem18:%d,mem19:%d,mem20:%d,mem21:%d,mem22:%d,mem23:%d,mem24:%d,mem25:%d,mem26:%d,mem27:%d",mem8,mem9,mem10,mem11,mem12,mem13,mem14,mem15,mem16,mem17,mem18,mem19,mem20,mem21,mem22,mem23,mem24,mem25,mem26,mem27);
	#STEP
		rst=1;
	#(STEP*1000000000);

	$finish;

	end
endmodule
