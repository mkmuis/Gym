//The always @* is intended to infer a complete sensitivity list for both RTL simulation 
//and synthesis from the contents of the block, saving a designer from having to manually
//specify a sensitivity list to code combinational logic.
//However, it does not infer a complete sensitivity list when the always @* block 
//contains functions.Namely, it will not infer sensitivity to signals that are externally 
//referenced in a function or a task that is called from the always block. It will only 
//be sensitive to the signals passed into the function or task.
module test;
  logic a, b, c, always_d, always_comb_d;
 
  function logic my_func(input logic in_c);
    my_func = a | b | in_c;
  endfunction

  //always @* is only sensitive to changes to the arguments of a function
  always @*
    always_d = my_func(c);
 
  //always_comb is sensitive to changes within the content of a function
  ////////////////////////
  //Insert you code here//
  ////////////////////////
 
  initial begin
    $monitor("%0t: a = %d, b = %d, c = %d, always_d = %d, always_com_d = %d", $time, a, b, c, always_d, always_comb_d);
  end
  
  initial begin
    a = 0;
    b = 0;
    c = 0;
    #10 a = 1; //Notice that change on a, b does not trigger the always @* 
    #10 b = 1; //block to be reevaluated, but change on c does.
    #10 c = 1;
    #10 a = 0;
        b = 0;
        c = 0;
    #10 c = 1; //c changes 
  end
endmodule
