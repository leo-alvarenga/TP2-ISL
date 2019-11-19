`include "Circuito.v"
`include "Identificador.v"
`define PERIOD 10
module Simulacao();

  reg clk;
  reg [3:0] nota;
  reg ok, reset;
  wire fim;
  wire s0, s1, s2, s3, s4, s5, s6;
  wire [1:0] tipo;
  wire [3:0] estado;

  initial
  begin

    clk = 0;
    forever
      #(`PERIOD/2) clk = ~clk;

  end

  Circuito i1(.D(nota[0]), .N1(nota[1]), .N2(nota[2]), .N3(nota[3]), .s0(s0), .s1(s1), .s2(s2), .s3(s3), .s4(s4), .s5(s5), .s6(s6));
  Identificador i2(.clk(clk), .reset(reset), .ok(ok), .nota(nota), .fim(fim), .tipo(tipo), .estado_atual(estado));

  initial
  begin

  #1

    ok = 1'b0;
    reset = 1'b1;
    nota[0] = 1'b0;
    nota[1] = 1'b0;
    nota[2] = 1'b0;
    nota[3] = 1'b0;

  #1
    reset = 1'b0;

    $display("Iniciando o teste.");
    $dumpfile("testeCircuito.vcd");
    $dumpvars;
    $monitor("| Nota: %b%b%b%b | Estado: %b%b%b%b | Ok: %b | Reset: %b |", nota[0], nota[1], nota[2], nota[3], estado[0], estado[1], estado[2], estado[3],  ok, reset);

    //nova palavra - adjetivo
    #2
      nota = 4'b0001;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2
      nota = 4'b0011;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2 //la - baixo
      nota = 4'b0110;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;


    //nova palavra - adjetivo (adj)
    #2
      nota = 4'b0010;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2
      nota = 4'b0011;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2 //si - baixo
      nota = 4'b0111;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;


    //nova palavra - adjetivo comparativo (comp)
    #2
      nota = 4'b0100;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2
      nota = 4'b0101;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2 //la - baixo
      nota = 4'b0110;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2 //do - alto
      nota = 4'b1000;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;


    //nova palavra - adjetivo comparativo (comp)
    #2
      nota = 4'b1001;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2
      nota = 4'b1011;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2 //re - alto
      nota = 4'b1010;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2 //si - baixo
      nota = 4'b0111;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;


    //nova palavra - adverbio (adv)
    #2
      nota = 4'b1100;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2
      nota = 4'b1101;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2 //la - baixo
      nota = 4'b0110;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2 //si - baixo
      nota = 4'b0111;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;


    //nova palavra - adverbio (adv)
    #2
      nota = 4'b1110;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2
      nota = 4'b1111;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;


    #2 //la - baixo
      nota = 4'b0110;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    #2 //si - baixo
      nota = 4'b0111;

      #1
        ok = 1'b1;

      #1
        ok = 1'b0;

    $finish;

  end

endmodule
