module counter_0to7(input wire clear,
                    input wire clk,
                    output reg delay);


    reg [2:0] counter;

    always @(posedge clk or posedge clear) 
        begin 
        if (clear)
            begin
            counter = 3'b000;
            delay = 0;
            end
        else
            if (counter == 3)
            begin
            delay = 1;
            counter = counter + 1;
            end
            else if(counter < 7)
            begin
                counter = counter + 1;
            end
        end 
endmodule