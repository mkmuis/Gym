//--------------
//A class is a type that includes data and subroutines 
//(functions and tasks) that operate on those data. 
//A class's data are referred to as class properties, and its 
//subroutines are called methods; both are members of the class.
//--------------

//Base class
class Packet;
  integer N = 12;
  integer K = 37;

  function void printN;
    $display("Packet::N is \t\t%0d",N);
  endfunction : printN

//1* Virtual methods provide prototypes for the methods that later override them
//2* For polymorphism to work, method prototype (method name, return type,
//   arguments) must be the same/
  virtual function void printK;
    $display("Packet::K is \t\t%0d", K);
  endfunction : printK

endclass : Packet

//Derived class
class Extended_Packet extends Packet;
  integer N = 57;
  integer H = 13;

  function void printN;
    $display("Extended_Packet::N is \t%0d",N);
  endfunction: printN

  function void printK;
    $display("Extended_Packet::K is \t%0d",H);
  endfunction: printK
endclass : Extended_Packet

//----------------
// Test
//----------------
module test;

initial begin

  //declare a variable of class Packet
  Packet          P1;
  Extended_Packet P2;
  Packet          P3;
  Packet          P4;

  //initialize variable
  P1 = new;
  P2 = new; 

  P1.printN;
  P1.printK;
  P2.printN;
  P2.printK;
  $display("");

  //Pass handle
  P1 = P2;
  P3 = P2;

  P1.printN;//Not overriden
  P1.printK;//Overriden when virtual method is used - latest derived method
  P2.printN;
  P2.printK;
  $display("");

  P3.printN;
  P3.printK;
  //Not constructed
  //P4.printN;

end

endmodule
