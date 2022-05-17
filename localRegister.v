/*
  Author : Rakotojaona Nambinina 
  email : Andrianoelisoa.Rakotojaona@gmail.com
  Description : Local register 
*/
module localReg(
                clk,
                rst,
                rdEn
                localcontext
                );
  input clk;
  input rst;
  input rdEn;
  output reg [15:0] localcontext;
  
  reg [15:0] localcontextMem = 16'd1;
  
  always @ (posedge clk)
    begin
      if (rdEn)
        begin
          localcontext <= localcontextMem;
        end 
    end 
  
  
endmodule
