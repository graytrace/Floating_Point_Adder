module float_adder(input [3:0] m1, m2, input [1:0] e1, e2, output [3:0] m, output [2:0] e);
    wire [1:0] edif, n_edif;
    wire bout, nbout, x, cout;
    wire [3:0] maout, mbout, shout, msum;
    wire [1:0] s, meout, eout;
    
    twobit_sub sub(.a(e1), .b(e2), .bin(1'b0), .dif(edif), .bout(bout));
    
    not(nbout, bout);
    not(n_edif[0], edif[0]);  
    not(n_edif[1], edif[1]);  
    
    mux2_1 mux0(.a(edif[0]), .b(n_edif[0]), .sel(bout), .out(meout[0]));
    mux2_1 mux1(.a(edif[1]), .b(n_edif[1]), .sel(bout), .out(meout[1]));
    
    twobit_adder add_edif(.a(meout), .b({1'b0, bout}), .cin(1'b0), .sum(s), .cout());

    mux2_1 mux2(.a(m1[0]), .b(m2[0]), .sel(bout), .out(maout[0]));
    mux2_1 mux3(.a(m1[1]), .b(m2[1]), .sel(bout), .out(maout[1]));
    mux2_1 mux4(.a(m1[2]), .b(m2[2]), .sel(bout), .out(maout[2]));
    mux2_1 mux5(.a(m1[3]), .b(m2[3]), .sel(bout), .out(maout[3]));

    mux2_1 mux6(.a(m1[0]), .b(m2[0]), .sel(nbout), .out(mbout[0]));
    mux2_1 mux7(.a(m1[1]), .b(m2[1]), .sel(nbout), .out(mbout[1]));
    mux2_1 mux8(.a(m1[2]), .b(m2[2]), .sel(nbout), .out(mbout[2]));
    mux2_1 mux9(.a(m1[3]), .b(m2[3]), .sel(nbout), .out(mbout[3]));
    
    mux2_1 mux10(.a(e1[0]), .b(e2[0]), .sel(bout), .out(eout[0]));
    mux2_1 mux11(.a(e1[1]), .b(e2[1]), .sel(bout), .out(eout[1]));

    right_shifter rs(.in(mbout), .shift(s), .out(shout));

    fourbit_add sum(.a(maout), .b(shout), .cin(1'b0), .sum(msum), .cout(cout));

    right_shifter n_rs(.in(msum), .shift({1'b0, cout}), .out({x,m[2], m[1], m[0]}));
        
    mux2_1 mux12(.a(x), .b(1'b1), .sel(cout), .out(m[3]));
    
    twobit_adder n_exp(.a(eout), .b({1'b0, cout}), .cin(1'b0), .sum({e[1],e[0]}), .cout(e[2]));

endmodule
