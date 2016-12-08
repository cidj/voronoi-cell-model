function [ edges ] = celledgefo( cellnm,unitnm, polyedgelen,va,vb)
%EDGES Summary of this function goes here
%   Detailed explanation goes here
edges=zeros(cellnm,1);
for i=1:cellnm,
edges(i)=Piunifo( i,unitnm,polyedgelen,va,vb );
end
end
