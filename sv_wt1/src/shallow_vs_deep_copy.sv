//Shallow vs Deep NewCopy

class ReadWrite;

  bit rd;
  bit wr;
  bit [7:0] addr;

  //to perform deep NewCopy on ReadWrite
  function ReadWrite NewCopy();
    //Create class object
    //NewCopy is handle of class ReadWrite
    NewCopy      = new();
    NewCopy.rd   = this.rd;
    NewCopy.wr   = this.wr;
    NewCopy.addr = this.addr;
  endfunction

endclass //ReadWrite

class Packet;

  int data;
  ReadWrite rw1 = new();

  function Packet NewCopy();
    NewCopy = new();
    NewCopy.data = this.data;
    NewCopy.rw1 = rw1.NewCopy();   
  endfunction 
endclass //Packet

module test;

// Copy method not implemented in Packet/ReadWrite class
Packet pkt1, pkt2;
Packet pkt3, pkt4;

initial
begin

  $display("\n\n\tShallow Copy");
  // Create packet 1
  pkt1 = new();
  pkt1.data = 'hFAFA;
  pkt1.rw1.wr = 'b1;
  pkt1.rw1.rd = 'b0;
  pkt1.rw1.addr = 'hB;

  // Performs shallow copy 
  pkt2 = new pkt1;
  pkt2.data = 'hAFAF;

  // pkt1 and pkt2 points to same object of ReadWrite class: pkt2 = new pkt1
  // Updating sub-class field(ReadWrite::value) in pkt2 changes pkt1 sub-class field
  // pkt1 and pkt2 share the same memory on properties (rd, wr, addr) in ReadWrite class
  pkt2.rw1.addr = 'h2; //same same
  //pkt1.rw1.addr = 'h3; //same same

  $display("\tPacket 1: Data %h, Read: %b, Write: %b, Address: %h", 
  pkt1.data, pkt1.rw1.rd, pkt1.rw1.wr, pkt1.rw1.addr);
  $display("\tPacket 2: Data %h, Read: %b, Write: %b, Address: %h\n", 
  pkt2.data, pkt2.rw1.rd, pkt2.rw1.wr, pkt2.rw1.addr);

  $display("\tDeep Copy");
   
  // Create packet 3
  pkt3 = new();
  pkt3.data = 'hABAB;
  pkt3.rw1.wr = 'b1;
  pkt3.rw1.rd = 'b0;
  pkt3.rw1.addr = 'h3;

  // Performs deep copy
  pkt4 = pkt3.NewCopy();

  //Changing packet 4 values
  pkt4.data = 'hBABA;
  pkt4.rw1.wr = 'b0;
  pkt4.rw1.rd = 'b1;
  pkt4.rw1.addr = 'h5;

  $display("\tPacket 3: Data %h, Read: %b, Write: %b, Address: %h", 
  pkt3.data, pkt3.rw1.rd, pkt3.rw1.wr, pkt3.rw1.addr);
  $display("\tPacket 4: Data %h, Read: %b, Write: %b, Address: %h\n", 
  pkt4.data, pkt4.rw1.rd, pkt4.rw1.wr, pkt4.rw1.addr);

end

endmodule //test

