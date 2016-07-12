//decoder.v
//changed dst,src0,src1 from 4bits to 5bits
/*
    [19:15] alu_op (5bits)
    [14:10] dst (5bits)
    [9:5] src1 (5bits)
    [4:0] src0 (5bits)
*/
module decoder(op,zf,pc_in,pc_we,dst,reg_we,src0,src1,sel1,sel2,data,alu_op,mem_we);
    input [19:0] op;
    input zf;
    output reg pc_we,reg_we,mem_we,sel1,sel2;
    output reg [4:0] alu_op;
    output reg [4:0] dst,src0,src1;
    output reg [7:0] data;
    output reg [7:0] pc_in;

    `include "def.h"

    always @(*) begin
        case (op[19:15])
// synopsys parallel_case full_case
/*
        AND : begin
            alu_op <= op[18:15];
            dst <= op[14:10];
            src1<=op[9:5];
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=0;
            data<=0;
            mem_we<=0;
        end

        OR : begin
            alu_op <= op[18:15];
            dst <= op[14:10];
            src1<=op[9:5];
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=0;
            data<=0;
            mem_we<=0;
        end

        ADD : begin
            alu_op <= op[18:15];
            dst <= op[14:10];
            src1<=op[9:5];
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=0;
            data<=0;
            mem_we<=0;
        end

        SUB: begin
            alu_op <= op[18:15];
            dst <= op[14:10];
            src1<=op[9:5];
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=0;
            data<=0;
            mem_we<=0;
        end
*/
        INC: begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=1;
            data<=0;
            mem_we<=0;
        end

        DEC: begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=1;
            data<=0;
            mem_we<=0;
        end
/*
        COMP: begin
            alu_op <= op[18:15];
            dst <= 0;
            src1<=op[9:5];
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=0;
            sel1<=0;
            sel2<=0;
            data<=0;
            mem_we<=0;
        end
*/
        CHECK: begin
            alu_op <= op[19:15];
            dst <= 0;
            src1<=op[14:10];
            src0<=0;
            pc_in<=0;
            pc_we<=0;
            reg_we<=0;
            sel1<=1;
            sel2<=0;
            data<=op[9:2];
            mem_we<=0;
        end

        LOAD: begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=op[9:5];
            src0<=0;
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=0;
            data<=0;
            mem_we<=0;
        end

        LI : begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=0;
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=1;
            sel2<=1;
            data<=op[9:2];
            mem_we<=0;
        end

        STORE: begin
            alu_op <= op[19:15];
            dst <= 0;
            src1<=op[9:5];
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=0;
            sel1<=0;
            sel2<=0;
            data<=0;
            mem_we<=1;
        end

        JMP : begin
            alu_op <=0;
            dst <=0;
            src1<=0;
            src0<=0;
            pc_in<=op[7:0];
            pc_we<=1;
            reg_we<=0;
            sel1<=0;
            sel2<=0;
            data<=0;
            mem_we<=0;
        end

        JNZ : begin
            alu_op <=0;
            dst <=0;
            src1<=0;
            src0<=0;
            pc_in<=op[7:0];
            pc_we<=zf;
            reg_we<=0;
            sel1<=0;
            sel2<=0;
            data<=0;
            mem_we<=0;
        end

        ZNJ : begin
            alu_op <=0;
            dst <=0;
            src1<=0;
            src0<=0;
            pc_in<=op[7:0];
            pc_we<=~zf;
            reg_we<=0;
            sel1<=0;
            sel2<=0;
            data<=0;
            mem_we<=0;
        end

        RL_90 : begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=1;
            data<=0;
            mem_we<=0;
        end

        UD_90 : begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=1;
            data<=0;
            mem_we<=0;
        end

        FB_90 : begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=1;
            data<=0;
            mem_we<=0;
        end
        
        RL_180 : begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=1;
            data<=0;
            mem_we<=0;
        end

        UD_180 : begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=1;
            data<=0;
            mem_we<=0;
        end

        FB_180 : begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=1;
            data<=0;
            mem_we<=0;
        end

        RL_270 : begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=1;
            data<=0;
            mem_we<=0;
        end

        UD_270 : begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=1;
            data<=0;
            mem_we<=0;
        end

        FB_270 : begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=1;
            data<=0;
            mem_we<=0;
        end

        MOV : begin
            alu_op <= op[19:15];
            dst <= op[14:10];
            src1<=0;
            src0<=op[4:0];
            pc_in<=0;
            pc_we<=0;
            reg_we<=1;
            sel1<=0;
            sel2<=1;
            data<=0;
            mem_we<=0;
        end

        default : begin
            pc_in<=0;
        end
        endcase
    end
endmodule


