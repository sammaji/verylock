module mux4x1(
    input [3:0] in, input [1:0] s, output reg out
);
    always @(*) begin
        case (s)
            2'b00: out <= in[3];
            2'b01: out <= in[2];
            2'b10: out <= in[1];
            2'b11: out <= in[0];
        endcase
    end
endmodule


module mux4x1_tb;
    reg [3:0] in;
    reg [1:0] s;
    wire out;

    mux4x1 uut (
        .in(in),
        .s(s),
        .out(out)
    );

    initial begin
        in = 4'b0011; 
        for (integer i = 0; i < 4; i = i + 1) begin
            s = i[1:0];
            #10
            $display("in=%b, s=%b, out=%b", in, s, out);
        end

        $finish;
    end
endmodule