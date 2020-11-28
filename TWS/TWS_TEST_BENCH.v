module TWS_TEST_BENCH;
reg s1; reg s2;
wire z;

TWS uut (.s1(s1), .s2(s2), .z(z));

initial begin
	s1 = 0; s2 = 0;#100;
	s1 = 1; s2 = 0;#100;
	s1 = 0; s2 = 1;#100;
	s1 = 0; s2 = 0;#100;
	#100;
end
endmodule

