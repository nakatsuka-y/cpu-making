//sel.v
module sel(a,b,sel,c);
	input [7:0] a,b;//a=in00,in01,b=in01,in11
	input sel;
	output wire [7:0] c;

assign c = (sel) ? a:b;
endmodule
