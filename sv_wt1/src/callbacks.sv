module test;

//Callback driver/Facade class implementing empty virtual method. 
//These methods are extended by specific drivers to implement
//scenarios on available hooks.
class Driver_CALLBACK;
  //dummy method
  virtual task driver(); endtask

endclass //Driver_CALLBACK

//Protocol driver
class Driver;

Driver_CALLBACK drv_cb_h = new();

task run();
  //Hook
  drv_cb_h.driver();
  //Protocol specific logic
  $display("Driver protocol execution.\n");
endtask //run

endclass //Driver

//Implement Callback method: Re-write driver()
class test extends Driver_CALLBACK;

task driver();
  $display("\n\nExecute test specific functionality.\n");
endtask 

endclass //test

Driver drv_h;
test t_h;

initial
begin
  drv_h = new();

  //To achieve callback
  t_h = new();
  drv_h.drv_cb_h = t_h;

  drv_h.run();

  #100;
  $display("End of simulation..\n");
  $finish;
end

endmodule //testbench
