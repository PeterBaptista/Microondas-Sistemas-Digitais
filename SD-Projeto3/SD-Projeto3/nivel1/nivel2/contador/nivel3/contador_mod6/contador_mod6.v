module contador_mod6(data, clk, load, en, clearn, count, tc, count_end);
  // 1) Por algum motivo, basicamente todos as variáveis que são de 
  // 4-bits agora, estavam como variáveis de 3-bits, como isso tava
  // dando problema toda vez que dava run eu mudei tudo que era 
  // de 3-bits para 4-bits, sem alterar o funcionamento do módulo
  // (também mudei um pouco a testbench do contador_nivel2
  // por causa disso)
  // 2) Adicionei o input count_end, ele vai servir para parar a contagem
  // regressiva quando os algarismos dos min, dez_seg e seg forem
  // iguais a 0, e não simplesmente fazer um loop infinito.
  // 3) Troquei count_end para ser um output, que vai indicar 
  // quando chegou a zero.
  input wire [3:0] data;
  input wire clk, load, en, clearn;
  output reg [3:0] count;
  output wire tc;
  output wire count_end;

  always @ (negedge clearn) // lembrar de trocar o reset e o stop (feito)
  begin
    count = 4'b0000;
  end

  assign count_end = (count == 4'b0000) ? 1'b1 : 1'b0;
  assign tc = en & count_end;

  always @ (posedge clk)
  begin
    if (en) 
      case (count)
        4'b0101: begin
          count <= 4'b0100;
        end // 5 -> 4
        4'b0001: begin 
          count <= 4'b0000;
        end  // 1 -> 0
        4'b0000: begin
          count <= 4'b0101;
        end // 0 -> 5
        default: count <= count - 4'b0001;
      endcase

    else begin

      if(!load) // Lembrar q aq o valor do load tá invertido
        count <= data;
    end
  end
endmodule