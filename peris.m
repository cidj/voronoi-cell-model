function [ x ] = peris( x,T )
%PERIS Summary of this function goes here
%   Detailed explanation goes here  
while(x>T)
    x=x-T;
end
while(x<1)
    x=x+T;
end
end

