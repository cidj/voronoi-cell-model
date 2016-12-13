function [ k ] = lineslope( pp,n1,n2 )
%LINESLOPE Summary of this function goes here
%   Detailed explanation goes here
x1=pp(n1,1);
y1=pp(n1,2);
x2=pp(n2,1);
y2=pp(n2,2);
k=(y1-y2)/(x1-x2);

end

