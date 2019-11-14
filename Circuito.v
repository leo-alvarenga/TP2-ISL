module Circuito(D, N1, N2, N3, s0, s1, s2, s3, s4, s5, s6);

    input wire  D;
    input wire N1, N2, N3;
    output reg s0, s1, s2, s3, s4, s5, s6;

    always @ ( * )
    begin

        s0 = (~N3 & ~N2 & ~N1) | D;
        s1 = (~D & ~N2 & N1) | (~N2 & ~N1) | (D & ~N3 & ~N2) | (D & ~N3 & N1);
        s2 = (~N2 & ~N1) | (D & N1) | (N3 & N2 & N1);
        s3 = (~D & ~N3) | (~D & N3 & N1) | (N3 & N2 & ~N1);
        s4 = (~N2 & ~N1) | (~D & N3 & N2 & N1) | (D & N3 & N2) | (N3 & N2 & ~N1);
        s5 = (~D & ~N2 & ~N1) | (D & ~N3) | (~D & ~N3 & N1) | (D & N2 & ~N1);
        s6 = (~N3 & ~N2 & ~N1) | (N3 & ~N2 & N1) | (~D & ~N3 & N2);

    end

endmodule
