// PLATCH
//
// TK	CADR	PDL BUFFER LATCH

module PLATCH(pdl, pdlo);

   input [18:0] pdl;
   output [18:0] pdlo;

   ////////////////////////////////////////////////////////////////////////////////

   // mux PDL
   assign pdl = pdlo;

endmodule