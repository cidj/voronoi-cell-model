function [ x ] = fall( x,a,b )
%FALL Summary of this function goes here
%   Detailed explanation goes here
while (x<a)
    x=x+b-a;
end
while(x>=b)
    x=x-b+a;
end
end

