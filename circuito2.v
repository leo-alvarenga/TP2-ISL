/*Maquina de Estado Finito - Adverbio e Adjetivo*/
module novo(clk, reset, ok, nota, fim, tipo, display);

  input wire ok, reset, clk;
	input wire [2:0] nota;
	output reg fim;
	output reg [1:0] tipo;
	output [6:0] display;

  localparam[3:0] initial_state = 4'b0000,
                  state_n1 = 4'b0001,
                  state_n2 = 4'b0010,
                  state_n3_la = 4'b0011,
                  state_n3_si = 4'b0100,
					        state_adj = 4'b0101,
					        state_n4_do = 4'b0110,
					        state_n4_si = 4'b0111,
					        state_n4_re = 4'b1000,
					        state_comp = 4'b1001,
					        state_adv = 4'b1010,
					        erro = 4'b1011;

	localparam[3:0] null_note1 = 4'b0000,
									Do = 4'b0001,
									Re = 4'b0010,
									Mi = 4'b0011,
									Fa = 4'b0100,
									Sol = 4'b0101,
									La = 4'b0110,
									Si = 4'b0111,
									null_note2 = 4'b1000,
									Do_m = 4'b1001,
									Re_m = 4'b1010,
									Mi_m = 4'b1011,
									Fa_m = 4'b1100,
									Sol_m = 4'b1101,
									La_m = 4'b1110,
                  Si_m = 4'b1111;

	localparam[1:0] sem_tipo = 2'b00,
								  adj = 2'b01,
 								  comp = 2'b10,
								  adv = 2'b11;

	localparam finalizado = 1'b1,
						 processando = 1'b0;

	reg [3:0] estados, proximo_estado;


  always @(posedge clk)
  begin

  	if(reset)
    begin

      estados = initial_state;

    end

		else
    begin

    	estados = proximo_estado;

    end

  end

	always @(posedge ok or posedge reset)
  begin
		if (reset)
    begin

    	proximo_estado = initial_state;

    end

    else
    begin

      case(estados)
  			initial_state:
        begin

        	if(nota != null_note1 && nota != null_note2)
          begin

            proximo_estado = state_n1;

          end

        	else
          begin

            proximo_estado = erro;

          end

        end


        state_n1:
        begin

      		if(nota != null_note1 && nota != null_note2)
          begin

            proximo_estado = state_n2;

          end

      		else
          begin

            proximo_estado = erro;

          end

      	end


  			state_n2:
        begin

        	if(nota == La)
          begin

            proximo_estado = state_n3_la;

          end

        	else if(nota == Si_m)
          begin

            proximo_estado = state_n3_si;

          end

        	else
          begin

            proximo_estado = erro;

          end

        end


  			state_n3_la:
        begin

        	if(nota == null_note1 || nota == null_note2)
          begin

          	proximo_estado = state_adj;

          end

        	else if(nota == Do)
          begin

            proximo_estado = state_n4_do;

          end

        	else if(nota == Si_m)
          begin

            proximo_estado = state_n4_si;

          end

        	else
          begin

            proximo_estado = erro;

          end

        end


        state_n3_si:
        begin

          if(nota == null_note1 || nota == null_note2)
          begin

            proximo_estado = state_adj;

          end

        	else if(nota == Re)
          begin

            proximo_estado = state_n4_re;

          end

          else
          begin

          	proximo_estado = erro;

          end

  			end


        state_adj:
        begin

        	proximo_estado = state_adj;

        end


        state_n4_do:
        begin

          if(nota == null_note1 || nota == null_note2)
          begin

            proximo_estado = state_comp;

          end

          else
          begin

    				proximo_estado = erro;

          end

  			end


        state_n4_si:
        begin

          if(nota == null_note1 || nota == null_note2)
          begin

            proximo_estado = state_adv;

          end

  			  else
          begin

            proximo_estado = erro;

          end

  			end


  			state_n4_re:
        begin

          if(nota == null_note1 || nota == null_note2)
          begin

            proximo_estado = state_comp;

          end

  			  else
          begin

            proximo_estado = erro;

          end

  			end


        state_comp:
        begin

        	proximo_estado = state_comp;

  			end


        state_adv:
        begin

          proximo_estado = state_adv;

  			end


        erro:
        begin

        	proximo_estado = erro;

  			end


    		default:
        begin

          estados = initial_state;

        end

    	endcase

  	end

  end

	always @ (estados)begin
    case(estados)

      erro:
      begin

				fim = finalizado;
				tipo = sem_tipo;

			end


			state_adj:
      begin

      	fim = finalizado;
				tipo = adj;

			end


			state_comp:
      begin

				fim = finalizado;
				tipo = comp;

			end


			state_adv:
      begin

				fim = finalizado;
				tipo = adv;

			end


			default:
      begin

				fim = processando;
				tipo = sem_tipo;

			end

		endcase

	end

endmodule
