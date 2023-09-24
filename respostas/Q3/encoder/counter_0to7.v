module counter_0to7(input wire clear,
                    input wire clk
                    output wire delay)


    reg [2:0] counter;
    
    always @(posedge clk or posedge clear) 
        begin 
        if (clear)
            begin
            counter = 3'b000;
            out= 0;
            end
        else
            if (counter == 3)
            begin
            out = 1;
            counter = counter + 1;
            end
            else if(counter < 7)
            begin
                counter = counter + 1;
            end
        end 
endmodule