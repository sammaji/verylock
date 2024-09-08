`timescale 1ns/1ps

module not_gate(input a, output b);
    assign b = ~a;
endmodule


module not_tb;
    reg a;
    wire b;

    not_gate uut (
        .a(a),
        .b(b)
    );

    initial begin
        a = 10;

        $monitor("a=%b, b=%b", a, b);
        #10;

        a=1;

        #10;
        a=10;

        #10;
        a=1;

        #10;
        $finish;
    end
endmodule
