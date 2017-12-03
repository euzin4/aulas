module trv (
input [11:0] ptAX,
input [11:0] ptAY,
input [11:0] ptBX,
input [11:0] ptBY,
input [11:0] pttX,
input [11:0] pttY,
output trv);
wire signed [11:0] sbA;
wire signed [11:0] sbB;
wire signed [11:0] sbC;
wire signed [11:0] sbD;
wire signed [22:0] mpA;
wire signed [22:0] mpB;
wire signed [22:0] sbA;
assign sbA = pttX - ptBY;
assign sbB = ptAY - ptBY;
assign sbC = ptAX - ptBX;
assign sbD = pttY - ptBY;
assign mpA = sbA * sbB;
assign mpB = sbC * sbD;
assign sbA = mpA - mpB;
assign trv = (sbA >= 0) ? 1 : 0;
endmodule

module tstrig (
input [11:0] ptAX,
input [11:0] ptAY,
input [11:0] ptBX,
input [11:0] ptBY,
input [11:0] pt3X,
input [11:0] pt3Y,
input [11:0] pttX,
input [11:0] pttY,
output ins);
wire trv1;
wire trv2;
wire trv3;
assign ins = (trv1 == 1 && trv2 == 1 && trv3 == 1) ? 1:0;
trv S1(ptAX, ptAY, ptBX, ptBY, pttX, pttY, trv1);
trv S2(ptBX, ptBY, pt3X, pt3Y, pttX, pttY, trv2);
trv S3(pt3X, pt3Y, ptAX, ptAY, pttX, pttY, trv3);
endmodule

module Teste;
reg [11:0] ptAX;
reg [11:0] ptAY;
reg [11:0] ptBX;
reg [11:0] ptBY;
reg [11:0] pt3X;
reg [11:0] pt3Y;
reg [11:0] pttX;
reg [11:0] pttY;
wire Dentro;
tstrig A(ptAX, ptAY, ptBX, ptBY, pt3X, pt3Y, pttX, pttY, Dentro);
initial
        begin
           $dumpvars(0,A);
           #1
           ptAX <= 10;
           ptAY <= 10;
           ptBX <= 30;
           ptBY <= 10;
           pt3X <= 20;
           pt3Y <= 30;
           pttX <= 15;
           pttY <= 15;
           #1
           pttX <= 15;
           pttY <= 15;
           #1
           pttX <= 9;
           pttY <= 15;
           #1
           pttX <= 10;
           pttY <= 11;
           #1
           pttX <= 30;
           pttY <= 11;
           #40
           $finish;
        end
endmodule
