module jkff(input j, k, clk);
    localparam s0 = 0;
    localparam s1 = 1;
    
    reg cs, ns;

    always @(cs or k) begin
        case (j)
            0: ns = s0;
            1: ns = s1;
        endcase
    end

    always @(cs or j) begin
        case (k)
            0: ns = s1;
            1: ns = s0;
        endcase
    end

    always @(posedge clk) begin
        cs <= ns;
    end
endmodule

module jkff_tb;
    reg j, k, clk;
    jkff uut(.j(j), .k(k), .clk(clk));

    always #5 clk = ~clk;
    initial begin
        clk = 0;
        j=0;
        k=0;
        
        #1 $monitor("j=%b, k=%b, q[n]=%b, q[n+1]=%b", j, k, uut.cs, uut.ns);
        #10 k=1;
        #10 begin j=1; k=0; end
        #10 begin j=1; k=1; end
        #10 begin j=0; k=1; end
        #10 $finish;
    end
endmodule
