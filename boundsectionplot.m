function [ ] = boundsectionplot( x1,y1,x2,y2,a1,a2,b1,b2,color,Linw,fon )
%BOUNDSECTIONPLOT Summary of this function goes here
%   Detailed explanation goes here

plot([x1,x2],[y1,y2],color,Linw,fon);
[xn,x1n,x2n] = sectionfall( x1,x2,a1,a2 );
if(xn)
    plot([x1n,x2n],[y1,y2],color,Linw,fon);
end
[yn, y1n,y2n] = sectionfall( y1,y2,b1,b2 );
if(yn)
    plot([x1,x2],[y1n,y2n],color,Linw,fon);
end 
if(xn&&yn)
    plot([x1n,x2n],[y1n,y2n],color,Linw,fon);
end

end

