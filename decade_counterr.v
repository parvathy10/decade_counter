// DecadeCounter.v
module DecadeCounter(
  input wire clk,
  input wire rst,
  input wire en,
  output wire [3:0] count
);

  // Internal wire to connect SimpleCounter output to count
  wire [3:0] simple_count_out;

  // Instantiate the SimpleCounter module
  SimpleCounter simple_counter_inst (
    .clk(clk),
    .rst(rst),
    .count(simple_count_out)
  );

  // Assign the value from SimpleCounter to the output count
  assign count = (en) ? simple_count_out : 4'b0000;

endmodule

