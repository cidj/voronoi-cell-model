function [ bo ] = inregion( x,y,x1,x2,y1,y2 )
%INREGION Summary of this function goes here
%   Detailed explanation goes here
if(x>=x1&&x<x2&&y>=y1&&y<y2)
    bo=1;
else
    bo=0;
end

end

