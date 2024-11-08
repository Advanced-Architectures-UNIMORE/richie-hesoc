// ----------------------------------------------------------------------------
//
// This file has been automatically generated by:
// Multi-Dataflow Composer tool - Platform Composer
// Template Interface Layer module - Memory-Mapped type
// on 2022/02/18 17:40:39
// More info available at http://sites.unica.it/rpct/
//
// ----------------------------------------------------------------------------
import multi_dataflow_sobel_mdc_package::*;
import hwpe_ctrl_package::*;

// ----------------------------------------------------------------------------
// Module Interface
// ----------------------------------------------------------------------------
module multi_dataflow_sobel_mdc_reconf_datapath_top 
(
	// Sink ports
	hwpe_stream_intf_stream.sink    in_pel,
	hwpe_stream_intf_stream.sink    in_size,
	// Source ports
	hwpe_stream_intf_stream.source  out_pel,
	// Algorithm parameters
		// Global signals
	input  logic                      clk_i,
	input  logic                      rst_ni
);


// ----------------------------------------------------------------------------
// Module Signals
// ----------------------------------------------------------------------------
// Communication signals
wire [7 : 0] in_pel_data;
wire in_pel_push;
wire in_pel_full;
wire [31:0] stream_if_in_pel_data;
wire stream_if_in_pel_valid;
wire stream_if_in_pel_ready;
wire [5 : 0] in_size_data;
wire in_size_push;
wire in_size_full;
wire [31:0] stream_if_in_size_data;
wire stream_if_in_size_valid;
wire stream_if_in_size_ready;
wire [7 : 0] out_pel_data;
wire out_pel_push;
wire out_pel_full;
wire [31:0] stream_if_out_pel_data;
wire stream_if_out_pel_valid;
wire stream_if_out_pel_ready;


// ----------------------------------------------------------------------------
// Body
// ----------------------------------------------------------------------------
// hwpe strem interface wrappers
// hwpe stream intf in in_pel
interface_wrapper_sobel_mdc_in i_interface_wrapper_sobel_mdc_in_in_pel(
	.in_data(stream_if_in_pel_data),
	.in_valid(stream_if_in_pel_valid),
	.in_ready(stream_if_in_pel_ready),
	.in(in_pel)
);
// hwpe stream intf in in_size
interface_wrapper_sobel_mdc_in i_interface_wrapper_sobel_mdc_in_in_size(
	.in_data(stream_if_in_size_data),
	.in_valid(stream_if_in_size_valid),
	.in_ready(stream_if_in_size_ready),
	.in(in_size)
);
// hwpe stream intf out out_pel
interface_wrapper_sobel_mdc_out i_interface_wrapper_sobel_mdc_out_out_pel(
	.out_data(stream_if_out_pel_data),
	.out_valid(stream_if_out_pel_valid),
	.out_ready(stream_if_out_pel_ready),
	.out(out_pel)
);

// Multi-Dataflow Reconfigurable Datapath
// ----------------------------------------------------------------------------
// to adapt profiling
multi_dataflow_sobel_mdc reconf_dpath (
	// Multi-Dataflow Input(s)
	.in_pel_data(in_pel_data),
	.in_pel_wr(in_pel_push),
	.in_pel_full(in_pel_full),
	.in_size_data(in_size_data),
	.in_size_wr(in_size_push),
	.in_size_full(in_size_full),
	// Multi-Dataflow Output(s)
	.out_pel_data(out_pel_data),
	.out_pel_wr(out_pel_push),
	.out_pel_full(out_pel_full),
	// Algorithm parameters
	.clock(clk_i),
	.reset(rst_ni)
);
assign stream_if_in_pel_ready = ~in_pel_full;
assign in_pel_data = stream_if_in_pel_data [7 : 0];
assign in_pel_push = stream_if_in_pel_valid;
assign stream_if_in_size_ready = ~in_size_full;
assign in_size_data = stream_if_in_size_data [5 : 0];
assign in_size_push = stream_if_in_size_valid;
assign stream_if_out_pel_valid = out_pel_push;
assign stream_if_out_pel_data = {{24{1'b0}},out_pel_data};
assign out_pel_full = ~stream_if_out_pel_ready;

endmodule
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
