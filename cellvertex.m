function [ vci ] = cellvertex( i,unitnm,va,vb )
%CELLVERTEX Summary of this function goes here
%   Detailed explanation goes here
% i=1;
% vb=vb0;
n1=cell2unit(i,1,unitnm);
u1=va(vb{n1},:);
u1_1=[u1;u1(1,:)];
if(not(ispolycw(u1_1(:,1),u1_1(:,2))))
    [u1_1(:,1),u1_1(:,2)]=poly2cw(u1_1(:,1),u1_1(:,2));
end
vci=u1_1;
% vx=cell(unitnm,1);
% vx{1,1}=u1_1;
for j=2:unitnm,
    nj=cell2unit(i,j,unitnm);
    uj=va(vb{nj},:);
    uj_1=[uj;uj(1,:)];
    if(not(ispolycw(uj_1(:,1),uj_1(:,2))))
        [uj_1(:,1),uj_1(:,2)]=poly2cw(uj_1(:,1),uj_1(:,2));
    end
%     vx{j,1}=uj_1;
    [x,y]=polybool('union',vci(:,1),vci(:,2),uj_1(:,1),uj_1(:,2));
    vci=[x,y];
end
vci(end,:)=[];
end

