// Package declaration
// Can also be an individual file 

package common_utils_pkg;
  parameter title = "Package import";
  enum {enum_name1, enum_name2, enum_name3} enum_var;
  enum bit[2:0] {IDLE=3'b001, START=3'b010, STOP=3'b100} state;

  class enum_class;
    function display_example();
      //Constant Expression, cannot change
      parameter title = "Example only function";
      parameter pi = 1;
      enum_var = enum_var.first;
      $display("enum_var=%s val=%0.d",enum_var.name, enum_var);
      enum_var = enum_var.next;
      $display("enum_var=%s val=%0.d",enum_var.name, enum_var);
      enum_var = enum_var.next;
      $display("enum_var=%s val=%0.d\n",enum_var.name, enum_var);
    endfunction

  endclass
endpackage

//Main module that can import  package or reference using scope resolution operator
module test;
  import common_utils_pkg::*;
  bit pi;
  
  initial begin
    enum_class ec;
    ec = new;

    $display("\n%s\n", common_utils_pkg::title);
    $display(ec.display_example.title);
    //ec.display_example.pi = 2;//forbidden
    pi = ec.display_example.pi;
    $display(pi);
    
    //Package class function call
    ec.display_example();
  end  
endmodule
