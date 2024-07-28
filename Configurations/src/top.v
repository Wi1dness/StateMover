
module top(
`ifdef MODEL_TECH   
  input reset,
  input clk_en,
  input [31:0] breakpoint,
`endif

  input clk_p,
  input clk_n
);

  wire gclk;
  IBUFGDS clkin1_buf (
    .O  (gclk), //clkin1
    .I  (clk_p),
    .IB (clk_n)
  );
  wire clk;

`ifndef MODEL_TECH
  wire reset;
  wire clk_en;
  wire [31:0] breakpoint;
`endif

  wire [31:0] count_out;

  // instantiate module count
  count count_inst (
    .rst       (reset),
    .clk       (clk),
    .clk_en    (1'b1),
    .count_out (count_out)
  );

  interruption_logic il (
`ifdef MODEL_TECH
    .clk_en(clk_en),
    .breakpoint(breakpoint),
    .sys_reset(reset),
`endif
`ifndef MODEL_TECH
    .sys_reset(reset),
`endif
    .sys_clk(gclk),
    .task_clk(clk),
    .count_out(count_out)
  );

endmodule