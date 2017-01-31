function [ Area, Perimeter] = unitAreaandPerimeter( va,vbi,lengtha,lengthb )

[  va,vbi ] = movegrouptogether( va,vbi,lengtha,lengthb );
x=va(vbi,1);
y=va(vbi,2);
Area=polyarea(x,y);
xx=[x;x(1)];
yy=[y;y(1)];
Perimeter = sum(sqrt(diff(xx).^2+ diff(yy).^2));
% x=va(vbi,1);
% y=va(vbi,2);
% [k,Area] = convexHull(delaunayTriangulation(x,y));
% Perimeter = sum(sqrt(diff(x(k)).*diff(x(k))+ diff(y(k)).*diff(y(k))));
end

