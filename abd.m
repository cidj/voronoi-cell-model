function [ XY_bd ] = abd( XY, celllattx,celllatty,lengtha,lengthb,hln,vln )
%ABD Summary of this function goes here
%   Detailed explanation goes here
xl=-celllattx/2;
xr=lengtha+celllattx/2;
yu=lengthb+celllatty/2;
yd=-celllatty/2;
BB=bd( xl,xr,yu,yd,hln,vln);
XY_bd=[XY;BB];
end

