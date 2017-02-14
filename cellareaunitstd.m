function [ areas ] = cellareaunitstd( cellnm,unitnm, pArea )
%CELLAREA Summary of this function goes here
%   Detailed explanation goes here
areas=zeros(cellnm,1);
% for i=1:cellnm,
%     for j=1:unitnm,
%         areas(i)=areas(i)+polyarea(cell2unit(i,j,unitnm));
%     end
% end
for i=1:cellnm,
areas(i)=Aiunistd( i,unitnm,pArea );
end
end

