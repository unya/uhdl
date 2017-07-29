// part_32x32dpram.v --- 32x32 dual port synchronous SRAM

`include "defines.vh"

module part_32x32dpram(reset,
                       clk_a, address_a, q_a, data_a, wren_a, rden_a,
                       clk_b, address_b, q_b, data_b, wren_b, rden_b);

   input reset;

   input clk_a;
   input [4:0] address_a;
   input [31:0] data_a;
   input wren_a, rden_a;

   input clk_b;
   input [4:0] address_b;
   input [31:0] data_b;
   input wren_b, rden_b;

   output [31:0] q_a;
   output [31:0] q_b;

`ifdef QUARTUS
   altsyncram ram
     (
      .address_a(address_a),
      .address_b(address_a),
      .clock0(clk_a),
      .data_a(data_a),
      .data_b(data_b),
      .q_b(q_a),
      .q_b(q_b),
      .rden_a(rden_a),
      .rden_b(rden_b),
      .wren_a(wren_a)
      .wren_b(wren_b)
      );

   defparam ram.address_reg_b = "CLOCK0",
     ram.maximum_depth = 0,
     ram.numwords_a = 32,
     ram.numwords_b = 32,
     ram.operation_mode = "DUAL_PORT",
     ram.outdata_reg_b = "UNREGISTERED",
     ram.ram_block_type = "AUTO",
     ram.rdcontrol_reg_b = "CLOCK0",
     ram.read_during_write_mode_mixed_ports = "OLD_DATA",
     ram.width_a = 32,
     ram.width_b = 32,
     ram.widthad_a = 5,
     ram.widthad_b = 5;
`endif

`ifdef ISE
   wire ena_a = rden_a | wren_a;
   wire ena_b = rden_b | wren_b;

   ise_32x32_dpram inst
     (
      .clka(clk_a),
      .ena(ena_a),
      .wea(wren_a),
      .addra(address_a),
      .dina(data_a),
      .douta(q_a),
      .clkb(clk_b),
      .enb(ena_b),
      .web(wren_b),
      .addrb(address_b),
      .dinb(data_b),
      .doutb(q_b)
      );
`endif

`ifdef SIMULATION
   reg [31:0] ram [0:31];
   reg [31:0] out_a;
   reg [31:0] out_b;

   assign q_a = out_a;
   assign q_b = out_b;

 `ifdef debug
   integer i, debug;

   initial
     begin
        debug = 0;
        for (i = 0; i < 32; i=i+1)
          ram[i] = 32'b0;
     end
 `endif

   always @(posedge clk_a)
     if (wren_a)
       begin
          ram[ address_a ] <= data_a;
 `ifdef debug
          if (debug > 0 && address_a != 0)
            $display("mmem: W %o <- %o", address_a, data_a);
 `endif
       end
     else if (wren_b)
       begin
          ram[ address_b ] <= data_b;
 `ifdef debug
          if (debug > 0 && address_b != 0)
            $display("mmem: W %o <- %o", address_b, data_b);
 `endif
       end

   always @(posedge clk_a)
     if (reset)
       out_a <= 0;
     else if (rden_a)
       begin
          out_a <= ram[ address_a ];
 `ifdef debug
          if (debug > 0 && address_a != 0)
            $display("mmem: R %o -> %o", address_a, ram[address_a]);
 `endif
       end

   always @(posedge clk_b)
     if (reset)
       out_b <= 0;
     else if (rden_b)
       begin
          out_b <= ram[ address_b ];
 `ifdef debug
          if (debug > 0 && address_b != 0)
            $display("mmem : R %o -> %o", address_b, ram[address_b]);
 `endif
       end

`endif

endmodule
