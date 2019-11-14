module Circuito_topo(D, N1, N2, N3, s0, s1, s2, s3, s4, s5, s6);
	input wire D;
	input wire N1, N2, N3;
	output reg s0, s1, s2, s3, s4, s5, s6;
	
	always @ ( * )
	begin
		s6 = (~N2 & ~N3 & ~D) | (N1 & N3 & ~D) | (~N1 & ~N2 & ~N3) | (N1 & N2 & N3);
		s5 = (N1 & N2 & ~N3 & ~D) | (~N1 & ~N2 & ~N3) | (~N1 & N2 & N3) | (N1 & ~N2 & N3) | (~N2 & D);
		s4 = (N2 & ~N3 & D) | (~N2 & N3 & ~D) | (N1 & N2 & ~N3) | (~N1 & ~N2);
		s3 = (N3 & ~D) | (~N1 & ~N2) | (~N1 & ~D) | (~N2 & ~D);
		s2 = (N1 & N3 & D) | (~N1 & ~N3) | (N2 & ~N3) | (N2 & D);
		s1 = (~N2 & ~N3 & D) | (N2 & N3 & ~D) | (~N1 & N3 & ~D) | (~N1 & ~N2 & ~N3) | (N1 & N2 & ~N3) | (~N1 & N2 & N3);
		s0 = D | (~N1 & ~N2 & ~N3);
	end
	
endmodule
