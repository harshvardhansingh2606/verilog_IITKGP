//here the active reset plays a imp role thus we are using the for loop for it

module regbank_V1 (rdData1,rdData2,wrData,sr1,sr2,dr,clk,rst);
    input clk,rst;
    input [31:0] wrData;
    input [4:0] sr1,sr2,dr;
    output [31:0] rdData1,rdData2;

    //internal signals
    integer k;
    reg [31:0] regfile[31:0];

    //continuous assignment to rdData the data read from the regfile
    assign rdData1=regfile[sr1];
    assign rdData2=regfile[sr2];

    always @(posedge clk) begin
        if (rst) begin
            for (k=0;k<=31;k=k+1) begin
                regfile[k]<=31'b0;
            end
        end
        else begin
            regfile[dr]<=wrData;
        end
    end
    
endmodule
