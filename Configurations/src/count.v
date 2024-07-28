module count (
   clk,
   clk_en,
   rst,
   count_out
);

   input rst;                // Active high reset
   input clk;                // 156.250Mhz input clock
   input clk_en;
   output reg [31:0] count_out;

   always @(posedge clk)
      if (rst) begin
         count_out <= 0;
      end
      else if (clk_en) begin 
         count_out <= count_out + 1;
      end

endmodule
