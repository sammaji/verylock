module dff(clk, d, q);
    input clk, d;
    output reg q;

    initial q = 0;

    always @(posedge clk) begin
        q <= d;
    end
endmodule


module dff_tb(
    output reg clk, d,
    input wire q
);
    initial begin
        clk = 1'b0;
        d = 1'b0;
    end

    always #5 clk = ~clk;

    always @(posedge clk) begin
        #8 d = 1'b1;
        #8 d = 1'b0;
        #8 d = 1'b1;
        #8 d = 1'b0;
        #8 $finish;
    end
endmodule


module dff_wb;
    wire clk, d, q;
   
    initial begin
        $dumpfile("dff.vcd");
        $dumpvars(0,dff_wb);
        $monitor($time, "c=%b d=%b q=%b", clk, d, q);
    end
    dff uut (clk, d, q);
    dff_tb tb(clk, d, q); 
endmodule
