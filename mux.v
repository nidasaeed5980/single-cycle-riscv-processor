module mux
           #(parameter width=32)
           (input [width-1:0] a,
            input [width-1:0]b,
            input sel,
           output [width-1:0] y);
          
            assign y=sel?b:a;
           
           
endmodule          