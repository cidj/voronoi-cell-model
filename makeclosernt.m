function [ C ] = makeclosernt(A,B,ratio,lengtha,lengthb )
%MAKECLOSERMT Summary of this function goes here
%   Detailed explanation goes here


[ BB,~ ] = movetogether(A,B,lengtha,lengthb);
C=makecloserbias(A,BB,ratio);


end

