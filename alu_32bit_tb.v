module alu_32bit_tb;

reg [31:0] a, b;
reg [3:0] alu_sel;
wire [31:0] out;

alu_32bit uut (
    .a(a),
    .b(b),
    .alu_sel(alu_sel),
    .out(out)
);

initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, alu_32bit_tb);

    // AND
    a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; alu_sel = 4'b0000; #10;

    // OR
    alu_sel = 4'b0001; #10;

    // XOR
    alu_sel = 4'b0010; #10;

    // NOR
    alu_sel = 4'b0011; #10;

    // NAND
    alu_sel = 4'b0100; #10;

    // A
    a = 32'h12345678; b = 32'h87654321; alu_sel = 4'b0101; #10;

    // B
    alu_sel = 4'b0110; #10;

    // NOT A
    alu_sel = 4'b0111; #10;

    // NOT B
    alu_sel = 4'b1000; #10;

    // ADD
    alu_sel = 4'b1001; #10;

    // SUB
    alu_sel = 4'b1010; #10;

    // SHL
    alu_sel = 4'b1011; #10;

    // SHR
    alu_sel = 4'b1100; #10;

    // ARITH SHR
    alu_sel = 4'b1101; #10;

    // SLT
    alu_sel = 4'b1110; #10;

    // EQUAL
    b = 32'h12345678; alu_sel = 4'b1111; #10;
    b = 32'h87654321; #10;

    $finish;
end

endmodule

