`timescale 1ns/1ns

module Comparator_4_bit_tb_Vector;

logic [3:0]Input_A;
logic [3:0]Input_B;
logic A_Greater;
logic Equal;
logic B_Greater;

logic A_Greater_tb;
logic Equal_tb;
logic B_Greater_tb;
logic [5:0]i;

logic [3:0]error;

integer file_id;

Four_Bit_Comparator_verilog uut(
	.A(Input_A),
	.B(Input_B),
	.A_Greater(A_Greater),
	.B_Greater(B_Greater),
	.Equal(Equal)
);


logic[10:0] test_vector[15:0];

initial
	begin
	$readmemb("Test_Bench_Vector.txt", test_vector); 
	i = 0;
	error = 0;
	end

always
	begin
		#10;
		{Input_A , Input_B, A_Greater_tb , Equal_tb , B_Greater_tb} = test_vector[i];
		$display ("Input A = %b", {Input_A}, " Input B = %b", {Input_B}, " Expected Output = %b", {A_Greater_tb , Equal_tb , B_Greater_tb});
	 	
	
		#10;
		if(A_Greater_tb !== A_Greater)
			begin
				$display ("Wrong Output for Input: Input A = %b, Input B = %b, Expected Output(%b) != Output(%b)", {Input_A} , {Input_B}, {A_Greater_tb , Equal_tb , B_Greater_tb} , {A_Greater , Equal , B_Greater});
				error = error + 1;
			end
			
			if(Equal_tb !== Equal)
			begin
				$display ("Wrong Output for Input: Input A = %b, Input B = %b, Expected Output(%b) != Output(%b)", {Input_A} , {Input_B}, {A_Greater_tb , Equal_tb , B_Greater_tb} , {A_Greater , Equal , B_Greater});
				error = error + 1;
			end
			
			if(B_Greater_tb !== B_Greater)
			begin
				$display ("Wrong Output for Input: Input A = %b, Input B = %b, Expected Output(%b) != Output(%b)", {Input_A} , {Input_B}, {A_Greater_tb , Equal_tb , B_Greater_tb} , {A_Greater , Equal , B_Greater});
				error = error + 1;
			end
		i = i + 1;
		if (i==16)
			begin
				if (error == 0)
				begin
					file_id = $fopen("Test.txt","w");
					$fwrite(file_id, "%02h","CONGRATULATIONS YOUR DESIGN WORKS FINE", "%02h",{file_id} );
					$fclose(file_id);
					$display ("CONGRATULATIONS YOUR DESIGN WORKS FINE");
				end
				else
				begin
					file_id = $fopen("Test.txt","w");
					$fwrite(file_id, "%02h","ERROR ENCOUNTERED IN YOUR DESIGN", "%02h",{file_id} );
					$fclose(file_id);
					$display ("ERROR ENCOUNTERED IN YOUR DESIGN");
				end
				i = 0;
		//$stop;
		end
	end
	
endmodule
