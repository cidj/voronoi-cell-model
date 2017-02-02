function [ r,the ] = changetoangledis( x,y )
%CHANGETOANGLEDIS Summary of this function goes here
%   Detailed explanation goes here
r=sqrt(x^2+y^2);
the=atan2(y,x);

end

