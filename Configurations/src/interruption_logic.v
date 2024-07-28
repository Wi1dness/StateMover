
module interruption_logic(
`ifdef MODEL_TECH   
	input clk_en,
	input [31:0] breakpoint,
	input sys_reset,
`endif
`ifndef MODEL_TECH   
	output sys_reset,
`endif
	input sys_clk,
	output task_clk,
	input [31:0] count_out
);

	reg [31:0] counter;
	reg break;

`ifndef MODEL_TECH
	wire clk_en;
	wire [31:0] breakpoint;
`endif

`ifndef MODEL_TECH
	il_vio il_vio_inst (
		.clk(sys_clk),
		.probe_in0(count_out),
		.probe_out0(sys_reset),
		.probe_out1(clk_en),
		.probe_out2(breakpoint)
	);
`endif

	always @(posedge sys_clk)
	begin
		if (sys_reset)
		begin
			counter <= 0;
			break <= 0;
		end
		else if (clk_en)
		begin
			if (counter == breakpoint)
			begin
				break <= 1'b1;
			end
			else
			begin
				counter <= counter + 1;
				break <= 1'b0;
			end
		end
	end

	BUFGCE inst_bufgce (
		.O(task_clk),
		.I(sys_clk),
		.CE(clk_en & ~break)
	);

endmodule