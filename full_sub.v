module full_sub(input a, b, bin, output dif, bout);
    wire w, x, y, z;
    xor(dif, a, b, bin);
    not(w, a);
    and(x, w, bin);
    and(y, w, b);
    and(z, b, bin);
    or(bout, x, y, z);
endmodule
    