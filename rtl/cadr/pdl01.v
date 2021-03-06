// PDL0, PDL1 --- PDL BUFFER (RIGHT & LEFT)

module PDL01(clk, reset, prp, pdla, l, pwp, pdlo);

   input clk;
   input reset;

   input [31:0] l;
   input [9:0] pdla;
   input prp;
   input pwp;
   output [31:0] pdlo;

   ////////////////////////////////////////////////////////////////////////////////

   part_1kx32dpram_p i_PDL(.reset(reset),
                           .clk_a(clk), .address_a(pdla), .q_a(pdlo), .data_a(32'b0), .rden_a(prp), .wren_a(1'b0),
                           .clk_b(clk), .address_b(pdla), .q_b(), .data_b(l), .rden_b(1'b0), .wren_b(pwp));

endmodule
