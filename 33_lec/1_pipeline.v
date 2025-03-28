module pipeline_ex1 (F,A,B,C,D,clk,rst);
    parameter N = 10;
    input clk,rst;
    input [N-1:0] A,B,C,D;
    output [N-1:0] F;

    reg [N-1:0] L12_x1, L12_x2, L12_D, L23_x3, L23_D, L_34_F;

    assign F=L_34_F;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            L12_x1<={N{1'b0}};
            L12_x2<={N{1'b0}};
            L12_D<={N{1'b0}};

            L23_x3<={N{1'b0}};
            L23_D<={N{1'b0}};

            L_34_F<={N{1'b0}};
        end
        else begin
            L12_x1<=A+B;
            L12_x2<=C-D;
            L12_D<=D;

            L23_x3<=L12_x1+L12_x2;
            L23_D<=L12_D;

            L_34_F<= L23_x3*L23_D;
        end
    end
endmodule