module trv (
input [11:0] ptAX,
input [11:0] ptAY,
input [11:0] ptBX,
input [11:0] ptBY,
input [11:0] ptCX,
input [11:0] ptCY,
output trv);
wire signed [11:0] sub1;
wire signed [11:0] sub2;
wire signed [11:0] sub3;
wire signed [11:0] sub4;
wire signed [22:0] mp1;
wire signed [22:0] mp2;
wire signed [22:0] compr;
assign sub1 = ptCX - ptBY;
assign sub2 = ptAY - ptBY;
assign sub3 = ptAX - ptBX;
assign sub4 = ptCY - ptBY;
assign mp1 = sub1 * sub2;
assign mp2 = sub3 * sub4;
assign compr = mp1 - mp2;
assign trv = (compr >= 0) ? 1 : 0;
endmodule

module tstTR (
input [11:0] ptAX,
input [11:0] ptAY,
input [11:0] ptBX,
input [11:0] ptBY,
input [11:0] pt3X,
input [11:0] pt3Y,
input [11:0] ptCX,
input [11:0] ptCY,
output ins);
wire sig1;
wire sig2;
wire sig3;
assign ins = (sig1 == 1 && sig2 == 1 && sig3 == 1) ? 1:0;
trv S1(ptAX, ptAY, ptBX, ptBY, ptCX, ptCY, sig1);
trv S2(ptBX, ptBY, pt3X, pt3Y, ptCX, ptCY, sig2);
trv S3(pt3X, pt3Y, ptAX, ptAY, ptCX, ptCY, sig3);
endmodule

module tste;
reg [11:0] ptAX;
reg [11:0] ptAY;
reg [11:0] ptBX;
reg [11:0] ptBY;
reg [11:0] pt3X;
reg [11:0] pt3Y;
reg [11:0] ptCX;
reg [11:0] ptCY;
wire dentro;
tstTR A(ptAX, ptAY, ptBX, ptBY, pt3X, pt3Y, ptCX, ptCY, dentro);
initial
    begin
        $dumpvars(0,A);
        #1
        ptAX <= 1;
        ptAY <= 1;
        ptBX <= 3;
        ptBY <= 1;
        pt3X <= 2;
        pt3Y <= 3;
        ptCX <= 1.5;
        ptCY <= 1.5;
        #1
        ptCX <= 1.5;
        ptCY <= 1.5;
        #1
        ptCX <= 0.9;
        ptCY <= 1.5;
        #1
        ptCX <= 1;
        ptCY <= 1.1;
        #1
        ptCX <= 3;
        ptCY <= 1.1;
        #40
        $finish;
    end
endmodule
