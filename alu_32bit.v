module alu_32bit(
input  [31:0] a,
input  [31:0] b,
input  [3:0] alu_sel,
output reg [31:0] out
);

always @(*) begin
    out = 32'b0;   // default assignment

    case(alu_sel)
        4'b0000: out = a & b; 
        4'b0001: out = a | b; 
        4'b0010: out = a ^ b; 
        4'b0011: out = ~(a | b); 
        4'b0100: out = ~(a & b); 
        4'b0101: out = a;   
        4'b0110: out = b;
        4'b0111: out = ~a;  
        4'b1000: out = ~b;
        4'b1001: out = a + b;
        4'b1010: out = a - b;
        4'b1011: out = a << 1;
        4'b1100: out = a >> 1;
        4'b1101: out = $signed(a) >>> 1;
        4'b1110: out = ($signed(a) < $signed(b)) ? 32'b1 : 32'b0;
        4'b1111: out = (a == b) ? 32'b1 : 32'b0;
    endcase
end

endmodule
