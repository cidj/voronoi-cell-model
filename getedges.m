function [ edges] = getedges( va,vbi,lengtha,lengthb )

[  va,vbi ] = movegrouptogether( va,vbi,lengtha,lengthb );
x=va(vbi,1);
y=va(vbi,2);
xx=[x;x(1)];
yy=[y;y(1)];
edges = sqrt(diff(xx).^2+ diff(yy).^2);

end