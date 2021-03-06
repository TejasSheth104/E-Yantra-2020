module RIPPLE_CARRY_ADDER(
	input[1:0]a,b,
	input cin,
	output[1:0]sum,
	output c_out
);
wire c1;

FULL_ADDER FA0(a[0],b[0], cin, sum[0]);
FULL_ADDER FA1(a[1],b[1], sum[1], c_out);
endmodule
