//NOTES:
//The "this" keyword is used to unambiguously refer to class properties, value parameters,
//local value parameters, or methods of the current instance. The "this" keyword denotes a
//predefined object handle that refers to the object that was used to invoke the 
//subroutine that this is used within.
//This keyword shall only be used within non-static class methods, 
//constraints, inlined constraint methods, or covergroups embedded within classes

//Base class
class packet;
   
  //class properties
               bit [31:0] addr;
               bit [31:0] data;
               bit        wr;
  protected string        pkt_type;
   
  //constructor
  function new(bit [31:0] addr,data,bit wr,string pkt_type);
    //addr = addr;
    //data = data;
    //wr = wr;
    //pkt_type = pkt_type;
    this.addr     = addr; 
    this.data     = data;
    this.wr       = wr;
    this.pkt_type = pkt_type;
  endfunction
   
  //method to display class properties
  function void display();
    $display("---------------------------------------------------------");
    $display("\t addr  = %0h",addr);
    $display("\t data  = %0h",data);
    $display("\t wr = %0h",wr);
    $display("\t pkt_type  = %0s",pkt_type);
    $display("---------------------------------------------------------");
  endfunction
   
endclass : packet

//Derived class
class extended extends packet;

  function new(bit [31:0] addr,data, bit wr, string pkt_type);
    super.new(addr,data,wr,pkt_type);
  endfunction

endclass

module test;
  packet pkt;
  extended ext; 
  initial begin
    $display("\nPacket 1 :");
    pkt = new(32'h10,32'hff,1,"1st_pkt");
    pkt.display();
    pkt = new(32'h20,32'h2f,0,"2nd_pkt");
    pkt.display();
    ext = new(32'h67,32'hBA,1,"3rd_pkt");
    ext.display();
  end
   
endmodule
