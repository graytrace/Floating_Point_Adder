module twobit_adder(input [1:0] a, [1:0] b, input cin, output [1:0] sum, output cout);
    wire c;
    full_adder fa0(.a(a[0]), .b(b[0]), .cin(1'b0), .sum(sum[0]), .cout(c));
    full_adder fa1(.a(a[1]), .b(b[1]), .cin(c), .sum(sum[1]), .cout(cout));
endmodule
