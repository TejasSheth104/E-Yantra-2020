module AND_GATE_TEST_BENCH;
reg a; reg b;
wire out;
AND_GATE uut (.a(a) ,.b(b), .out(out ));
initial begin

a = 0; b = 0; #100;
a = 0; b = 1; #100;
a = 1; b = 0; #100;
a = 1; b = 1; #100;

end
endmodule
