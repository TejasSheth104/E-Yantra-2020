transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/RIPPLE_CARRY_ADDER {E:/RIPPLE_CARRY_ADDER/FULL_ADDER.v}
vlog -vlog01compat -work work +incdir+E:/RIPPLE_CARRY_ADDER {E:/RIPPLE_CARRY_ADDER/RIPPLE_CARRY_ADDER.v}

vlog -vlog01compat -work work +incdir+E:/RIPPLE_CARRY_ADDER {E:/RIPPLE_CARRY_ADDER/RIPPLE_CARRY_ADDER_TESTBENCH.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  RIPPLE_CARRY_ADDER_TESTBENCH

add wave *
view structure
view signals
run -all
