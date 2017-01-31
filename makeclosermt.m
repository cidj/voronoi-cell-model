function [ C,D ] = makeclosermt(A,B,ratio,lengtha,lengthb )
%MAKECLOSERMT Summary of this function goes here
%   Detailed explanation goes here


[ BB,~ ] = movetogether(A,B,lengtha,lengthb);

[C,D]=makecloser(A,BB,ratio);
C=fallsquare(C,0,lengtha,0,lengthb );
D=fallsquare(D,0,lengtha,0,lengthb );


end

