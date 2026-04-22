module twobit_sub(input [1:0]a, [1:0]b,input bin, output [1:0]dif, output bout);
    wire x;
    full_sub fs1(.a(a[0]), .b(b[0]), .bin(1'b0), .dif(dif[0]), .bout(x));
    full_sub fs2(.a(a[1]), .b(b[1]), .bin(x), .dif(dif[1]), .bout(bout));
endmodule