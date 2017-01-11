function [vc] = findcellsvetex(unitnm,vb,vb_n )
%FINDCELLVETEX Summary of this function goes here
%   Detailed explanation goes here
lb=length(vb);
cellnm=lb/unitnm;
vc=cell(cellnm,1);
for i=1:cellnm,
vc{i}=acellvertex(i,unitnm,vb,vb_n );
end
end

