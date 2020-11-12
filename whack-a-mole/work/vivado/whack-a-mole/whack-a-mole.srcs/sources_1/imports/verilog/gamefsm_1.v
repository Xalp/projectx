/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module gamefsm_1 (
    input clk,
    input rst,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input b1_press,
    input b2_press,
    input b3_press
  );
  
  
  
  reg [2:0] a;
  
  reg [2:0] b;
  
  localparam IDLE_state = 2'd0;
  localparam CASE1_state = 2'd1;
  localparam CASE2_state = 2'd2;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  wire [1-1:0] M_stateCOUNT_inc_state;
  stateCounter_4 stateCOUNT (
    .clk(clk),
    .rst(rst),
    .inc_state(M_stateCOUNT_inc_state)
  );
  wire [7-1:0] M_seg_seg;
  wire [2-1:0] M_seg_sel;
  reg [8-1:0] M_seg_values;
  multi_seven_seg_5 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  
  always @* begin
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    M_seg_values = 8'h00;
    a = 1'h0;
    b[2+0-:1] = b1_press;
    b[1+0-:1] = b2_press;
    b[0+0-:1] = b3_press;
    
    case (M_state_q)
      IDLE_state: begin
        if (M_stateCOUNT_inc_state == 1'h1) begin
          M_seg_values = 8'h01;
        end
      end
      CASE1_state: begin
        if (M_stateCOUNT_inc_state == 1'h1) begin
          M_seg_values = 8'h01;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
