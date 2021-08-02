module test_case;

function void test_casez(logic [2:0] in);
  casez (in) //treat z as don't care 
    3'b1xx : $display("%0b Matched 1xx",in); //must be exact to match.
    3'bx1x : $display("%0b Matched x1x",in);
    3'bxx1 : $display("%0b Matched xx1",in);
    3'b1zz : $display("%0b Matched 1zz",in); //priority encoding because cases are not complete.
    3'bz1z : $display("%0b Matched z1z",in);
    3'bzz1 : $display("%0b Matched zz1",in);
  endcase 
endfunction

function void test_casex(logic [2:0] in);
  casex (in) //treat x & z as don't care
    3'b1xx : $display("%0b Matched 1xx",in); //must be exact to match.
    3'bx1x : $display("%0b Matched x1x",in);
    3'bxx1 : $display("%0b Matched xx1",in);
    3'b1zz : $display("%0b Matched 1zz",in); //priority encoding because cases are not complete.
    3'bz1z : $display("%0b Matched z1z",in);
    3'bzz1 : $display("%0b Matched zz1",in);
  endcase 
endfunction

initial begin

$display("\nCase Z\n");

#1 test_casez(3'b000);
#1 test_casez(3'b100);
#1 test_casez(3'b010);
#1 test_casez(3'b001);
#1 test_casez(3'b111); //Why int2 = 1'b1? 
$display("");
#1 test_casez(3'b1xx);
#1 test_casez(3'bx1x);
#1 test_casez(3'bxx1);
$display("");
#1 test_casez(3'b1zz); // z is don't care
#1 test_casez(3'bz1z);
#1 test_casez(3'bzz1);

$display("\nCase X\n");

#1 test_casex(3'b000);
#1 test_casex(3'b100);
#1 test_casex(3'b010);
#1 test_casex(3'b001);
#1 test_casex(3'b111);
$display("");
#1 test_casex(3'b1zz); //matches 1xx first
#1 test_casex(3'bz1z); //same same down here all
#1 test_casex(3'bzz1);
$display("");
#1 test_casex(3'b1xx);
#1 test_casex(3'bx1x);
#1 test_casex(3'bxx1);


end
endmodule
