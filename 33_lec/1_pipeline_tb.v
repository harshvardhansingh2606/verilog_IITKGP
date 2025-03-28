`include "1_pipeline.v"

module pipeline_ex1_tb ();
parameter N=10;
reg [N-1:0] A,B,C,D;
reg clk,rst;
wire [N-1:0] F;

pipeline_ex1 pipeline_ex1_instance1 (.*);

initial begin
    $dumpfile("dumping.vcd");
    $dumpvars(0,pipeline_ex1_tb);
    rst<=1;
    clk<=0;
    A<=10'd0; B<=10'd0; C<=10'd0; D<=10'd0;
    #3 rst<=0;
    #297 $finish;
end

initial begin
    #5  A=10'd1; B<=10'd1; C<=10'd1; D<=10'd1;  
    #10  A=10'd5; B<=10'd2; C<=10'd1; D<=10'd1;  
    #10  A=10'd5; B<=10'd3; C<=10'd3; D<=10'd1;  
    #10  A=10'd6; B<=10'd6; C<=10'd6; D<=10'd2;  
    #10  A=10'd2; B<=10'd1; C<=10'd1; D<=10'd1;  
    #10  A=10'd1; B<=10'd0; C<=10'd0; D<=10'd1;  
    #10  A=10'd1; B<=10'd0; C<=10'd0; D<=10'd1;  
    #10  A=10'd1; B<=10'd0; C<=10'd0; D<=10'd1;  
end

initial begin
    repeat(10) begin
        #10 $display("time: %d, a: %d, b: %d, c: %d, d: %d, F: %d ",
        $time, A, B, C, D, F);
    end    
end


always #5 clk<=~clk;

endmodule