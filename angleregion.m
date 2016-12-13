function [ theta ] = angleregion( theta0,x1,y1,x2,y2 )
%ANGLEREGION Summary of this function goes here
%   Detailed explanation goes here
theta=atan2d(y2-y1,x2-x1);
while(theta<theta0)
    theta=theta+360;
end
while(theta>theta0+360)
    theta=theta-360;
end
end

