module jkff(input j, k, clk, output reg q);
  localparam s0 = 0;
  localparam s1 = 1;

  initial begin q=0; end

  always @(posedge clk) begin
    case ({j,k})
      2'b00: q <= q;
      2'b01: q <= s0;
      2'b10: q <= s1;
      2'b11: q <= ~q;
    endcase
  end
endmodule

module jkff_tb;
    reg j, k, clk;
    wire q;

    jkff uut(.j(j), .k(k), .clk(clk), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 1;
        j=0;
        k=0;

        #1 $monitor("j=%b, k=%b, q=%b", j, k, q);
        #10 k=1;
        #10 begin j=1; k=0; end
        #10 begin j=0; k=1; end
        #10 begin j=1; k=1; end
        #10 $finish;
    end
endmodule
