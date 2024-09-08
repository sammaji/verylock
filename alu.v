module alu16(a, b, op, out);
    input [7:0] a, b;
    input [3:0] op;
    
    reg [7:0] res;
    output [7:0] out; 

    assign out = res;
    
    always @(*) begin
        case (op)
            4'b0000: res = a+b;
            4'b0001: res = a-b;
            4'b0010: res = a*b;
            4'b0011: res = a/b;
            4'b0100: res = a<<b; // rt shift
            4'b0101: res = a>>b; // lft shift
            4'b0110: res = {a[6:0], a[7]}; // rt rotation (msb to end)
            4'b0111: res = {a[0], a[7:1]}; // lft rotation (lsb to front)
            4'b1000: res = a & b;
            4'b1001: res = a|b;
            4'b1010: res = a^b;
            4'b1011: res = ~(a|b);
            4'b1100: res = ~(a&b); 
            4'b1101: res = ~(a^b);
            4'b1110: res = (a>b)?1:0;
            4'b1111: res = (a==b)?1:0;
            default: res = a+b;
        endcase
    end
endmodule


module alu16_tb;
    reg [7:0] a, b;
    reg [3:0] op;
    wire [7:0] out;

    alu16 uut(
        .a(a),
        .b(b),
        .op(op),
        .out(out)
    );

    initial begin 
    a = 8'b00100111;
    b = 8'b10111000;
    for (integer i=0; i<16; i=i+1) begin
        op = i[3:0];
        #10
        $display("a=%b, b=%b, op=%b, out=%b", a, b, op, out);
    end 
    $finish;
    end
endmodule