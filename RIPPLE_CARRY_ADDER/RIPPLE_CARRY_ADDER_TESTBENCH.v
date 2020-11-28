module RIPPLE_CARRY_ADDER_TESTBENCH ;
reg [1:0]a;
reg [1:0]b;
reg cin;
wire [1:0]sum;
wire c_out;

RIPPLE_CARRY_ADDER uut (.a(a), .b(b), .cin(cin), .sum(sum), .c_out(c_out));
initial begin

a = 2'b01; b = 2'b11; cin = 1'b1; #100;
a = 2'b11; b = 2'b11; cin = 1'b1; #100;
a = 2'b10; b = 2'b01; cin = 1'b0; #100;
a = 2'b00; b = 2'b11; cin = 1'b0; #100;
end
endmodule
