`timescale 1ps/1ps
`include "1_regbank.v"

module regbank_v1_tb();
    reg clk,rst;
    reg [31:0]wrData;
    reg [4:0] sr1,sr2,dr;
    wire [31:0] rdData1,rdData2;

    regbank_V1 regbank_instance1 (.clk(clk),.rst(rst),
    .wrData(wrData),.rdData1(rdData1),.rdData2(rdData2),
    .sr1(sr1),.sr2(sr2),.dr(dr));

    initial begin
        $dumpfile("reg.vcd");
        $dumpvars(0,regbank_v1_tb);

        clk<=1'b0;
        rst<=1'b1;
        #50 $finish;

    end

    initial begin
        #11 rst<=1'b0;
        #1 wrData<=32'd10; dr<=32'd9;
        #2 sr1<=32'd9;

        #3 wrData<=32'd19; dr<=32'd8;
        #2 sr1<=32'd0; sr2<=32'd8; 

        #3 wrData<=32'd11; dr<=32'd6;
        #5 wrData<=32'd20; dr<=32'd6;
        #2 sr1<=32'd8; sr2<=32'd6; 

    end



    //for clock
    always #5 clk<=~clk;

endmodule