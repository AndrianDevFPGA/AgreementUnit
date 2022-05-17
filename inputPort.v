/*
  Author : Rakotojaona Nambinina
  email : Andrianoelisoa.Rakotojaona@gmail.com
  Description : Sending data to ports 
*/
module InputPort(
                clk,
                rst,
                tx,
                in1,
                in2,
                out1,
                out2
                 );
  input clk;
  input rst; 
  input tx;
  input [15:0] in1;
  input [15:0] in2;
  
  output reg [15:0] out1;
  output reg [15:0] out2;
  
  reg [31:0] contex;
  
  // state machine 
  integer state ;
  
  always @ (posedge clk)
    begin
      if (rst)
        begin
          state <=0;
        end
      else
        begin
          case(state)
            0:
              begin
                if (tx)
                  begin
                    state <=1;
                  end 
              end
            1:
              begin
                state <=2;
              end
            2:
              begin
                state <=3;
              end   
          endcase
        end 
    end 

  always @ (negedge clk)
    begin
      case (state)
        0:
          begin
            // do nothing 
          end 
        1:
          begin
            out1 = in1;
            out2 = in2;
            contex = {in1,in2};
          end 
        2:
          begin
            // do nothing
          end 
      endcase
    end 
    
endmodule
