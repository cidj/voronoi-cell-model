function [ len ] = distance(n1,n2,XY )
%DISTANCE Summary of this function goes here
%   Detailed explanation goes here
len=sqrt((XY(n1,1)-XY(n2,1))^2+(XY(n1,2)-XY(n2,2))^2);
end

