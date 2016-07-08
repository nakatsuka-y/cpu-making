//alu.v
module alu(in0,in1,op,zf,out);
	input wire [7:0] in0,in1;
	input wire [4:0] op;
	output reg zf;
	output reg [7:0] out;

	`include "def.h"

	//assign reg6=regfile[6];

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

		RL_90 : begin
			case (in0[2:0])
				3'b001 : out <= in0;
				3'b011 : out <= in0;
				3'b000 : out <= {in0[7:3],3'b010};
				3'b010 : out <= {in0[7:3],3'b101};
				3'b101 : out <= {in0[7:3],3'b100};
				3'b100 : out <= {in0[7:3],3'b000};
			endcase
		end

		UD_90 : begin
			case (in0[2:0])
				3'b010 : out <= in0;
				3'b100 : out <= in0;
				3'b000 : out <= {in0[7:3],3'b001};
				3'b001 : out <= {in0[7:3],3'b101};
				3'b101 : out <= {in0[7:3],3'b011};
				3'b011 : out <= {in0[7:3],3'b000};
			endcase
		end

		FB_90 : begin
			case (in0[2:0])
				3'b000 : out <= in0;
				3'b101 : out <= in0;
				3'b001 : out <= {in0[7:3],3'b100};
				3'b010 : out <= {in0[7:3],3'b001};
				3'b011 : out <= {in0[7:3],3'b010};
				3'b100 : out <= {in0[7:3],3'b011};
			endcase
		end

		RL_180 : begin
			case (in0[2:0])
				3'b001 : out <= in0;// x -> x
				3'b011 : out <= in0;// -x -> -x
				3'b000 : out <= {in0[7:3],3'b101};// y -> -y
				3'b010 : out <= {in0[7:3],3'b100};// z -> -z
				3'b101 : out <= {in0[7:3],3'b000};// -y -> y
				3'b100 : out <= {in0[7:3],3'b010};// -z -> z
			endcase
		end

		UD_180 : begin
			case (in0[2:0])
				3'b010 : out <= in0;// z -> z
				3'b100 : out <= in0;// -z -> -z
				3'b000 : out <= {in0[7:3],3'b101};// y -> -y
				3'b001 : out <= {in0[7:3],3'b011};// x -> -x
				3'b101 : out <= {in0[7:3],3'b000};// -y -> y
				3'b011 : out <= {in0[7:3],3'b001};// -x -> x
			endcase
		end

		FB_180 : begin
			case (in0[2:0])
				3'b000 : out <= in0;// y -> y
				3'b101 : out <= in0;// -y -> -y
				3'b001 : out <= {in0[7:3],3'b011};// x -> -x
				3'b010 : out <= {in0[7:3],3'b100};// z -> -z
				3'b011 : out <= {in0[7:3],3'b001};// -x -> x
				3'b100 : out <= {in0[7:3],3'b010};// -z -> z
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
