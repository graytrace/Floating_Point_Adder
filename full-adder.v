module full_adder(input a, b, cin, output sum, cout);
    wire x, y, z;
    xor(sum, a, b, cin);
    and(x, a, b); 
    and(y, a, cin);
    and(z, b, cin);
    or(cout, x, y, z);  
endmodule
