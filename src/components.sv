module mux16to1 #(
  parameter WIDTH = 32
) (
  input wire logic [3:0]       sel,
  input wire logic [WIDTH-1:0] in0,
  input wire logic [WIDTH-1:0] in1,
  input wire logic [WIDTH-1:0] in2,
  input wire logic [WIDTH-1:0] in3,
  input wire logic [WIDTH-1:0] in4,
  input wire logic [WIDTH-1:0] in5,
  input wire logic [WIDTH-1:0] in6,
  input wire logic [WIDTH-1:0] in7,
  input wire logic [WIDTH-1:0] in8,
  input wire logic [WIDTH-1:0] in9,
  input wire logic [WIDTH-1:0] in10,
  input wire logic [WIDTH-1:0] in11,
  input wire logic [WIDTH-1:0] in12,
  input wire logic [WIDTH-1:0] in13,
  input wire logic [WIDTH-1:0] in14,
  input wire logic [WIDTH-1:0] in15,
  output reg [WIDTH-1:0] out
);
  always @(*) begin
    case(sel)
      4'd0: out = in0;
      4'd1: out = in1;
      4'd2: out = in2;
      4'd3: out = in3;
      4'd4: out = in4;
      4'd5: out = in5;
      4'd6: out = in6;
      4'd7: out = in7;
      4'd8: out = in8;
      4'd9: out = in9;
      4'd10: out = in10;
      4'd11: out = in11;
      4'd12: out = in12;
      4'd13: out = in13;
      4'd14: out = in14;
      4'd15: out = in15;
      default: out = in0;
    endcase
  end
endmodule

module mux8to1 #(
  parameter WIDTH = 32
) (
  input wire logic [2:0]       sel,
  input wire logic [WIDTH-1:0] in0,
  input wire logic [WIDTH-1:0] in1,
  input wire logic [WIDTH-1:0] in2,
  input wire logic [WIDTH-1:0] in3,
  input wire logic [WIDTH-1:0] in4,
  input wire logic [WIDTH-1:0] in5,
  input wire logic [WIDTH-1:0] in6,
  input wire logic [WIDTH-1:0] in7,
  output reg [WIDTH-1:0] out
);
  always @(*) begin 
    case(sel) 
      3'd0: out = in0;
      3'd1: out = in1;
      3'd2: out = in2;
      3'd3: out = in3;
      3'd4: out = in4;
      3'd5: out = in5;
      3'd6: out = in6;
      3'd7: out = in7;
    endcase
  end

endmodule

module onehotmux #(
  parameter WIDTH = 32
) (
  input wire logic [5:0] sel,
  input wire logic [WIDTH-1:0] in0,
  input wire logic [WIDTH-1:0] in1,
  input wire logic [WIDTH-1:0] in2,
  input wire logic [WIDTH-1:0] in3,
  input wire logic [WIDTH-1:0] in4,
  input wire logic [WIDTH-1:0] in5,
  output reg [WIDTH-1:0] out
);
  always @(*) begin
    case(sel)
      6'b000001: out = in0;
      6'b000010: out = in1;
      6'b000100: out = in2;
      6'b001000: out = in3;
      6'b010000: out = in4;
      6'b100000: out = in5;
      default: out = in0;
    endcase
  end
endmodule

module isrtype (
  input wire logic [6:0] opcode,
  input wire logic [9:0] funct,
  output wire logic out
);
  assign out = (opcode == 7'b0110011) | 
  ((opcode == 0010011) & (funct[2:0] == 3'd1 | funct[2:0] == 3'd5));
endmodule

module regfile (
  input wire clk,
  input wire reset,
  input wire logic ld,
  input wire logic [4:0] r_in1,
  input wire logic [4:0] r_in2,
  input wire logic [31:0] data_in,
  input wire logic [4:0] r_dest,
  output reg [31:0] rs1,
  output reg [31:0] rs2
);
  reg [31:0] rf [31:0];
  integer i;
  assign rs1 = rf[r_in1];
  assign rs2 = rf[r_in2];
  always_ff @(posedge clk) begin 
    if (reset) begin 
      for(i = 0; i < 32; i = i+1)
        rf[i] <= 32'd0;
    end else if (ld) begin
      rf[r_dest] <= data_in;
    end else begin
    end
  end
endmodule