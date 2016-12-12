function [ p,ccw,angles,edges,cvx ] = cellorder( va,vbi )
%CELLORDER Summary of this function goes here
%   Detailed explanation goes here
len=length(vbi);
p=zeros(len,2);
for i=1:len,
    p(i,:)=va(vbi(i),:);
end
[ ccw,angles,edges,cvx ] = anglesedges( p );
end

