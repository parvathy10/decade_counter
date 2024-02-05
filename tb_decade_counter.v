// tb_decade_counter.v
`timescale 1ns / 1ps

module tb_decade_counter;

  reg clk, rst, en;
  wire [3:0] count;

  // Instantiate the DecadeCounter module
  DecadeCounter decade_counter_inst (
    .clk(clk),
    .rst(rst),
    .en(en),
    .count(count)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Reset and enable signals generation
  initial begin
    rst = 1;
    en = 0;
    #10 rst = 0; // Deassert reset after 10 time units
    #20 en = 1;  // Enable the counter after 20 time units
  end

  // Monitor and display count
  always @(posedge clk) begin
    $display("Time=%0t, Count=%b", $time, count);
  end

  // Stop simulation after 100 time units
  initial #100 $stop;

endmodule

