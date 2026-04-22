module right_shifter(input [3:0] in, input [1:0] shift, output [3:0] out);

mux4_1 mux1 (.in({in[3], in[2], in[1], in[0]}), .s({shift[0], shift[1]}), .out(out[0]));
mux4_1 mux2 (.in({1'b0, in[3], in[2],in[1]}), .s({shift[0], shift[1]}), .out(out[1]));
mux4_1 mux3 (.in({1'b0 ,1'b0, in[3],in[2]}), .s({shift[0], shift[1]}), .out(out[2]));
mux4_1 mux4 (.in({1'b0,1'b0,1'b0,in[3]}),.s({shift[0], shift[1]}), .out(out[3]));

endmodule

