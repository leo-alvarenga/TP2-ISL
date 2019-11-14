module Identificador(clk, reset, ok, nota, fim, tipo, estado_atual);

  input wire ok, reset, clk;
	input  wire [3:0] nota;
	output reg fim;
	output reg [1:0] tipo;


	parameter inicio  = 4'b0000,
	          s_n1    = 4'b0001,
	          s_n2    = 4'b0010,
 	          s_N3_La = 4'b0011,
	          s_N3_Si = 4'b0100,
						s_adj	  = 4'b0101,
						s_N4_Do = 4'b0110,
						s_N4_Si = 4'b0111,
						s_N4_Re = 4'b1000,
						s_comp  = 4'b1001,
						s_adv   = 4'b1010,
						s_erro	= 4'b1011;

	parameter nota_nula1 = 4'b0000,
						Do         = 4'b0001,
						Re         = 4'b0010,
						Mi         = 4'b0011,
						Fa         = 4'b0100,
						Sol        = 4'b0101,
						La         = 4'b0110,
						Si         = 4'b0111,
						nota_nula2 = 4'b1000,
						Do_m       = 4'b1001,
						Re_m       = 4'b1010,
						Mi_m       = 4'b1011,
						Fa_m       = 4'b1100,
						Sol_m      = 4'b1101,
						La_m       = 4'b1110,
						Si_m       = 4'b1111;

	parameter t_nenhum = 2'b00,
						t_adj    = 2'b01,
 						t_comp   = 2'b10,
						t_adv    = 2'b11;

	parameter processado  = 1'b1,
						em_processo = 1'b0;

	output reg [3:0] estado_atual;
	reg [3:0] prox_estado;

	always @(posedge clk)
  begin

		if(reset)
    begin

			estado_atual = inicio;

    end

		else
    begin

    	estado_atual = prox_estado;
    end

	end

	always @(posedge ok or posedge reset)
  begin
  
		if (reset)
    begin

    	prox_estado = inicio;

    end

    else
    begin

      case(estado_atual)

        inicio:
        begin

        	if(nota == nota_nula1 || nota == nota_nula2)
          begin

            prox_estado = s_erro;

          end

          else
          begin

            prox_estado = s_n1;

          end

        end


  			s_n1:
        begin

        	if(nota != nota_nula1 && nota != nota_nula2)
          begin

            prox_estado = s_n2;

          end

          else
          begin

            prox_estado = s_erro;

          end

        end


  			s_n2:
        begin

  				if(nota == La_m)
          begin

  					prox_estado = s_N3_La;

          end

          else if(nota == Si_m)
          begin

            prox_estado = s_N3_Si;

          end

  				else
          begin

            prox_estado = s_erro;

          end

  			end


  			s_N3_La:
        begin

        	if(nota == nota_nula1 || nota == nota_nula2)
          begin

  					prox_estado = s_adj;

          end

          else if(nota == Do)
          begin

            prox_estado = s_N4_Do;
          end

  				else if(nota == Si_m)
          begin

  					prox_estado = s_N4_Si;

          end

          else
          begin

            prox_estado = s_erro;

          end

        end


        s_N3_Si:
        begin

          if(nota == nota_nula1 || nota == nota_nula2)
          begin

            prox_estado = s_adj;

          end

  				else if(nota == Re)
          begin

            prox_estado = s_N4_Re;

          end

          else
          begin

  					prox_estado = s_erro;

          end

  			end


  			s_N4_Do:
        begin
    			if(nota == nota_nula1 || nota == nota_nula2)
          begin

            prox_estado = s_comp;

          end

    			else
          begin

            prox_estado = s_erro;

          end

        end


        s_N4_Re:
        begin

        	if(nota == nota_nula1 || nota == nota_nula2)
          begin

            prox_estado = s_comp;

          end

          else
          begin

            prox_estado = s_erro;

          end

        end


        s_N4_Si:
        begin

        	if(nota == nota_nula1 || nota == nota_nula2)
          begin

            prox_estado = s_adv;

          end

          else
          begin

    				prox_estado = s_erro;

          end

    		end


        s_comp:
        begin

        	prox_estado = s_comp;

        end


        s_adv:
        begin

        	prox_estado = s_adv;

        end


        s_adj:
        begin

        	prox_estado = s_adj;

        end


    		s_erro:
        begin

        	prox_estado = s_erro;

        end

  		endcase

  	end

  end


  always @ (estado_atual)
  begin

		case(estado_atual)

			s_erro:
      begin

      	fim = processado;
				tipo = t_nenhum;

      end

			s_adj:
      begin

      	fim = processado;
				tipo = t_adj;

      end


      s_comp:
      begin

      	fim = processado;
				tipo = t_comp;

      end


      s_adv:
      begin

      	fim = processado;
				tipo = t_adv;

      end

			s_N3_La:
      begin

      	fim = em_processo;
				tipo = t_nenhum;

      end


      s_N3_Si:
      begin

      	fim = em_processo;
				tipo = t_nenhum;

      end


      s_N4_Do:
      begin

      	fim = em_processo;
				tipo = t_nenhum;

      end


      s_N4_Si:
      begin

      	fim = em_processo;
				tipo = t_nenhum;

      end


      s_N4_Re:
      begin

      	fim = em_processo;
				tipo = t_nenhum;

      end


      default:
      begin

      	fim = em_processo;
				tipo = t_nenhum;

      end

		endcase

	end

endmodule
