module dff(input d, clk);
   localparam s0 = 0;
   localparam s1 = 1;

   reg cs, ns;

   always @(cs or d) begin
       case (d)
           0: ns = s0;
           1: ns = s1;
       endcase
   end

   always @(posedge clk) begin
       cs <= ns;
   end
endmodule

module dff_tb;
    reg d, clk;
    dff uut(.d(d), .clk(clk));
    always #5 clk = ~clk;
    initial begin
        clk = 1;
        d = 0;
        #1 $monitor("d=%b, q[n]=%b, q[n+1]=%b", d, uut.cs, uut.ns);
        #10 d=1;
        #10 d=1;
        #10 d=0;
        #10 $finish;
    end
endmodule
