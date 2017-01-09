function [ len ] = distanpero( x1,y1,x2,y2,la,lb )
%DISTANPERO Summary of this function goes here
%   Detailed explanation goes here
lx=perodist(abs(x2-x1),la);
ly=perodist(abs(y2-y1),lb);

len=sqrt(lx^2+ly^2);

end

