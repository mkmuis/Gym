
#######################################################
### Task: Utilize the makefile to do different test ###
#######################################################

data_types:
	vcs -sverilog ../src/data_types.sv
	./simv

assoc_array:
	vcs -sverilog ../src/assoc_array.sv
	./simv

task:
	vcs -sverilog ../src/task.sv
	./simv

function:
	vcs -sverilog ../src/function.sv
	./simv

always_comb:
	vcs -sverilog ../src/always_comb.sv
	./simv

always_ff:
	vcs -sverilog ../src/always_ff.sv
	./simv

case_x_z:
	vcs -sverilog ../src/case_x_z.sv
	./simv

class:
	vcs -sverilog ../src/class.sv
	./simv

inheritance:
	vcs -sverilog ../src/class_inheritance.sv
	./simv

shallow_vs_deep:
	vcs -sverilog ../src/shallow_vs_deep_copy.sv
	./simv

class_abs:
	vcs -sverilog ../src/class_abs.sv
	./simv

callback:
	vcs -sverilog ../src/callbacks.sv
	./simv

singleton:
	vcs -sverilog ../src/singleton_object.sv
	./simv

this:
	vcs -sverilog ../src/this.sv
	./simv

package:
	vcs -sverilog ../src/package.sv
	./simv

#Example files removal make targets
clean:
	rm -rf csrc race* simv* ucli.key

