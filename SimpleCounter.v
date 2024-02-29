// SimpleCounter


module SimpleCounter(
  input wire clk,
  input wire rst,
  output reg [3:0] count
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // Reset the counter to 4'b0000 when reset is asserted
      count <= 4'b0000;
    end else begin
      // Increment the counter on each rising edge of the clock
      count <= count + 1;
    end
  end

endmodule

