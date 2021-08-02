module test;
int result;//outputs

// Automatic functions is re-entrant and have separate
// function variable scope for each function call

// Module functions are by default static, use automatic 
// identifier to make function re-entrant
function automatic int factorial(int num);
  //$display("num = %d",num);
  if(num > 1) begin
    factorial = factorial(num - 1) * num;//calling itself and minus num by 1
    //To see factorial of last call multiply by current num

    //only display if (num>1)
    //$display("factorial = %d, num = %d",factorial,num);
  end
  else
    factorial = 1;
endfunction

//Static function
function int factorial_st(int num);
  //$display("num = %d", num);
  //#10;//forbidden
  if(num > 1) begin
    factorial_st = factorial_st(num - 1) * num;
    //$display("factorial = %d, num = %d",factorial_st,num);
  end
  else
    factorial_st = 1;
endfunction

   initial
   begin
      
      $display("\n\n\tFactorial from 1 to 5..\n");
      $display("\tAutomatic Function call");

      for(int i = 1; i < 6; i++)
      begin

         // Function calls itself recursively with different 
         // variable scope for 'int num' each time
         result = factorial(i);

         $display("\t%0d factorial = %0d", i, result);
      end
      
			$display("\n\tStatic Function call");

      for(int i = 1; i < 6; i++)
      begin

         // Function calls itself recursively and remain the last 
         // scope for 'int num'
         result = factorial_st(i);

         $display("\t%0d factorial = %0d", i, result);
      end

      $display("\n\tEnd of simulation..\n\n");

   end //initial

endmodule //test
