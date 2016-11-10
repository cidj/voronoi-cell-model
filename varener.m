function [ varE ] = vartener( a1,a2,a3,A0,P,A )
%TOTENER Summary of this function goes here
%   Detailed explanation goes here
E= cellener(a1,a2,a3,A0,P,A);
varE=var(E);
end


