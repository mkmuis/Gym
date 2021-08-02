//////////////////////////////////////////////////////////////////////////
/// Follow the instructions, complete the following task/initial block ///
//////////////////////////////////////////////////////////////////////////

module test;

//bit, byte, logic
task test_data_types;
  //Variable initialized to 0 if initial value is not specified, 
  //default to 0 for x & z
  bit bit_var; //2 state: 0,1
  logic signed logic_var; //similar to reg
  byte signed byte_var; //same with bit but have 8 bits or its just a 8bit integer
  
  //to see what it looks like when initiated
  $display("bit_var=%b logic_var=%b byte_var=%h",bit_var, logic_var,byte_var);
  
  //what happens when you assign z to these variables
  logic_var = 'bz; 
  bit_var = 'bz; 
  byte_var = 'bz;
  $display("bit_var=%b logic_var=%b, byte_var=%h",bit_var, logic_var, byte_var);
  
  //what happens when you assign values to signed variables
  logic_var = 'b10000001; //-1
  byte_var = 'b10000001;//-127 after 2 complements
  $display("bit_var=%b logic_var=%d, byte_var=%0d",bit_var, logic_var, byte_var);

endtask
 
//User Defined Types
task test_user_defined_types;
  //64-bit signed datatype
  typedef longint unsigned uint64; //unsigned & signed
  uint64 abc;
  abc = 64'h8FFF_FFFF_FFFF_FFFF;
  $display("unit64 abc = %h",abc);
endtask

//Equality operator difference
task test_equality_operator;
  logic [2:0] abc, def; 
  abc= 3'b01x;
  def= 3'b01x;

  //logical-equality: if one operands is x/z, result is x.
  if (abc == def) begin
    $display(" abc and def equal (==) eq=%b ",(abc==def));
  end else begin
    $display(" abc and def not equal (==) eq=%b",(abc==def));
  end
  //case-equality: match according to x/z 
  if(abc === def) begin
    $display(" abc and def equal (===) eq=%b ",(abc===def));
  end else begin
    $display(" abc and def not equal (===)");
  end

endtask

//Run Test
initial begin
  $display("\nCalling task test_data_types()");

  $display("\nCalling task test_user_defined_types()");

  $display("\nCalling task test_equality_operator()");

end

endmodule: test
