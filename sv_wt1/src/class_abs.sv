//---------------------------------
// Virtual Class also known as Abstract Class
// To define set of common methods. 
// For e.g. uvm_object class in UVM Base Class Library is abstract class.
//---------------------------------

module test;

//A base class may be characterized as being abstract 
//by identifying it with the keyword virtual
//This class can be extended to form other sub-classes
//which can be instantiated

//Abstract Class
virtual class A;//A is base class, cannot be instantiated

//insert datatype logic/bit which can be inherited to derived class
            bit       abs_data = 1;
protected logic [2:0]        y = 3;

  virtual function void display();
    $display("Abstract class data: %b",abs_data);
  endfunction

  virtual function void calc(logic [2:0] a,b);
    logic [3:0] sub;
    sub = a + b - y;
    $display("Sum : %d",sub);
  endfunction

endclass

//Derived class from Abstract class
class B extends A;
  //Override Base class function
  function void calc(logic [2:0] a,b);
    logic [3:0] sum;
    sum = a + b;
    y = 7;
    $display("Sum : %d", sum);
    $display("Updated Y : %d",y);
  endfunction
endclass

initial
begin

//Object creation of virtual class is prohibited
//Abstract class can only be derived, creating an object
//of virtual class will leads to compilation error 

  //A a = new;//prohibited 
  B b = new;//derived
            //identifier declaration : B b;
            //class constructor : Create object of type B

  //Part 2
  B a; //see difference after and before copying objects
  B c = new;

  b.abs_data = 0;
  b.display();
  //b.y=1;//can or cannot? cannot
  b.calc(1,2);

  //Part 2
  a = b; //copy object
  a.display();
  c.display();

end

endmodule //test
