`timescale 1ms/1ms
`include "nivel1.v"

module nivel1_test();
    reg [9:0] keypad;
    reg clock;
    reg startn;
    reg stopn;
    reg door_closed;
    reg clearn;

    wire [6:0] segundos, dezenas, minutos;
    wire mag_on;

    nivel1 dut(.startn(startn), .stopn(stopn), .door_closed(door_closed), .clearn(clearn), .keypad(keypad), .clock(clock), .segundos(segundos), .dezenas(dezenas), .minutos(minutos), .mag_on(mag_on));

    initial clock = 0;

    always #5 clock = ~clock;

    initial begin
        $dumpfile("nivel1.vcd");
        $dumpvars(0, nivel1_test);
    end

    initial begin
            keypad = 9'b000000000;
            door_closed = 0;
            stopn = 1;
            startn = 1;

            // Inicializando o contador
            clearn = 1; #1;
            clearn = 0; #1;
            clearn = 1;

            // Digitando o 2
            #1100;
            keypad = 9'b000000100;
            #1100;
            keypad = 9'b000000000;

            // Digitando o 5
            #1100;
            keypad = 9'b000100000;
            #1100;
            keypad = 9'b000000000;

            // Digitando o 9
            #1100;
            keypad = 10'b1000000000;
            #1100;
            keypad = 9'b000000000;

            // Digitando o 9
            #1100;
            keypad = 10'b1000000000;
            #1100;
            keypad = 9'b000000000;

            // Digitando o 9
            #1100;
            keypad = 10'b1000000000;
            #1100;
            keypad = 9'b000000000;

            // Tentando abrir
            #1100;
            startn = 0;
            #1100;
            startn = 1;
            #1100;
            // Fechando a porta
            door_closed = 1;
            #1000;
            startn = 0;
            #1000;
            startn = 1;
            #2000;
            // Pausando o timer
            stopn = 0;
            #1000;
            startn = 1;
            #2000;
            // Abrindo porta
            door_closed = 1;
            #3000000;
            $finish();
    end

endmodule