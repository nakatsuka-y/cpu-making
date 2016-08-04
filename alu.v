//alu.v
module alu(in0,in1,op,zf,out);
	input wire [7:0] in0,in1;
	input wire [3:0] op;// [4:0]にする
	output reg zf;
	output reg [7:0] out;

	`include "def.h"

	// assign reg6 = regfile[6];
	// jmpは強制的にジャンプ, jmzはflagチェック
	always @(*) begin
		case(op)
/*
		AND : begin
			out <= in0 & in1;
			zf <= 0;
		end

		OR : begin
			out <= in0 | in1;
			zf <= 0;
		end

		ADD : begin
			out <= in0 + in1;
			zf <= 0;
		end

		SUB : begin
			out <= (in0 > in1) ? in0 - in1 : in1 - in0;
			zf <= 0;
		end
*/
		INC : begin
			out <= in0 + 1;
			zf <= 0;
		end

		DEC : begin
			out <= in0 - 1;
			zf <= 0;
		end
/*
		COMP : begin
			zf <= (in0 == in1) ? 1 : 0;
		end
*/
		CHECK : begin
			// jmzの前には必ずcheckがきてる
			zf <= (in0 == in1) ? 1 : 0;
		end

		LOAD : begin
			out <= in0;
			zf <= 0;
		end

		STORE : begin
			out <= in0;
			zf <= 0;
		end

		LI : begin
			out <= in0;
			zf <= 0;
		end

		//opの値によって操作を決定. この場合はx軸回転 
		//下位3bitをとってきてそのうち2bitで動作を変更
		RL_90 : begin
			case (in0[2:0])
				3'b001 : out <= in0;// x向いてる
				3'b011 : out <= in0;// x軸反対側
				3'b000 : out <= {in0[7:3],3'b010};// y向いてる 
				3'b010 : out <= {in0[7:3],3'b101};// z向いてる
				3'b101 : out <= {in0[7:3],3'b100};// y軸反対側
				3'b100 : out <= {in0[7:3],3'b000};// z軸反対側
			endcase
		end
		//z軸回転
		UD_90 : begin
			case (in0[2:0])
				3'b010 : out <= in0;//z
				3'b100 : out <= in0;//-z
				3'b000 : out <= {in0[7:3],3'b001};//y
				3'b001 : out <= {in0[7:3],3'b101};//x
				3'b101 : out <= {in0[7:3],3'b011};//-y
				3'b011 : out <= {in0[7:3],3'b000};//-x
			endcase
		end
		//y軸回転
		FB_90 : begin
			case (in0[2:0])
				3'b000 : out <= in0;//y
				3'b101 : out <= in0;//-y
				3'b001 : out <= {in0[7:3],3'b100};//x
				3'b010 : out <= {in0[7:3],3'b001};//z
				3'b011 : out <= {in0[7:3],3'b010};//-x
				3'b100 : out <= {in0[7:3],3'b011};//-z
			endcase
		end

		RL_270 : begin
			case (in0[2:0])
				3'b001 : out <= in0;
				3'b011 : out <= in0;
				3'b000 : out <= {in0[7:3],3'b100};
				3'b010 : out <= {in0[7:3],3'b000};
				3'b101 : out <= {in0[7:3],3'b010};
				3'b100 : out <= {in0[7:3],3'b101};
			endcase
		end

		UD_270: begin
			case (in0[2:0])
				3'b010 : out <= in0;
				3'b100 : out <= in0;
				3'b000 : out <= {in0[7:3],3'b011};
				3'b011 : out <= {in0[7:3],3'b101};
				3'b101 : out <= {in0[7:3],3'b001};
				3'b001 : out <= {in0[7:3],3'b000};
			endcase
		end

		FB_270 : begin
			case (in0[2:0])
				3'b000 : out <= in0;
				3'b101 : out <= in0;
				3'b001 : out <= {in0[7:3],3'b010};
				3'b010 : out <= {in0[7:3],3'b011};
				3'b011 : out <= {in0[7:3],3'b100};
				3'b100 : out <= {in0[7:3],3'b001};
			endcase
		end

		MOV : begin
			out <= in0;
			zf <= 0;
		end

		endcase
	end
endmodule
