function [ cent ] = innercenter( p1,p2,p3 )
%INNERCENTER Summary of this function goes here
%   Detailed explanation goes here
a = sqrt(sum((p2-p3).^2));
b = sqrt(sum((p1-p3).^2));
c = sqrt(sum((p2-p1).^2));
cent = [(a*p1(1)+b*p2(1)+c*p3(1))/(a+b+c), (a*p1(2)+b*p2(2)+c*p3(2))/(a+b+c)];

end

