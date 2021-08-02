module test;

//Associative array indexed with integer
function void test_assoc_array(); //no return value
  //An associative array of integers indexed with some string
  int assoc_test[string]; //type array_name[index_type]
  string indx;
  assoc_test["Hello SystemVerilog"] = 3;
  assoc_test["123"] = 1;
  assoc_test["A"] = 2;

  $display("\nString index");
  //Methods=> first(ref index)
  //assigns to the given index var the value of the 1st index 
  //returns 0 for empty array
  if(assoc_test.first(indx)) begin
    do begin
      $display("assoc_test[%s]=%0d",indx,assoc_test[indx]);
    //Methods=> next(ref next)
    //Finds the largest index whose value is smaller than the given index
    end while (assoc_test.next(indx));
  end

endfunction

function void test_assoc_array_anytype();
  //An associative array of integers indexed by any type
  int assoc_test[*]; //type array_name[anytype using *]
  assoc_test["1"] = 1;
  assoc_test["a"] = 2;
  assoc_test["$"] = 3;

  $display("\nIndex type of any");
  $display("assoc_test[\"1\"]=%0d",assoc_test["1"]);
  $display("assoc_test[\"a\"]=%0d",assoc_test["a"]);
  $display("assoc_test[\"$\"]=%0d",assoc_test["$"]);

endfunction

initial begin
  test_assoc_array();
  test_assoc_array_anytype();
end

endmodule: test
