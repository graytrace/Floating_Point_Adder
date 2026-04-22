module mux2_1(input a, b, sel, output out);
  wire x, y, z;
  not(x, sel); 
  and(y, a, x); 
  and(z, b, sel);     
  or(out, y, z);  
endmodule