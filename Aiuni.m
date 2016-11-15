function [A ] = Aiuni( i,unitnm,pArea )
%AI3 Summary of this function goes here
%   Detailed explanation goes here
% A=0;
% for j=1:unitnm,
%     n=cell2unit(i,j,unitnm);
%     A=A+pArea(n);
% end

A=sum(pArea(cell2unit(i,1,unitnm):cell2unit(i,unitnm,unitnm)));

end

