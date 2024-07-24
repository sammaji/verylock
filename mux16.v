module mux4x1s (
    input [3:0] in, input [1:0] s, output out
);
    wire [1:0] sbar;
    wire [3:0] t;
    not (sbar[1], s[1]), (sbar[0], s[0]);
    and (t[3], in[3], sbar[1], sbar[0]), 
        (t[2], in[2], sbar[1], s[0]), 
        (t[1], in[1], s[1], sbar[0]), 
        (t[0], in[0], s[1], s[0]);
    or (out, t[3], t[2], t[1], t[0]);
endmodule


module mux16x1s (
    input [15:0] in, input [3:0] s, output out
);
    wire [3:0] t;
    mux4x1s m1 (.in(in[3:0]), .s(s[1:0]), .out(t[0]));
    mux4x1s m2 (.in(in[7:4]), .s(s[1:0]), .out(t[1]));
    mux4x1s m3 (.in(in[11:8]), .s(s[1:0]), .out(t[2]));
    mux4x1s m4 (.in(in[15:12]), .s(s[1:0]), .out(t[3]));
    mux4x1s m5 (.in(t), .s(s[3:2]), .out(out));
endmodule


module mux16x1_tb;
    reg [15:0] in;
    reg [3:0] s;
    wire out;

    mux16x1s uut (
        .in(in),
        .s(s),
        .out(out)
    );

    initial begin
        in = 16'b0011_0000_0000_1110; 
        for (integer i = 0; i < 16; i = i + 1) begin
            s = i[3:0];
            #10
            $display("in=%b, s=%b, out=%b", in, s, out);
        end
        $finish;
    end
endmodule