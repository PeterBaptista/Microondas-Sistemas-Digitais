`timescale 1ns/1ps

module contador_mod6_teste();

    reg [3:0] data; 
  	reg clk, load, en, clearn;
  	wire [3:0] count; 
  	wire tc;
    wire count_endTB;
  	integer i;
  

  	contador_mod6 dut(data, clk, load, en, clearn, count, tc, count_endTB);

	initial
		begin
		
			$dumpfile("contador_mod6_teste.vcd");
			$dumpvars(0,contador_mod6_teste);
      
      assign load = 1;
      assign en = 0; 
      assign clearn = 1;
      assign data = 4'b0110;

      #5 assign load = 0;

      #5 assign load = 1;

      #5 assign en = 1; 
    end
  
  initial
    
    begin
    	clk = 1'b0;
  	end
		
  initial
    begin
    	#5 clk = ~clk;
      for(i = 0; i < 26; i= i + 1)
        begin
          #5 clk = ~clk;
        end
      
    end
    
endmodule