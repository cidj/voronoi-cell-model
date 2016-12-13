function [ dis ] = linedist( x1,y1,x2,y2,k )
%LINEDIST Summary of this function goes here
%   Detailed explanation goes here
dis=abs((y1-k*x1)-(y2-k*x2))/sqrt(k^2+1);

end

