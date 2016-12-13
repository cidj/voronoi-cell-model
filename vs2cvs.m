function [ cvx,cvy ] = vs2cvs(vx,vy,unitnm)
%CELLVERTEX Summary of this function goes here
%   Detailed explanation goes here
dotnm=length(vx);
cellnm=dotnm/unitnm;
cvx=cell(cellnm,1);
cvy=cell(cellnm,1);
for i=1:dotnm,
    vx{i}=[vx{i},vx{i}(1)];
    vy{i}=[vy{i},vy{i}(1)];
    if(not(ispolycw(vx{i},vy{i})))
        [vx{i},vy{i}]=poly2cw(vx{i},vy{i});
    end
end

for i=1:cellnm,
    n1=cell2unit(i,1,unitnm);
    cvx{i}=vx{n1};
    cvy{i}=vy{n1};
    for j=2:unitnm,
        nj=cell2unit(i,j,unitnm);
        [cvx{i},cvy{i}]=polybool('union',cvx{i},cvy{i},vx{nj},vy{nj});
    end
    cvx{i}(end)=[];
    cvy{i}(end)=[];
end
end

