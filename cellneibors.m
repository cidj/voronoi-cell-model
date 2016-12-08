function [ceneinm, cellneibor ] = cellneibors( Poneibor,unitnm )
%CELLNEIBORS Summary of this function goes here
%   Detailed explanation goes here
dotnm=length(Poneibor);
for i=1:dotnm,
    for j=1:length(Poneibor{i}),
        Poneibor{i}(j)=unit2cell(Poneibor{i}(j),unitnm);
    end
end
cellnm=dotnm/unitnm;
cellneibor=cell(cellnm,1);
ceneinm=zeros(cellnm,1);

for i=1:cellnm,
    n1=cell2unit(i,1,unitnm);
    cellneibor{i}=Poneibor{n1};
    for j=2:unitnm,
        nj=n1-1+j;
        cellneibor{i}=union(cellneibor{i},Poneibor{nj});
    end
    cellneibor{i}(cellneibor{i}==i)=[];
    ceneinm(i)=length(cellneibor{i});
end     
end