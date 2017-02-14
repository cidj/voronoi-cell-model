function [ edles ] = cellsedgelen( pairs, XY,unitnm, lengtha,lengthb )
%CELLSEDGELEN Summary of this function goes here
%   Detailed explanation goes here
dotnm=length(XY);
XY_ext=ext9(lengtha,lengthb,XY);
[va,vb]=voronoiDiagram(delaunayTriangulation(XY_ext));
vb0=dex9(vb,dotnm);
lenp=size(pairs,1);
edles=zeros(lenp,1);
for i=1:lenp,
[ ~,edles(i) ] = istwocellconnect( pairs(i,1),pairs(i,2),unitnm,va,vb0,vb,dotnm,lengtha,lengthb );
end
end

