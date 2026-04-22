module mux4_1(input [3:0]in, input [1:0]s, output out);
  wire [3:0]w;
  wire s0b, s1b;
  not(s0b, s[0]);
  not(s1b, s[1]);
  and(w[0], in[0], s1b, s0b); 
  and(w[1], in[1], s[1], s0b);  
  and(w[2], in[2], s1b, s[0]);  
  and(w[3], in[3], s[1], s[0]);   
  or(out, w[0], w[1], w[2], w[3]);
endmodule