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
        #10;
        $display("a=%b, b=%b", a, b);

        a=1;
        #10;
        $display("a=%b, b=%b", a, b);

        $finish;
    end
endmodule