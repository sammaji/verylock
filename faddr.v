module faddr (
    input a, b, cin, output s, output c
);
    wire t1, t2, t3, t4;
    xor (t1, a, b);
    xor (s, t1, cin);
    and (t3, t1, cin);
    and (t4, a, b);
    or (c, t3, t4);
endmodule

module faddr_tb;
    reg [2:0] in;
    wire sum, carry;

    faddr uut (
        .a(in[2]),
        .b(in[1]),
        .cin(in[0]),
        .s(sum),
        .c(carry)
    );

    initial begin
        for (integer i = 0; i < 8; i = i + 1) begin
            in = i[2:0];
            #10
            $display("in=%b, sum=%b, carry=%b", in, sum, carry);
        end
        $finish;
    end
endmodule
