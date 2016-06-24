//imem.v
module imem(pc,op);
	input [7:0] pc;
	output [18:0] op;

	reg [18:0] op;

`include "def.h"

	always @(pc) begin
		case(pc)
// synopsys parallel_case
// synopsys full_case
		0:begin //0~7:Set initial position
			op[18:15] <= LI;
			op[14:10] <= 0;
			op[9:2] <= 8'b000_00_000;
			op[1:0] <= 0;
		end
		1:begin
			op[18:15] <= LI;
			op[14:10] <= 1;
			op[9:2] <= 8'b011_00_010;
			op[1:0] <= 0;
		end
		2:begin
			op[18:15] <= LI;
			op[14:10] <= 2;
			op[9:2] <= 8'b110_00_001;
			op[1:0] <= 0;
		end
		3:begin
			op[18:15] <= LI;
			op[14:10] <= 3;
			op[9:2] <= 8'b101_00_011;
			op[1:0] <= 0;
		end
		4:begin
			op[18:15] <= LI;
			op[14:10] <= 4;
			op[9:2] <= 8'b001_00_000;
			op[1:0] <= 0;
		end
		5:begin
			op[18:15] <= LI;
			op[14:10] <= 5;
			op[9:2] <= 8'b111_00_000;
			op[1:0] <= 0;
		end
		6:begin
			op[18:15] <= LI;
			op[14:10] <= 6;
			op[9:2] <= 8'b010_00_001;
			op[1:0] <= 0;
		end
		7:begin
			op[18:15] <= LI;
			op[14:10] <= 7;
			op[9:2] <= 8'b100_00_101;
			op[1:0] <= 0;
		end
		8:begin //8~15:Set memory address
			op[18:15] <= LI;
			op[14:10] <= 8;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		9:begin
			op[18:15] <= LI;
			op[14:10] <= 9;
			op[9:2] <= 1;
			op[1:0] <= 0;
		end
		10:begin
			op[18:15] <= LI;
			op[14:10] <= 10;
			op[9:2] <= 2;
			op[1:0] <= 0;
		end
		11:begin
			op[18:15] <= LI;
			op[14:10] <= 11;
			op[9:2] <= 3;
			op[1:0] <= 0;
		end
		12:begin
			op[18:15] <= LI;
			op[14:10] <= 12;
			op[9:2] <= 4;
			op[1:0] <= 0;
		end
		13:begin
			op[18:15] <= LI;
			op[14:10] <= 13;
			op[9:2] <= 5;
			op[1:0] <= 0;
		end
		14:begin
			op[18:15] <= LI;
			op[14:10] <= 14;
			op[9:2] <= 6;
			op[1:0] <= 0;
		end
		15:begin
			op[18:15] <= LI;
			op[14:10] <= 15;
			op[9:2] <= 7;
			op[1:0] <= 0;
		end
		16:begin // Depth Counter
			op[18:15] <= LI;
			op[14:10] <= DC;
			op[9:2] <= 14;
			op[1:0] <= 0;
		end
		17:begin // U Counter
			op[18:15] <= LI;
			op[14:10] <= UC;
			op[9:2] <= 3;
			op[1:0] <= 0;
		end
		18:begin // F Counter
			op[18:15] <= LI;
			op[14:10] <= FC;
			op[9:2] <= 3;
			op[1:0] <= 0;
		end
		19:begin // R Counter
			op[18:15] <= LI;
			op[14:10] <= RC;
			op[9:2] <= 3;
			op[1:0] <= 0;
		end
		20:begin // U foot Flag
			op[18:15] <= LI;
			op[14:10] <= UF;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		21:begin // F foot Flag
			op[18:15] <= LI;
			op[14:10] <= FF;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		22:begin // R foot Flag
			op[18:15] <= LI;
			op[14:10] <= RF;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		23:begin // All U Counter
			op[18:15] <= LI;
			op[14:10] <= AUC;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		24:begin // STEP (register to LI present step or LOAD previous step from memory)
			op[18:15] <= LI;
			op[14:10] <= STEP;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		25:begin // STEPaddr (register to hold memory address to STORE previous steps)
			op[18:15] <= LI;
			op[14:10] <= STEPADDR;
			op[9:2] <= 8;
			op[1:0] <= 0;
		end
		26:begin // [[[A]]] reached U foot?
			op[18:15] <= CHECK;
			op[14:10] <= UF;
			op[9:2] <= 1;
		end
		27:begin // (if true)go to F foot check
			op[18:15] <= JNZ;
			op[7:0] <= 29;
		end
		28:begin // (if false)jump to U counter check
			op[18:15] <= JMP;
			op[7:0] <= 35;
		end
		29:begin // [[[E]]] reached F foot?
			op[18:15] <= CHECK;
			op[14:10] <= FF;
			op[9:2] <= 1;
		end
		30:begin // (if true)go to R foot check
			op[18:15] <= JNZ;
			op[7:0] <= 32;
		end
		31:begin // (if false)jump to F counter check
			op[18:15] <= JMP;
			op[7:0] <= 88;
		end
		32:begin // [[[F]]] reached R foot?
			op[18:15] <= CHECK;
			op[14:10] <= RF;
			op[9:2] <= 1;
		end
		33:begin // (if true)go to [B]
			op[18:15] <= JNZ;
			op[7:0] <= 194;
		end
		34:begin // (if false)jump to R counter check
			op[18:15] <= JMP;
			op[7:0] <= 141;
		end
		35:begin // did U 3 times?
			op[18:15] <= CHECK;
			op[14:10] <= UC;
			op[9:2] <= 0;
		end
		36:begin // (if true)go to Depth Counter check (if false)UC DEC
			op[18:15] <= JNZ;
			op[7:0] <= 77;
		end
		37:begin // U Counter DEC
			op[18:15] <= DEC;
			op[14:10] <= UC;
			op[4:0] <= UC;
		end
		38:begin // LI U to register
			op[18:15] <= LI;
			op[14:10] <= STEP;
			op[9:2] <= {4'h0,UD_90};
			op[1:0] <= 0;
		end
		39:begin // STORE U to memory
			op[18:15] <= STORE;
			op[9:5] <= STEPADDR;
			op[4:0] <= STEP;
		end
		40:begin // INC STEPADDR
			op[18:15] <= INC;
			op[14:10] <= STEPADDR;
			op[4:0] <= STEPADDR;
		end
		41:begin // execute U
			op[18:15] <= UD_90;
			op[14:10] <= TMP;
			op[4:0] <= 0;
		end
		42:begin
			op[18:15] <= UD_90;
			op[14:10] <= 0;
			op[4:0] <= 3;
		end
		43:begin
			op[18:15] <= UD_90;
			op[14:10] <= 3;
			op[4:0] <= 2;
		end
		44:begin
			op[18:15] <= UD_90;
			op[14:10] <= 2;
			op[4:0] <= 1;
		end
		45:begin
			op[18:15] <= MOV;
			op[14:10] <= 1;
			op[4:0] <= TMP;
		end
		46:begin // Depth Counter DEC
			op[18:15] <= DEC;
			op[14:10] <= DC;
			op[4:0] <= DC;
		end
		47:begin // Face Check
			op[18:15] <= CHECK;
			op[14:10] <= 0;
			op[9:2] <= 8'b000_00_000;
		end
		48:begin // (if true)next face check (if false)go to DC check
			op[18:15] <= ZNJ;
			op[7:0] <= 63;
		end
		49:begin
			op[18:15] <= CHECK;
			op[14:10] <= 1;
			op[9:2] <= 8'b001_00_000;
		end
		50:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 63;
		end
		51:begin
			op[18:15] <= CHECK;
			op[14:10] <= 2;
			op[9:2] <= 8'b010_00_101;
		end
		52:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 63;
		end
		53:begin
			op[18:15] <= CHECK;
			op[14:10] <= 3;
			op[9:2] <= 8'b011_00_101;
		end
		54:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 63;
		end
		55:begin
			op[18:15] <= CHECK;
			op[14:10] <= 4;
			op[9:2] <= 8'b100_00_000;
		end
		56:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 63;
		end
		57:begin
			op[18:15] <= CHECK;
			op[14:10] <= 5;
			op[9:2] <= 8'b101_00_000;
		end
		58:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 63;
		end
		59:begin
			op[18:15] <= CHECK;
			op[14:10] <= 6;
			op[9:2] <= 8'b110_00_101;
		end
		60:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 63;
		end
		61:begin
			op[18:15] <= CHECK;
			op[14:10] <= 7;
			op[9:2] <= 8'b111_00_101;
		end
		62:begin // (if true)go to STORE procedure (if false)DC check
			op[18:15] <= JNZ;
			op[7:0] <= 240;
		end
		63:begin // is Depth Counter 0?
			op[18:15] <= CHECK;
			op[14:10] <= DC;
			op[9:2] <= 0;
		end
		64:begin // (if true)execute D (if false)go to init all FLAGs
			op[18:15] <= ZNJ;
			op[7:0] <= 84;
		end
		65:begin // execute D
			op[18:15] <= UD_270;
			op[14:10] <= TMP;
			op[4:0] <= 0;
		end
		66:begin
			op[18:15] <= UD_270;
			op[14:10] <= 0;
			op[4:0] <= 1;
		end
		67:begin
			op[18:15] <= UD_270;
			op[14:10] <= 1;
			op[4:0] <= 2;
		end
		68:begin
			op[18:15] <= UD_270;
			op[14:10] <= 2;
			op[4:0] <= 3;
		end
		69:begin
			op[18:15] <= MOV;
			op[14:10] <= 3;
			op[4:0] <= TMP;
		end
		70:begin // raise UF
			op[18:15] <= LI;
			op[14:10] <= UF;
			op[9:2] <= 1;
		end
		71:begin // INC UC
			op[18:15] <= INC;
			op[14:10] <= UC;
			op[4:0] <= UC;
		end
		72:begin // INC DC
			op[18:15] <= INC;
			op[14:10] <= DC;
			op[4:0] <= DC;
		end
		73:begin // DEC STEPADDR
			op[18:15] <= DEC;
			op[14:10] <= STEPADDR;
			op[4:0] <= STEPADDR;
		end
		74:begin // LI 0 to STEP
			op[18:15] <= LI;
			op[14:10] <= STEP;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		75:begin // STORE 0 to memory
			op[18:15] <= STORE;
			op[9:5] <= STEPADDR;
			op[4:0] <= STEP;
		end
		76:begin // Jump to [A]
			op[18:15] <= JMP;
			op[7:0] <= 26;
		end
		77:begin // [From did U 3 times?] is Depth Counter 0?
			op[18:15] <= CHECK;
			op[14:10] <= DC;
			op[9:2] <= 0;
		end
		78:begin // (if true)go to execute D (if false)set UC to 3
			op[18:15] <= JNZ;
			op[7:0] <= 63;
		end
		79:begin // set UC to 3
			op[18:15] <= LI;
			op[14:10] <= UC;
			op[9:2] <= 3;
			op[1:0] <= 0;
		end
		80:begin // raise UF
			op[18:15] <= LI;
			op[14:10] <= UF;
			op[9:2] <= 1;
		end
		81:begin // lower FF
			op[18:15] <= LI;
			op[14:10] <= FF;
			op[9:2] <= 0;
		end
		82:begin // lower RF
			op[18:15] <= LI;
			op[14:10] <= RF;
			op[9:2] <= 0;
		end
		83:begin // Jump to [A]
			op[18:15] <= JMP;
			op[7:0] <= 26;
		end
		84:begin // [From is Depth Counter 0?(62) init all FLAGS] lower UF
			op[18:15] <= LI;
			op[14:10] <= UF;
			op[9:2] <= 0;
		end
		85:begin // lower FF
			op[18:15] <= LI;
			op[14:10] <= UF;
			op[9:2] <= 0;
		end
		86:begin // lower RF
			op[18:15] <= LI;
			op[14:10] <= UF;
			op[9:2] <= 0;
		end
		87:begin // Jump to [A]
			op[18:15] <= JMP;
			op[7:0] <= 26;
		end
		88:begin // [From (31)]did F 3 times?
			op[18:15] <= CHECK;
			op[14:10] <= FC;
			op[9:2] <= 0;
		end
		89:begin // (if true)go to Depth Counter check (if false)FC DEC
			op[18:15] <= JNZ;
			op[7:0] <= 130;
		end
		90:begin // F Counter DEC
			op[18:15] <= DEC;
			op[14:10] <= FC;
			op[4:0] <= FC;
		end
		91:begin // LI F to register
			op[18:15] <= LI;
			op[14:10] <= STEP;
			op[9:2] <= {4'h0,FB_90};
			op[1:0] <= 0;
		end
		92:begin // STORE F to memory
			op[18:15] <= STORE;
			op[9:5] <= STEPADDR;
			op[4:0] <= STEP;
		end
		93:begin // INC STEPADDR
			op[18:15] <= INC;
			op[14:10] <= STEPADDR;
			op[4:0] <= STEPADDR;
		end
		94:begin // execute F
			op[18:15] <= FB_90;
			op[14:10] <= TMP;
			op[4:0] <= 1;
		end
		95:begin
			op[18:15] <= FB_90;
			op[14:10] <= 1;
			op[4:0] <= 0;
		end
		96:begin
			op[18:15] <= FB_90;
			op[14:10] <= 0;
			op[4:0] <= 4;
		end
		97:begin
			op[18:15] <= FB_90;
			op[14:10] <= 4;
			op[4:0] <= 5;
		end
		98:begin
			op[18:15] <= MOV;
			op[14:10] <= 5;
			op[4:0] <= TMP;
		end
		99:begin // Depth Counter DEC
			op[18:15] <= DEC;
			op[14:10] <= DC;
			op[4:0] <= DC;
		end
		100:begin // Face Check
			op[18:15] <= CHECK;
			op[14:10] <= 0;
			op[9:2] <= 8'b000_00_000;
		end
		101:begin // (if true)next face check (if false)go to DC check
			op[18:15] <= ZNJ;
			op[7:0] <= 116;
		end
		102:begin
			op[18:15] <= CHECK;
			op[14:10] <= 1;
			op[9:2] <= 8'b001_00_000;
		end
		103:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 116;
		end
		104:begin
			op[18:15] <= CHECK;
			op[14:10] <= 2;
			op[9:2] <= 8'b010_00_101;
		end
		105:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 116;
		end
		106:begin
			op[18:15] <= CHECK;
			op[14:10] <= 3;
			op[9:2] <= 8'b011_00_101;
		end
		107:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 116;
		end
		108:begin
			op[18:15] <= CHECK;
			op[14:10] <= 4;
			op[9:2] <= 8'b100_00_000;
		end
		109:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 116;
		end
		110:begin
			op[18:15] <= CHECK;
			op[14:10] <= 5;
			op[9:2] <= 8'b101_00_000;
		end
		111:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 116;
		end
		112:begin
			op[18:15] <= CHECK;
			op[14:10] <= 6;
			op[9:2] <= 8'b110_00_101;
		end
		113:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 116;
		end
		114:begin
			op[18:15] <= CHECK;
			op[14:10] <= 7;
			op[9:2] <= 8'b111_00_101;
		end
		115:begin // (if true)go to STORE procedure (if false)DC check
			op[18:15] <= JNZ;
			op[7:0] <= 240;
		end
		116:begin // is Depth Counter 0?
			op[18:15] <= CHECK;
			op[14:10] <= DC;
			op[9:2] <= 0;
		end
		117:begin // (if true)execute B (if false)go to init all FLAGs
			op[18:15] <= ZNJ;
			op[7:0] <= 137;
		end
		118:begin // execute B
			op[18:15] <= FB_270;
			op[14:10] <= TMP;
			op[4:0] <= 0;
		end
		119:begin
			op[18:15] <= FB_270;
			op[14:10] <= 0;
			op[4:0] <= 1;
		end
		120:begin
			op[18:15] <= FB_270;
			op[14:10] <= 1;
			op[4:0] <= 5;
		end
		121:begin
			op[18:15] <= FB_270;
			op[14:10] <= 5;
			op[4:0] <= 4;
		end
		122:begin
			op[18:15] <= MOV;
			op[14:10] <= 4;
			op[4:0] <= TMP;
		end
		123:begin // raise FF
			op[18:15] <= LI;
			op[14:10] <= FF;
			op[9:2] <= 1;
		end
		124:begin // INC FC
			op[18:15] <= INC;
			op[14:10] <= FC;
			op[4:0] <= FC;
		end
		125:begin // INC DC
			op[18:15] <= INC;
			op[14:10] <= DC;
			op[4:0] <= DC;
		end
		126:begin // DEC STEPADDR
			op[18:15] <= DEC;
			op[14:10] <= STEPADDR;
			op[4:0] <= STEPADDR;
		end
		127:begin // LI 0 to STEP
			op[18:15] <= LI;
			op[14:10] <= STEP;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		128:begin // STORE 0 to memory
			op[18:15] <= STORE;
			op[9:5] <= STEPADDR;
			op[4:0] <= STEP;
		end
		129:begin // Jump to [A]
			op[18:15] <= JMP;
			op[7:0] <= 26;
		end
		130:begin // [From did F 3 times?] is Depth Counter 0?
			op[18:15] <= CHECK;
			op[14:10] <= DC;
			op[9:2] <= 0;
		end
		131:begin // (if true)go to execute B (if false)set FC to 3
			op[18:15] <= JNZ;
			op[7:0] <= 112;
		end
		132:begin // set FC to 3
			op[18:15] <= LI;
			op[14:10] <= FC;
			op[9:2] <= 3;
			op[1:0] <= 0;
		end
		133:begin // lower UF
			op[18:15] <= LI;
			op[14:10] <= UF;
			op[9:2] <= 0;
		end
		134:begin // raise FF
			op[18:15] <= LI;
			op[14:10] <= FF;
			op[9:2] <= 1;
		end
		135:begin // lower RF
			op[18:15] <= LI;
			op[14:10] <= RF;
			op[9:2] <= 0;
		end
		136:begin // Jump to [A]
			op[18:15] <= JMP;
			op[7:0] <= 26;
		end
		137:begin // [From is Depth Counter 0?(117) init all FLAGS] lower UF
			op[18:15] <= LI;
			op[14:10] <= UF;
			op[9:2] <= 0;
		end
		138:begin // lower FF
			op[18:15] <= LI;
			op[14:10] <= FF;
			op[9:2] <= 0;
		end
		139:begin // lower RF
			op[18:15] <= LI;
			op[14:10] <= RF;
			op[9:2] <= 0;
		end
		140:begin // Jump to [A]
			op[18:15] <= JMP;
			op[7:0] <= 26;
		end
		141:begin // [From (34)] did R 3 times?
			op[18:15] <= CHECK;
			op[14:10] <= RC;
			op[9:2] <= 0;
		end
		142:begin // (if true)go to Depth Counter check (if false)RC DEC
			op[18:15] <= JNZ;
			op[7:0] <= 183;
		end
		143:begin // R Counter DEC
			op[18:15] <= DEC;
			op[14:10] <= RC;
			op[4:0] <= RC;
		end
		144:begin // LI R to register
			op[18:15] <= LI;
			op[14:10] <= STEP;
			op[9:2] <= {4'h0,RL_90};
			op[1:0] <= 0;
		end
		145:begin // STORE R to memory
			op[18:15] <= STORE;
			op[9:5] <= STEPADDR;
			op[4:0] <= STEP;
		end
		146:begin // INC STEPADDR
			op[18:15] <= INC;
			op[14:10] <= STEPADDR;
			op[4:0] <= STEPADDR;
		end
		147:begin // execute R
			op[18:15] <= RL_90;
			op[14:10] <= TMP;
			op[4:0] <= 1;
		end
		148:begin
			op[18:15] <= RL_90;
			op[14:10] <= 1;
			op[4:0] <= 5;
		end
		149:begin
			op[18:15] <= RL_90;
			op[14:10] <= 5;
			op[4:0] <= 6;
		end
		150:begin
			op[18:15] <= RL_90;
			op[14:10] <= 6;
			op[4:0] <= 2;
		end
		151:begin
			op[18:15] <= MOV;
			op[14:10] <= 2;
			op[4:0] <= TMP;
		end
		152:begin // Depth Counter DEC
			op[18:15] <= DEC;
			op[14:10] <= DC;
			op[4:0] <= DC;
		end
		153:begin // Face Check
			op[18:15] <= CHECK;
			op[14:10] <= 0;
			op[9:2] <= 8'b000_00_000;
		end
		154:begin // (if true)next face check (if false)go to DC check
			op[18:15] <= ZNJ;
			op[7:0] <= 169;
		end
		155:begin
			op[18:15] <= CHECK;
			op[14:10] <= 1;
			op[9:2] <= 8'b001_00_000;
		end
		156:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 169;
		end
		157:begin
			op[18:15] <= CHECK;
			op[14:10] <= 2;
			op[9:2] <= 8'b010_00_101;
		end
		158:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 169;
		end
		159:begin
			op[18:15] <= CHECK;
			op[14:10] <= 3;
			op[9:2] <= 8'b011_00_101;
		end
		160:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 169;
		end
		161:begin
			op[18:15] <= CHECK;
			op[14:10] <= 4;
			op[9:2] <= 8'b100_00_000;
		end
		162:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 169;
		end
		163:begin
			op[18:15] <= CHECK;
			op[14:10] <= 5;
			op[9:2] <= 8'b101_00_000;
		end
		164:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 169;
		end
		165:begin
			op[18:15] <= CHECK;
			op[14:10] <= 6;
			op[9:2] <= 8'b110_00_101;
		end
		166:begin
			op[18:15] <= ZNJ;
			op[7:0] <= 169;
		end
		167:begin
			op[18:15] <= CHECK;
			op[14:10] <= 7;
			op[9:2] <= 8'b111_00_101;
		end
		168:begin // (if true)go to STORE procedure (if false)DC check
			op[18:15] <= JNZ;
			op[7:0] <= 240;
		end
		169:begin // is Depth Counter 0?
			op[18:15] <= CHECK;
			op[14:10] <= DC;
			op[9:2] <= 0;
		end
		170:begin // (if true)execute L (if false)go to init all FLAGs
			op[18:15] <= ZNJ;
			op[7:0] <= 190;
		end
		171:begin // execute L
			op[18:15] <= RL_270;
			op[14:10] <= TMP;
			op[4:0] <= 1;
		end
		172:begin
			op[18:15] <= RL_270;
			op[14:10] <= 1;
			op[4:0] <= 2;
		end
		173:begin
			op[18:15] <= RL_270;
			op[14:10] <= 2;
			op[4:0] <= 6;
		end
		174:begin
			op[18:15] <= RL_270;
			op[14:10] <= 6;
			op[4:0] <= 5;
		end
		175:begin
			op[18:15] <= MOV;
			op[14:10] <= 5;
			op[4:0] <= TMP;
		end
		176:begin // raise RF
			op[18:15] <= LI;
			op[14:10] <= RF;
			op[9:2] <= 1;
		end
		177:begin // INC RC
			op[18:15] <= INC;
			op[14:10] <= RC;
			op[4:0] <= RC;
		end
		178:begin // INC DC
			op[18:15] <= INC;
			op[14:10] <= DC;
			op[4:0] <= DC;
		end
		179:begin // DEC STEPADDR
			op[18:15] <= DEC;
			op[14:10] <= STEPADDR;
			op[4:0] <= STEPADDR;
		end
		180:begin // LI 0 to STEP
			op[18:15] <= LI;
			op[14:10] <= STEP;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		181:begin // STORE 0 to memory
			op[18:15] <= STORE;
			op[9:5] <= STEPADDR;
			op[4:0] <= STEP;
		end
		182:begin // Jump to [A]
			op[18:15] <= JMP;
			op[7:0] <= 26;
		end
		183:begin // [From did R 3 times?] is Depth Counter 0?
			op[18:15] <= CHECK;
			op[14:10] <= DC;
			op[9:2] <= 0;
		end
		184:begin // (if true)go to execute L (if false)set RC to 3
			op[18:15] <= JNZ;
			op[7:0] <= 171;
		end
		185:begin // set RC to 3
			op[18:15] <= LI;
			op[14:10] <= RC;
			op[9:2] <= 3;
			op[1:0] <= 0;
		end
		186:begin // lower UF
			op[18:15] <= LI;
			op[14:10] <= UF;
			op[9:2] <= 0;
		end
		187:begin // lower FF
			op[18:15] <= LI;
			op[14:10] <= FF;
			op[9:2] <= 0;
		end
		188:begin // raise RF
			op[18:15] <= LI;
			op[14:10] <= RF;
			op[9:2] <= 1;
		end
		189:begin // Jump to [A]
			op[18:15] <= JMP;
			op[7:0] <= 26;
		end
		190:begin // [From is Depth Counter 0?(160) init all FLAGS] lower UF
			op[18:15] <= LI;
			op[14:10] <= UF;
			op[9:2] <= 0;
		end
		191:begin // lower FF
			op[18:15] <= LI;
			op[14:10] <= FF;
			op[9:2] <= 0;
		end
		192:begin // lower RF
			op[18:15] <= LI;
			op[14:10] <= RF;
			op[9:2] <= 0;
		end
		193:begin // Jump to [A]
			op[18:15] <= JMP;
			op[7:0] <= 26;
		end
		194:begin // [[[B]]] init all FLAGs lower UF
			op[18:15] <= LI;
			op[14:10] <= UF;
			op[9:2] <= 0;
		end
		195:begin // lower FF
			op[18:15] <= LI;
			op[14:10] <= FF;
			op[9:2] <= 0;
		end
		196:begin // lower RF
			op[18:15] <= LI;
			op[14:10] <= RF;
			op[9:2] <= 0;
		end
		197:begin // DEC STEPADDR
			op[18:15] <= DEC;
			op[14:10] <= STEPADDR;
			op[4:0] <= STEPADDR;
		end
		198:begin // get previous process
			op[18:15] <= LOAD;
			op[14:10] <= STEP;
			op[9:5] <= STEPADDR;
		end
		199:begin // was R previous?
			op[18:15] <= CHECK;
			op[14:10] <= STEP;
			op[9:2] <= {4'h0,RL_90};
			op[1:0] <= 0;
		end
		200:begin // (if true)execute L (if false)go to was F previous?
			op[18:15] <= ZNJ;
			op[7:0] <= 213;
		end
		201:begin // execute L
			op[18:15] <= RL_270;
			op[14:10] <= TMP;
			op[4:0] <= 1;
		end
		202:begin
			op[18:15] <= RL_270;
			op[14:10] <= 1;
			op[4:0] <= 2;
		end
		203:begin
			op[18:15] <= RL_270;
			op[14:10] <= 2;
			op[4:0] <= 6;
		end
		204:begin
			op[18:15] <= RL_270;
			op[14:10] <= 6;
			op[4:0] <= 5;
		end
		205:begin
			op[18:15] <= MOV;
			op[14:10] <= 5;
			op[4:0] <= TMP;
		end
		206:begin // INC RC
			op[18:15] <= INC;
			op[14:10] <= RC;
			op[4:0] <= RC;
		end
/*		207:begin // DEC STEPADDR
			op[18:15] <= DEC;
			op[14:10] <= STEPADDR;
			op[4:0] <= STEPADDR;
		end*/
		208:begin // LI 0 to STEP
			op[18:15] <= LI;
			op[14:10] <= STEP;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		209:begin // STORE 0 to memory
			op[18:15] <= STORE;
			op[9:5] <= STEPADDR;
			op[4:0] <= STEP;
		end
		210:begin // INC DC
			op[18:15] <= INC;
			op[14:10] <= DC;
			op[4:0] <= DC;
		end
		211:begin // go to [B]
			op[18:15] <= JMP;
			op[7:0] <= 194;
		end
		212:begin // get previous process
			op[18:15] <= LOAD;
			op[14:10] <= STEP;
			op[9:5] <= STEPADDR;
		end
		213:begin // was F previous?
			op[18:15] <= CHECK;
			op[14:10] <= STEP;
			op[9:2] <= {4'h0,FB_90};
			op[1:0] <= 0;
		end
		214:begin // (if true)execute B (if false)go to was U previous?
			op[18:15] <= ZNJ;
			op[7:0] <= 227;
		end
		215:begin // execute B
			op[18:15] <= FB_270;
			op[14:10] <= TMP;
			op[4:0] <= 0;
		end
		216:begin
			op[18:15] <= FB_270;
			op[14:10] <= 0;
			op[4:0] <= 1;
		end
		217:begin
			op[18:15] <= FB_270;
			op[14:10] <= 1;
			op[4:0] <= 5;
		end
		218:begin
			op[18:15] <= FB_270;
			op[14:10] <= 5;
			op[4:0] <= 4;
		end
		219:begin
			op[18:15] <= MOV;
			op[14:10] <= 4;
			op[4:0] <= TMP;
		end
		220:begin // INC FC
			op[18:15] <= INC;
			op[14:10] <= FC;
			op[4:0] <= FC;
		end
/*		221:begin // DEC STEPADDR
			op[18:15] <= DEC;
			op[14:10] <= STEPADDR;
			op[4:0] <= STEPADDR;
		end*/
		222:begin // LI 0 to STEP
			op[18:15] <= LI;
			op[14:10] <= STEP;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		223:begin // STORE 0 to memory
			op[18:15] <= STORE;
			op[9:5] <= STEPADDR;
			op[4:0] <= STEP;
		end
		224:begin // INC DC
			op[18:15] <= INC;
			op[14:10] <= DC;
			op[4:0] <= DC;
		end
		225:begin // go to [F]
			op[18:15] <= JMP;
			op[7:0] <= 32;
		end
		226:begin // get previous process
			op[18:15] <= LOAD;
			op[14:10] <= STEP;
			op[9:5] <= STEPADDR;
		end
		227:begin // was U previous?
			op[18:15] <= CHECK;
			op[14:10] <= STEP;
			op[9:2] <= {4'h0,UD_90};
			op[1:0] <= 0;
		end
		228:begin // (if true)execute D (if false)go to [C]
			op[18:15] <= ZNJ;
			op[7:0] <= 240;
		end
		229:begin // execute D
			op[18:15] <= UD_270;
			op[14:10] <= TMP;
			op[4:0] <= 0;
		end
		230:begin
			op[18:15] <= UD_270;
			op[14:10] <= 0;
			op[4:0] <= 1;
		end
		231:begin
			op[18:15] <= UD_270;
			op[14:10] <= 1;
			op[4:0] <= 2;
		end
		232:begin
			op[18:15] <= UD_270;
			op[14:10] <= 2;
			op[4:0] <= 3;
		end
		233:begin
			op[18:15] <= MOV;
			op[14:10] <= 3;
			op[4:0] <= TMP;
		end
		234:begin // INC UC
			op[18:15] <= INC;
			op[14:10] <= UC;
			op[4:0] <= UC;
		end
/*		235:begin // DEC STEPADDR
			op[18:15] <= DEC;
			op[14:10] <= STEPADDR;
			op[4:0] <= STEPADDR;
		end*/
		236:begin // LI 0 to STEP
			op[18:15] <= LI;
			op[14:10] <= STEP;
			op[9:2] <= 0;
			op[1:0] <= 0;
		end
		237:begin // STORE 0 to memory
			op[18:15] <= STORE;
			op[9:5] <= STEPADDR;
			op[4:0] <= STEP;
		end
		238:begin // INC DC
			op[18:15] <= INC;
			op[14:10] <= DC;
			op[4:0] <= DC;
		end
		239:begin // go to [E]
			op[18:15] <= JMP;
			op[7:0] <= 29;
		end
		240:begin // [[[C]]] STORE Procedure
			op[18:15] <= STORE;
			op[9:5] <= 8;
			op[4:0] <= 0;
		end
		241:begin
			op[18:15] <= STORE;
			op[9:5] <= 9;
			op[4:0] <= 1;
		end
		242:begin
			op[18:15] <= STORE;
			op[9:5] <= 10;
			op[4:0] <= 2;
		end
		243:begin
			op[18:15] <= STORE;
			op[9:5] <= 11;
			op[4:0] <= 3;
		end
		244:begin
			op[18:15] <= STORE;
			op[9:5] <= 12;
			op[4:0] <= 4;
		end
		245:begin
			op[18:15] <= STORE;
			op[9:5] <= 13;
			op[4:0] <= 5;
		end
		246:begin
			op[18:15] <= STORE;
			op[9:5] <= 14;
			op[4:0] <= 6;
		end
		247:begin
			op[18:15] <= STORE;
			op[9:5] <= 15;
			op[4:0] <= 7;
		end
		248:begin
			op[18:15] <= JMP;
			op[7:0] <= 248;
		end


		endcase
	end
endmodule
