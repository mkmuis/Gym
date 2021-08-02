module sv_task;

int x,y;//outputs
 
//task declared as static by default
//Automatic tasks allocate unique, stacked storage for each task call.
task automatic sum_auto(input int a,b,output int c);
  int d;
  #10;//allowed
  d++;
  $display($time,"\tValue of d = %0d",d);
  c = a+b+d;
endtask

//Static tasks share the same storage space for all task calls.
task static sum_static(input int a,b, output int c);
  int d;
  #15;
  d++;
  $display($time,"\tValue of d = %0d",d);
  c = a+b+d;
endtask

//Same even if value stored remains the same even sub-task called
task static sum_static1(input int a,b, output int c);
  int g;
  g++;
  dummy();
  $display($time,"\tValue of g = %0d",g);
  c = g;
endtask

task dummy();
endtask

initial begin

//Calling Automatic Task 1st time
$display("\n\t Calling of automatic task");
sum_auto(10,5,x);
$display($time,"\tValue of x = %0d",x);
//Calling Automatic Task 2nd time
sum_auto(10,5,x);
$display($time,"\tValue of x = %0d",x);

//Calling Static Task 1st time
$display("\n\t Calling of static task");
sum_static(10,5,y);
$display($time,"\tValue of x = %0d",y);
//Calling Static Task 2nd time
sum_static(10,5,y);
$display($time,"\tValue of x = %0d",y);

//Concurrent call of Automatic task
$display("\n\t Concurrent call of automatic task");
sum_auto(1,1,x);
fork
  sum_auto(1,1,x);
  sum_auto(1,1,x);
join

//Concurrent call of Static task
$display("\n\t Concurrent call of static task");
sum_static(1,1,x);
fork
  sum_static(1,1,x);
  sum_static(1,1,x);
join

//Concurrent call of Static task with dummy task
$display("\n\t Concurrent call of static task with dummy");
sum_static1(1,1,x);
fork
  sum_static1(1,1,x);
  sum_static1(1,1,x);
join
end
endmodule
