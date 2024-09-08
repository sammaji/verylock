module sm(input din, input clk, output dout);
    localparam s1 = 2'b00;
    localparam s2 = 2'b01;
    localparam s3 = 2'b10;
    localparam s4 = 2'b11;

    reg cs, ns;
    
    always @(*) begin
