/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg a,
    output reg b,
    output reg cin,
    input sum,
    input cout
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_2 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_3 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [16-1:0] M_dec_ctr_digits;
  reg [1-1:0] M_dec_ctr_inc;
  multi_dec_ctr_4 dec_ctr (
    .clk(clk),
    .rst(rst),
    .inc(M_dec_ctr_inc),
    .digits(M_dec_ctr_digits)
  );
  wire [1-1:0] M_ctr_value;
  counter_5 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  
  
  localparam IDLE_state = 4'd0;
  localparam TEST1_state = 4'd1;
  localparam TEST2_state = 4'd2;
  localparam TEST3_state = 4'd3;
  localparam TEST4_state = 4'd4;
  localparam TEST5_state = 4'd5;
  localparam TEST6_state = 4'd6;
  localparam TEST7_state = 4'd7;
  localparam TEST8_state = 4'd8;
  localparam FAIL_state = 4'd9;
  localparam SUCCESS_state = 4'd10;
  
  reg [3:0] M_state_d, M_state_q = IDLE_state;
  
  wire [1-1:0] M_sc_inc_state;
  stateCounter_6 sc (
    .clk(clk),
    .rst(rst),
    .inc_state(M_sc_inc_state)
  );
  
  always @* begin
    M_state_d = M_state_q;
    
    a = 1'h0;
    b = 1'h0;
    cin = 1'h0;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = {3'h0, io_button};
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_edge_detector_in = M_ctr_value;
    M_dec_ctr_inc = M_edge_detector_out;
    M_seg_values = 16'h0000;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    io_led = io_dip;
    
    case (M_state_q)
      IDLE_state: begin
        if (io_button[1+0-:1]) begin
          M_state_d = TEST1_state;
        end
      end
      TEST1_state: begin
        a = 1'h0;
        b = 1'h0;
        cin = 1'h0;
        io_led[16+7+0-:1] = 1'h1;
        M_seg_values = 16'h0000;
        if (sum == 1'h0 && cout == 1'h0 && M_sc_inc_state == 1'h1) begin
          M_state_d = TEST2_state;
        end
        if (sum != 1'h0 && cout != 1'h0 && M_sc_inc_state == 1'h1) begin
          M_state_d = FAIL_state;
        end
        if (rst_n == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
      TEST2_state: begin
        a = 1'h0;
        b = 1'h0;
        cin = 1'h1;
        io_led[16+6+0-:1] = 1'h1;
        M_seg_values = 16'h0001;
        if (sum == 1'h1 && cout == 1'h0 && M_sc_inc_state == 1'h1) begin
          M_state_d = TEST3_state;
        end
        if (sum != 1'h1 && cout != 1'h0 && M_sc_inc_state == 1'h1) begin
          M_state_d = FAIL_state;
        end
        if (rst_n == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
      TEST3_state: begin
        a = 1'h0;
        b = 1'h1;
        cin = 1'h0;
        io_led[16+5+0-:1] = 1'h1;
        M_seg_values = 16'h0010;
        if (sum == 1'h1 && cout == 1'h0 && M_sc_inc_state == 1'h1) begin
          M_state_d = TEST4_state;
        end
        if (sum != 1'h1 && cout != 1'h0 && M_sc_inc_state == 1'h1) begin
          M_state_d = FAIL_state;
        end
        if (rst_n == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
      TEST4_state: begin
        a = 1'h0;
        b = 1'h1;
        cin = 1'h1;
        io_led[16+4+0-:1] = 1'h1;
        M_seg_values = 16'h0011;
        if (sum == 1'h0 && cout == 1'h1 && M_sc_inc_state == 1'h1) begin
          M_state_d = TEST5_state;
        end
        if (sum != 1'h0 && cout != 1'h1 && M_sc_inc_state == 1'h1) begin
          M_state_d = FAIL_state;
        end
        if (rst_n == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
      TEST5_state: begin
        a = 1'h1;
        b = 1'h0;
        cin = 1'h0;
        io_led[16+3+0-:1] = 1'h1;
        M_seg_values = 16'h0100;
        if (sum == 1'h1 && cout == 1'h0 && M_sc_inc_state == 1'h1) begin
          M_state_d = TEST6_state;
        end
        if (sum != 1'h1 && cout != 1'h0 && M_sc_inc_state == 1'h1) begin
          M_state_d = FAIL_state;
        end
        if (rst_n == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
      TEST6_state: begin
        a = 1'h1;
        b = 1'h0;
        cin = 1'h1;
        io_led[16+2+0-:1] = 1'h1;
        M_seg_values = 16'h0101;
        if (sum == 1'h0 && cout == 1'h1 && M_sc_inc_state == 1'h1) begin
          M_state_d = TEST7_state;
        end
        if (sum != 1'h0 && cout != 1'h1 && M_sc_inc_state == 1'h1) begin
          M_state_d = FAIL_state;
        end
        if (rst_n == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
      TEST7_state: begin
        a = 1'h1;
        b = 1'h1;
        cin = 1'h0;
        io_led[16+1+0-:1] = 1'h1;
        M_seg_values = 16'h0110;
        if (sum == 1'h0 && cout == 1'h1 && M_sc_inc_state == 1'h1) begin
          M_state_d = TEST8_state;
        end
        if (sum != 1'h0 && cout != 1'h1 && M_sc_inc_state == 1'h1) begin
          M_state_d = FAIL_state;
        end
        if (rst_n == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
      TEST8_state: begin
        a = 1'h1;
        b = 1'h1;
        cin = 1'h1;
        io_led[16+0+0-:1] = 1'h1;
        M_seg_values = 16'h0111;
        if (sum == 1'h1 && cout == 1'h1 && M_sc_inc_state == 1'h1) begin
          M_state_d = SUCCESS_state;
        end
        if (sum != 1'h1 && cout != 1'h1 && M_sc_inc_state == 1'h1) begin
          M_state_d = FAIL_state;
        end
        if (rst_n == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
      FAIL_state: begin
        M_seg_values = 16'habcd;
        io_led = 24'hffffff;
        M_seg_values = 16'habcd;
        if (rst_n == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
      SUCCESS_state: begin
        if (M_sc_inc_state == 1'h1) begin
          M_seg_values = 16'h5eff;
          io_led = 24'hffffff;
        end
        M_seg_values = 16'h5eff;
        if (rst_n == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_state_q <= M_state_d;
  end
  
endmodule
