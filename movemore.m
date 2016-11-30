function [ xy ] = movemove( xy,theta, r )
%MOVE Summary of this function goes here
%   Detailed explanation goes here
xy(:,1)=xy(:,1)+r*cos(theta);
xy(:,2)=xy(:,2)+r*sin(theta);
end