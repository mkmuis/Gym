
class Singleton;

  //You can change it
  string ConfigurableObject;

  static Singleton myObj;

  // Making constructor local restricts
  // any call to new() outside of the
  // class
  local function new();
  endfunction

  // Creator method
  static function Singleton getObject();
     if(myObj == null)
        myObj = new();
     return myObj;
  endfunction

endclass //Singleton

// Top Module      
module test;

  Singleton firstObj, secondObj;

  initial
  begin

    // Illegal call to local constructor
    //firstObj = new();
 
    firstObj  = Singleton::getObject();
    firstObj.ConfigurableObject = "Block X Test";
    $display("Object Status | First  Object Test: %s", 
    firstObj.ConfigurableObject);

    secondObj = Singleton::getObject();
    $display("Object Status | Second Object Test: %s", 
    secondObj.ConfigurableObject);
   end

endmodule //test


