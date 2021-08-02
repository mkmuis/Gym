module test();

reg [7:0] sum,a,b;
reg       parity;
logic     clk = 0;
reg       rst = 0;

initial begin
  $monitor ("%0t clk = %b rst = %b a = %h b = %h sum = %h parity = %b", 
  $time, clk, rst, a, b, sum, parity);
  #1 rst = 1; //event dependent on simulator on time @1
  #5 rst = 0;
  #2 a = 1;
  #2 b = 1;
  #2 a = 10;
  #2 a = 9;
  #2 $finish;
end

//Clock Generation
always #1 clk++;

//always_ff block for adder
always_ff @(posedge clk or posedge rst)
begin
  if(rst) begin
    sum    <= 0;
    parity <= 0;
    $display("%0t clk = %b rst = %b, Reset is asserted BLOCK 1",
    $time, clk, rst);
  end else begin
    sum    <=  b + a;
    parity <=  ^(b + a);
  end
end
//Second always_ff block 
always_ff @(posedge clk or posedge rst)
begin
  if(rst) begin
    $display("%0t clk = %b rst = %b, Reset is asserted BLOCK 2",
    $time, clk, rst);
  end
end

endmodule
