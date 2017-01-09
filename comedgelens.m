function [ pair, ring ] = comedgelens( motcels, XY,unitnm, lengtha,lengthb )
%CELLNEIBORS Summary of this function goes here
%   Detailed explanation goes here
pair=zeros(2,1);
ring=zeros(4,1);
dotnm=length(XY);
XY_ext=ext9(lengtha,lengthb,XY);
[va,vb]=voronoiDiagram(delaunayTriangulation(XY_ext));
vb0=dex9(vb,dotnm);
[ ~,pair(1) ] = istwocellconnect( motcels(1),motcels(3),unitnm,va,vb0,vb,dotnm,lengtha,lengthb );
[ ~,pair(2) ] = istwocellconnect( motcels(2),motcels(4),unitnm,va,vb0,vb,dotnm,lengtha,lengthb );
for i=1:4,
    [ ~,ring(i) ] = istwocellconnect( motcels(i),motcels(peris(i+1,4)),unitnm,va,vb0,vb,dotnm,lengtha,lengthb );
end
end

