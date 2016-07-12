// imem5.v
module imem(pc,op);
	input [7:0] pc;
	output [19:0] op;

	reg [19:0] op;

`include "def.h"

	always @(pc) begin
		case(pc)
// synopsys parallel_case
// synopsys full_case
		//start A block
		0:begin //Set memory address
			op[19:15] <= LI;
			op[14:10] <= 8;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		1:begin
			op[19:15] <= LI;
			op[14:10] <= 9;
			op[9:2] <= 1;
			op[1:0] <= 0;
		end
		2:begin
			op[19:15] <= LI;
			op[14:10] <= 10;
			op[9:2] <= 2;
			op[1:0] <= 0;
		end
		3:begin
			op[19:15] <= LI;
			op[14:10] <= 11;
			op[9:2] <= 3;
			op[1:0] <= 0;
		end
		4:begin
			op[19:15] <= LI;
			op[14:10] <= 12;
			op[9:2] <= 4;
			op[1:0] <= 0;
		end
		5:begin
			op[19:15] <= LI;
			op[14:10] <= 13;
			op[9:2] <= 5;
			op[1:0] <= 0;
		end
		6:begin
			op[19:15] <= LI;
			op[14:10] <= 14;
			op[9:2] <= 6;
			op[1:0] <= 0;
		end
		7:begin
			op[19:15] <= LI;
			op[14:10] <= 15;
			op[9:2] <= 7;
			op[1:0] <= 0;
		end
		8:begin //set Depth Counter
			op[19:15] <= LI;
			op[14:10] <= DC;
			op[9:2] <= 3;
			op[1:0] <= 0;
		end
		9:begin //set DR0 reg
			op[19:15] <= LI;
			op[14:10] <= DR0;
			op[9:2] <= 8'b000_00_000;
			op[1:0] <= 0;
		end
		10:begin //set DR1 reg
			op[19:15] <= LI;
			op[14:10] <= DR1;
			op[9:2] <= 8'b000_00_000;
			op[1:0] <= 0;
		end
		11:begin //set DR2 reg
			op[19:15] <= LI;
			op[14:10] <= DR2;
			op[9:2] <= 8'b000_00_000;
			op[1:0] <= 0;
		end
		a_block: begin // Check depth
			op[19:15] <= CHECK;
			op[14:10] <= DC;
			op[9:2] <= 3;
			op[1:0] <= 0;
		end
		a_block + 1: begin // (if true) go to check reg2 (if false) next check
			op[19:15] <= JNZ;
			op[7:0] <= a_block+8;
		end
		a_block + 2: begin // Check depth
			op[19:15] <= CHECK;
			op[14:10] <= DC;
			op[9:2] <= 2;
			op[1:0] <= 0;
		end
		a_block + 3: begin // (if true) go to check reg1 (if false) next check
			op[19:15] <= JNZ;
			op[7:0] <= a_block+6;
		end
		a_block + 4: begin // mov reg0
			op[19:15] <= MOV;
			op[14:10] <= OP_TMP;
			op[4:0] <= DR0;
		end
		a_block + 5: begin // go to B BLOCK
			op[19:15] <= JMP;
			op[7:0] <= b_block;
		end
		a_block + 6: begin // mov reg1
			op[19:15] <= MOV;
			op[14:10] <= OP_TMP;
			op[4:0] <= DR1;
		end
		a_block + 7: begin // go to B BLOCK
			op[19:15] <= JMP;
			op[7:0] <= b_block;
		end
		a_block + 8: begin // mov reg2
			op[19:15] <= MOV;
			op[14:10] <= OP_TMP;
			op[4:0] <= DR2;
		end
		a_block + 9: begin //set initial position
			op[19:15] <= LI;
			op[14:10] <= 0;
			op[9:2] <= {FIVE,2'b00,LEF};
			op[1:0] <= 0;
		end
		a_block + 10: begin //set initial position
			op[19:15] <= LI;
			op[14:10] <= 1;
			op[9:2] <= {SIX,2'b00,RIG};
			op[1:0] <= 0;
		end
		a_block + 11: begin //set initial position
			op[19:15] <= LI;
			op[14:10] <= 2;
			op[9:2] <= {TWO,2'b00,RIG};
			op[1:0] <= 0;
		end
		a_block + 12: begin //set initial position
			op[19:15] <= LI;
			op[14:10] <= 3;
			op[9:2] <= {ZERO,2'b00,LEF};
			op[1:0] <= 0;
		end
		a_block + 13: begin //set initial position
			op[19:15] <= LI;
			op[14:10] <= 4;
			op[9:2] <= {ONE,2'b00,DOWN};
			op[1:0] <= 0;
		end
		a_block + 14: begin //set initial position
			op[19:15] <= LI;
			op[14:10] <= 5;
			op[9:2] <= {FOUR,2'b00,FRO};
			op[1:0] <= 0;
		end
		a_block + 15: begin //set initial position
			op[19:15] <= LI;
			op[14:10] <= 6;
			op[9:2] <= {THREE,2'b00,RIG};
			op[1:0] <= 0;
		end
		a_block + 16: begin //set initial position
			op[19:15] <= LI;
			op[14:10] <= 7;
			op[9:2] <= {SEVEN,2'b00,BAC};
			op[1:0] <= 0;
		end
		//start B block
		b_block: begin // execute U90?
			op[19:15] <= CHECK;
			op[14:10] <= OP_TMP;
			op[9:2] <= 8'b0000_0000;
			op[1:0] <= 0;
		end
		b_block+1: begin // (if true) go to execute U90 (if false) next check
			op[19:15] <= JNZ;
			op[7:0] <= b_block+17;
		end
		b_block+2: begin // execute U180?
			op[19:15] <= CHECK;
			op[14:10] <= OP_TMP;
			op[9:2] <= 8'b0000_0001;
			op[1:0] <= 0;
		end
		b_block+3: begin // (if true) go to execute U180 (if false) next check
			op[19:15] <= JNZ;
			op[7:0] <= b_block+23;
		end
		b_block+4: begin // execute U270?
			op[19:15] <= CHECK;
			op[14:10] <= OP_TMP;
			op[9:2] <= 8'b0000_0010;
			op[1:0] <= 0;
		end
		b_block+5: begin // (if true) go to execute U270 (if false) next check
			op[19:15] <= JNZ;
			op[7:0] <= b_block+30;
		end
		b_block+6: begin // execute F90?
			op[19:15] <= CHECK;
			op[14:10] <= OP_TMP;
			op[9:2] <= 8'b0000_0011;
			op[1:0] <= 0;
		end
		b_block+7: begin // (if true) go to execute F90 (if false) next check
			op[19:15] <= JNZ;
			op[7:0] <= b_block+36;
		end
		b_block+8: begin // execute F180?
			op[19:15] <= CHECK;
			op[14:10] <= OP_TMP;
			op[9:2] <= 8'b0000_0100;
			op[1:0] <= 0;
		end
		b_block+9: begin // (if true) go to execute F180 (if false) next check
			op[19:15] <= JNZ;
			op[7:0] <= b_block+42;
		end
		b_block+10: begin // execute F270?
			op[19:15] <= CHECK;
			op[14:10] <= OP_TMP;
			op[9:2] <= 8'b0000_0101;
			op[1:0] <= 0;
		end
		b_block+11: begin // (if true) go to execute F270 (if false) next check
			op[19:15] <= JNZ;
			op[7:0] <= b_block+49;
		end
		b_block+12: begin // execute R90?
			op[19:15] <= CHECK;
			op[14:10] <= OP_TMP;
			op[9:2] <= 8'b0000_0110;
			op[1:0] <= 0;
		end
		b_block+13: begin // (if true) go to execute R90 (if false) next check
			op[19:15] <= JNZ;
			op[7:0] <= b_block+55;
		end
		b_block+14: begin // execute R180?
			op[19:15] <= CHECK;
			op[14:10] <= OP_TMP;
			op[9:2] <= 8'b0000_0111;
			op[1:0] <= 0;
		end
		b_block+15: begin // (if true) go to execute R180 (if false) execute R270
			op[19:15] <= JNZ;
			op[7:0] <= b_block+61;
		end
		b_block+16: begin // execute R270
			op[19:15] <= JMP;
			op[7:0] <= b_block+68;
		end
		b_block+17:begin // execute U90
			op[19:15] <= UD_90;
			op[14:10] <= TMP;
			op[4:0] <= 0;
		end
		b_block+18:begin
			op[19:15] <= UD_90;
			op[14:10] <= 0;
			op[4:0] <= 3;
		end
		b_block+19:begin
			op[19:15] <= UD_90;
			op[14:10] <= 3;
			op[4:0] <= 2;
		end
		b_block+20:begin
			op[19:15] <= UD_90;
			op[14:10] <= 2;
			op[4:0] <= 1;
		end
		b_block+21:begin
			op[19:15] <= MOV;
			op[14:10] <= 1;
			op[4:0] <= TMP;
		end
		b_block+22: begin // go to C BLOCK
			op[19:15] <= JMP;
			op[7:0] <= c_block;
		end
		b_block+23:begin // execute U180
			op[19:15] <= UD_180;
			op[14:10] <= TMP;
			op[4:0] <= 0;
		end
		b_block+24:begin
			op[19:15] <= UD_180;
			op[14:10] <= 0;
			op[4:0] <= 2;
		end
		b_block+25:begin
			op[19:15] <= MOV;
			op[14:10] <= 2;
			op[4:0] <= TMP;
		end
		b_block+26:begin
			op[19:15] <= UD_180;
			op[14:10] <= TMP;
			op[4:0] <= 1;
		end
		b_block+27:begin
			op[19:15] <= UD_180;
			op[14:10] <= 1;
			op[4:0] <= 3;
		end
		b_block+28:begin
			op[19:15] <= MOV;
			op[14:10] <= 3;
			op[4:0] <= TMP;
		end
		b_block+29: begin // go to C BLOCK
			op[19:15] <= JMP;
			op[7:0] <= c_block;
		end
		b_block+30:begin // execute U270
			op[19:15] <= UD_270;
			op[14:10] <= TMP;
			op[4:0] <= 0;
		end
		b_block+31:begin
			op[19:15] <= UD_270;
			op[14:10] <= 0;
			op[4:0] <= 3;
		end
		b_block+32:begin
			op[19:15] <= UD_270;
			op[14:10] <= 3;
			op[4:0] <= 2;
		end
		b_block+33:begin
			op[19:15] <= UD_270;
			op[14:10] <= 2;
			op[4:0] <= 1;
		end
		b_block+34:begin
			op[19:15] <= MOV;
			op[14:10] <= 1;
			op[4:0] <= TMP;
		end
		b_block+35: begin // go to C BLOCK
			op[19:15] <= JMP;
			op[7:0] <= c_block;
		end
		b_block+36:begin // execute F90
			op[19:15] <= FB_90;
			op[14:10] <= TMP;
			op[4:0] <= 0;
		end
		b_block+37:begin
			op[19:15] <= FB_90;
			op[14:10] <= 0;
			op[4:0] <= 4;
		end
		b_block+38:begin
			op[19:15] <= FB_90;
			op[14:10] <= 4;
			op[4:0] <= 5;
		end
		b_block+39:begin
			op[19:15] <= FB_90;
			op[14:10] <= 5;
			op[4:0] <= 1;
		end
		b_block+40:begin
			op[19:15] <= MOV;
			op[14:10] <= 1;
			op[4:0] <= TMP;
		end
		b_block+41: begin // go to C BLOCK
			op[19:15] <= JMP;
			op[7:0] <= c_block;
		end
		b_block+42:begin // execute F180
			op[19:15] <= FB_180;
			op[14:10] <= TMP;
			op[4:0] <= 0;
		end
		b_block+43:begin
			op[19:15] <= FB_180;
			op[14:10] <= 0;
			op[4:0] <= 5;
		end
		b_block+44:begin
			op[19:15] <= MOV;
			op[14:10] <= 5;
			op[4:0] <= TMP;
		end
		b_block+45:begin
			op[19:15] <= FB_180;
			op[14:10] <= TMP;
			op[4:0] <= 1;
		end
		b_block+46:begin
			op[19:15] <= FB_180;
			op[14:10] <= 1;
			op[4:0] <= 4;
		end
		b_block+47:begin
			op[19:15] <= MOV;
			op[14:10] <= 4;
			op[4:0] <= TMP;
		end
		b_block+48: begin // go to C BLOCK
			op[19:15] <= JMP;
			op[7:0] <= c_block;
		end
		b_block+49:begin // execute F270
			op[19:15] <= FB_270;
			op[14:10] <= TMP;
			op[4:0] <= 0;
		end
		b_block+50:begin
			op[19:15] <= FB_270;
			op[14:10] <= 0;
			op[4:0] <= 1;
		end
		b_block+51:begin
			op[19:15] <= FB_270;
			op[14:10] <= 1;
			op[4:0] <= 5;
		end
		b_block+52:begin
			op[19:15] <= FB_270;
			op[14:10] <= 5;
			op[4:0] <= 4;
		end
		b_block+53:begin
			op[19:15] <= MOV;
			op[14:10] <= 4;
			op[4:0] <= TMP;
		end
		b_block+54: begin // go to C BLOCK
			op[19:15] <= JMP;
			op[7:0] <= c_block;
		end
		b_block+55:begin // execute R90
			op[19:15] <= RL_90;
			op[14:10] <= TMP;
			op[4:0] <= 1;
		end
		b_block+56:begin
			op[19:15] <= RL_90;
			op[14:10] <= 1;
			op[4:0] <= 5;
		end
		b_block+57:begin
			op[19:15] <= RL_90;
			op[14:10] <= 5;
			op[4:0] <= 6;
		end
		b_block+58:begin
			op[19:15] <= RL_90;
			op[14:10] <= 6;
			op[4:0] <= 2;
		end
		b_block+59:begin
			op[19:15] <= MOV;
			op[14:10] <= 2;
			op[4:0] <= TMP;
		end
		b_block+60: begin // go to C BLOCK
			op[19:15] <= JMP;
			op[7:0] <= c_block;
		end
		b_block+61:begin // execute R180
			op[19:15] <= RL_180;
			op[14:10] <= TMP;
			op[4:0] <= 1;
		end
		b_block+62:begin
			op[19:15] <= RL_180;
			op[14:10] <= 1;
			op[4:0] <= 6;
		end
		b_block+63:begin
			op[19:15] <= MOV;
			op[14:10] <= 1;
			op[4:0] <= TMP;
		end
		b_block+64:begin
			op[19:15] <= RL_180;
			op[14:10] <= TMP;
			op[4:0] <= 2;
		end
		b_block+65:begin
			op[19:15] <= RL_180;
			op[14:10] <= 2;
			op[4:0] <= 5;
		end
		b_block+66:begin
			op[19:15] <= MOV;
			op[14:10] <= 5;
			op[4:0] <= TMP;
		end
		b_block+67: begin // go to C BLOCK
			op[19:15] <= JMP;
			op[7:0] <= c_block;
		end
		b_block+68:begin // execute R270
			op[19:15] <= RL_270;
			op[14:10] <= TMP;
			op[4:0] <= 1;
		end
		b_block+69:begin
			op[19:15] <= RL_270;
			op[14:10] <= 1;
			op[4:0] <= 2;
		end
		b_block+70:begin
			op[19:15] <= RL_270;
			op[14:10] <= 2;
			op[4:0] <= 6;
		end
		b_block+71:begin
			op[19:15] <= RL_270;
			op[14:10] <= 6;
			op[4:0] <= 5;
		end
		b_block+72:begin
			op[19:15] <= MOV;
			op[14:10] <= 5;
			op[4:0] <= TMP;
		end
		b_block+73: begin // go to C BLOCK
			op[19:15] <= JMP;
			op[7:0] <= c_block;
		end
		// start C BLOCK
		c_block: begin // Depth Counter - 1
			op[19:15] <= DEC;
			op[14:10] <= DC;
			op[4:0] <= DC;
		end
		c_block+1: begin // check Depth Counter
			op[19:15] <= CHECK;
			op[14:10] <= DC;
			op[9:2] <= 0;
		end
		c_block+2:begin // (if true)A block (if false)go to Face Check
			op[19:15] <= ZNJ;
			op[7:0] <= a_block;
		end
		c_block+3:begin // execute Face Check
			op[19:15] <= CHECK;
			op[14:10] <= 0;
			op[9:2] <= 8'b000_00_000;
		end
		c_block+4:begin // (if true)next face check (if false)go to Depth Register 0 + 1
			op[19:15] <= ZNJ;
			op[7:0] <= c_block+19;
		end
		c_block+5:begin
			op[19:15] <= CHECK;
			op[14:10] <= 1;
			op[9:2] <= 8'b001_00_000;
		end
		c_block+6:begin
			op[19:15] <= ZNJ;
			op[7:0] <= c_block+19;
		end
		c_block+7:begin
			op[19:15] <= CHECK;
			op[14:10] <= 2;
			op[9:2] <= 8'b010_00_101;
		end
		c_block+8:begin
			op[19:15] <= ZNJ;
			op[7:0] <= c_block+19;
		end
		c_block+9:begin
			op[19:15] <= CHECK;
			op[14:10] <= 3;
			op[9:2] <= 8'b011_00_101;
		end
		c_block+10:begin
			op[19:15] <= ZNJ;
			op[7:0] <= c_block+19;
		end
		c_block+11:begin
			op[19:15] <= CHECK;
			op[14:10] <= 4;
			op[9:2] <= 8'b100_00_000;
		end
		c_block+12:begin
			op[19:15] <= ZNJ;
			op[7:0] <= c_block+19;
		end
		c_block+13:begin
			op[19:15] <= CHECK;
			op[14:10] <= 5;
			op[9:2] <= 8'b101_00_000;
		end
		c_block+14:begin
			op[19:15] <= ZNJ;
			op[7:0] <= c_block+19;
		end
		c_block+15:begin
			op[19:15] <= CHECK;
			op[14:10] <= 6;
			op[9:2] <= 8'b110_00_101;
		end
		c_block+16:begin
			op[19:15] <= ZNJ;
			op[7:0] <= c_block+19;
		end
		c_block+17:begin
			op[19:15] <= CHECK;
			op[14:10] <= 7;
			op[9:2] <= 8'b111_00_101;
		end
		c_block+18:begin // (if true)go to STORE procedure (if false) Depth Register 0 + 1
			op[19:15] <= JNZ;
			op[7:0] <= d_block;
		end
		c_block+19:begin // Depth Register 0 + 1
			op[19:15] <= INC;
			op[14:10] <= DR0;
			op[4:0] <= DR0;
		end
		c_block+20:begin // check Depth Register 0
			op[19:15] <= CHECK;
			op[14:10] <= DR0;
			op[9:2] <= 8'b0000_1001;
		end
		c_block+21:begin // (if true)Depth Register 0 = 0 (if false)go to A BLOCK
			op[19:15] <= ZNJ;
			op[7:0] <= c_block+31;
		end
		c_block+22:begin // Depth Register 0 = 0
			op[19:15] <= LI;
			op[14:10] <= DR0;
			op[9:2] <= 0;
		end
		c_block+23:begin // Depth Register 1 + 1
			op[19:15] <= INC;
			op[14:10] <= DR1;
			op[4:0] <= DR1;
		end
		c_block+24:begin // check Depth Register 1
			op[19:15] <= CHECK;
			op[14:10] <= DR1;
			op[9:2] <= 8'b0000_1001;
		end
		c_block+25:begin // (if true)Depth Register 1 = 0 (if false)go to A BLOCK
			op[19:15] <= ZNJ;
			op[7:0] <= c_block+31;
		end
		c_block+26:begin // Depth Register 1 = 0
			op[19:15] <= LI;
			op[14:10] <= DR1;
			op[9:2] <= 0;
		end
		c_block+27:begin // Depth Register 2 + 1
			op[19:15] <= INC;
			op[14:10] <= DR2;
			op[4:0] <= DR2;
		end
		c_block+28:begin // check Depth Register 2
			op[19:15] <= CHECK;
			op[14:10] <= DR2;
			op[9:2] <= 8'b0000_1001;
		end
		c_block+29:begin // (if true)go to D BLOCK (if false)go to A BLOCK
			op[19:15] <= ZNJ;
			op[7:0] <= c_block+31;
		end
		c_block+30:begin // go to D BLOCK
			op[19:15] <= JMP;
			op[7:0] <= d_block;
		end
		c_block+31:begin // DC=3
			op[19:15] <= LI;
			op[14:10] <= DC;
			op[9:2] <= 3;
			op[1:0] <= 0;
		end
		c_block+32:begin // go to a_block
			op[19:15] <= JMP;
			op[7:0] <= a_block;
		end
		// start D BLOCK
		d_block:begin // STORE Procedure
			op[18:15] <= STORE;
			op[9:5] <= 8;
			op[4:0] <= 0;
		end
		d_block+1:begin
			op[18:15] <= STORE;
			op[9:5] <= 9;
			op[4:0] <= 1;
		end
		d_block+2:begin
			op[18:15] <= STORE;
			op[9:5] <= 10;
			op[4:0] <= 2;
		end
		d_block+3:begin
			op[18:15] <= STORE;
			op[9:5] <= 11;
			op[4:0] <= 3;
		end
		d_block+4:begin
			op[18:15] <= STORE;
			op[9:5] <= 12;
			op[4:0] <= 4;
		end
		d_block+5:begin
			op[18:15] <= STORE;
			op[9:5] <= 13;
			op[4:0] <= 5;
		end
		d_block+6:begin
			op[18:15] <= STORE;
			op[9:5] <= 14;
			op[4:0] <= 6;
		end
		d_block+7:begin
			op[18:15] <= STORE;
			op[9:5] <= 15;
			op[4:0] <= 7;
		end
		d_block+8:begin
			op[18:15] <= JMP;
			op[7:0] <= d_block+8;
		end

		endcase
	end
endmodule
