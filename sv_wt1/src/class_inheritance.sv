
//A member identified as local is available only to methods inside the class.
//Further, these local members are not visible within subclasses. Of course, 
//nonlocal methods that access local class properties or methods can be inherited 
//and work properly as methods of the subclass.

//A protected class property or method has all of the characteristics of 
//a local member, except that it can be inherited; it is visible to subclasses.

//----------------
// Base class 
//----------------
class Packet;

  bit           [31:0] src_addr;//public
  protected bit [ 2:0] pkt_type;//protected
  local bit            pkt_generated;//local visibility
  static bit           pkt_static;
  bit                  pkt_automatic;

  function void set_pkt_type();
    pkt_type = 3'h4;
  endfunction

  function void set_pkt_generated();
    pkt_generated = 1'b1;
  endfunction

  function void display_pkt_generated();
    $display("Success: calling local data within class of packet generated=%h",pkt_generated);//accessible
  endfunction

  function show(bit [31:0] a);
    $display("Values are %0d",a);
  endfunction

endclass

//----------------
// Derived class 
//----------------
class  ErrPacket extends Packet;

  function void display_pkt_type();
    $display("Success: calling protected data outside class protected data of packet type=%h",pkt_type);//accessible as protected
  endfunction

  function void display_pkt_generated();
    //$display("Unsuccesfull: calling local method outside class of packet generated %h", pkt_generated);
  endfunction

endclass

module test;

initial begin

  Packet    pkt;
  ErrPacket err_pkt;
  bit       success;

  err_pkt = new;//derived class object
  pkt = err_pkt;//pass handle to base class object  

  //Public member
  pkt.src_addr=32'h31;
  //Derived class also inherit the public members
  $display("\nSuccess: calling public member outside of class src_addr=%h",err_pkt.src_addr);

  //Protected member
  //$display("packet type=%h",pkt.pkt_type);//not visible to public
  pkt.set_pkt_type();//visible to base class
  err_pkt.display_pkt_type();//visible to derived class

  //Local member
  pkt.set_pkt_generated();
  //$display("packet generated=%b",pkt.pkt_generated);//Not visible to public
  pkt.display_pkt_generated();  

  $display("packet static=%b",pkt.pkt_static);
  pkt.pkt_static=1;
  pkt.show(Packet::pkt_static);//Hierarchical reference: legal

  //same as public
  $display("packet automatic=%b",pkt.pkt_automatic);
  pkt.pkt_automatic=1;
  $display("packet automatic=%b",pkt.pkt_automatic);
  //Hierarchical reference: illegal
  //$display("packet automatic=%b", Packet::pkt_automatic);

end

endmodule

