`define clk_25mhz

`timescale 1ns / 1ns

module test_spy_port;

   reg clk;
   reg reset;
   wire rs232_rxd;
   wire rs232_txd;
   reg [15:0] spy_in;
   wire [15:0] spy_out;
   wire dbread;
   wire dbwrite;
   wire [4:0] eadr;

   integer success;
   integer done;

   spy_port spy_port(.sysclk(clk),
                     .clk(clk),
                     .reset(reset),
                     .rs232_rxd(rs232_rxd),
                     .rs232_txd(rs232_txd),
                     .spy_in(spy_in),
                     .spy_out(spy_out),
                     .dbread(dbread),
                     .dbwrite(dbwrite),
                     .eadr(eadr)
                     );

   // Send RS-232 data by wiggling RS-232 input.

   // 50,000,000Mhz clock = 20ns cycle.
   //
   // 115200 baud is 1 bit every 1/115200 = .00000868 = 8.68us = 8680ns

`define bitdelay 8680

   reg rx;
   assign rs232_rxd = rx;

   task final_wait;
      integer i;
      begin
         for (i = 0; i < 10; i = i + 1)
           #`bitdelay;
      end
   endtask

   task notice_tx;
      begin
         while (done == 0)
           begin
              @(posedge clk)
                if (spy_port.ld_tx_req && spy_port.ld_tx_ack)
                  $display("ld_tx_req: tx_data %x", spy_port.tx_data);
           end
      end
   endtask

   task notice_rw;
      begin
         while (done == 0)
           begin
              if (dbread)
                begin
                   $display("dbread; eadr %x; %t", eadr, $time);
                   case (eadr)
                     0: spy_in = 16'h8000;
                     1: spy_in = 16'h8001;
                     2: spy_in = 16'h8002;
                     3: spy_in = 16'h8003;
                     4: spy_in = 16'h8004;
                     5'h12: spy_in = 16'h8012;
                   endcase
                   @(posedge clk);
                end
              else
                spy_in = 16'hffff;

              if (dbwrite)
                begin
                   $display("dbwrite; eadr %x data %x; %t", eadr, spy_out, $time);
                   @(posedge clk);
                end
              #1;
           end
      end
   endtask

   task send_tt_rx;
      input [7:0] data;
      begin
         $display("send %x", data);
         rx = 0;
         #`bitdelay rx = data[0];
         #`bitdelay rx = data[1];
         #`bitdelay rx = data[2];
         #`bitdelay rx = data[3];
         #`bitdelay rx = data[4];
         #`bitdelay rx = data[5];
         #`bitdelay rx = data[6];
         #`bitdelay rx = data[7];
         #`bitdelay rx = 1;
         #`bitdelay rx = 1;
         #`bitdelay;
      end
   endtask

   task tx_delay;
      #1000000;
   endtask

   task send_intro;
      begin
         send_tt_rx(8'h00); #(`bitdelay*1.25);
         send_tt_rx(8'h01);
         send_tt_rx(8'h02);
         send_tt_rx(8'h10);
         send_tt_rx(8'h11);
         send_tt_rx(8'h12);
         send_tt_rx(8'h82);
         repeat (50000) @(posedge clk);
         send_tt_rx(8'h12);
         #10000;
         done = 1;
      end
   endtask

   task send_req0;
      begin
         send_tt_rx(8'h80); tx_delay;
      end
   endtask

   task send_req1;
      begin
         send_tt_rx(8'h81); tx_delay;
      end
   endtask

   task send_req3;
      begin
         send_tt_rx(8'h31); tx_delay;
         send_tt_rx(8'h42); tx_delay;
         send_tt_rx(8'h53); tx_delay;
         send_tt_rx(8'h64); tx_delay;
         send_tt_rx(8'ha2); tx_delay;
      end
   endtask

   task send_req4;
      begin
         send_tt_rx(8'h60); tx_delay;
         send_tt_rx(8'ha3); tx_delay;
      end
   endtask

   task send_req5;
      begin
         send_tt_rx(8'h30); tx_delay;
         send_tt_rx(8'h40); tx_delay;
         send_tt_rx(8'h50); tx_delay;
         send_tt_rx(8'h60); tx_delay;
         send_tt_rx(8'ha8); tx_delay;
      end
   endtask

   task send_reqs;
      begin
         send_req0;
         send_req1;
         send_req3;
         send_req4;
         send_req5;
         final_wait;
         done = 1;
      end
   endtask

   initial
     begin
        $timeformat(-9, 0, "ns", 7);

        $dumpfile("spy_port.vcd");
        $dumpvars(0, test_spy_port);
     end

   initial
     begin
        $display("** START **");
        clk = 0;
        reset = 0;
        rx = 1;
        spy_in = 16'hffff;
        success = 1;
        done = 0;

        #1 reset = 1;
        #200 reset = 0;

        fork
           send_intro;
           notice_rw;
           notice_tx;
        join

        if (success)
          $display("** PASSED **");
        else
          $display("** FAILED **");

        $finish;
     end

`ifdef clk_50mhz
   always
     begin
        #10 clk = 0;
        #10 clk = 1;
     end
`endif

`ifdef clk_25mhz
   always
     begin
        #20 clk = 0;
        #20 clk = 1;
     end
`endif

endmodule
