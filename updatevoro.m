function [ va,vb,polyarea,polyedgelen,polyneibor ] = updatevoro( XY )
%UPDATEVORO Summary of this function goes here
%   Detailed explanation goes here
dotnm=length(XY);

[va,vb]=voronoin(XY);

polyarea=zeros(dotnm,1);
polyedgelen=cell(dotnm,1);
polyneibor=cell(dotnm,1);

for i=1:dotnm,
    polyarea(i)=areab( XY(i,:),va,vb{i});
    polyedgelen{i}=perimetera( va,vb{i});
    polyneibor{i}=zeros(length(vb{i}),1);
end

for i=1:dotnm,
    for j=i+1:dotnm,
        [is,pn,ij]=neiborcp(i,j,vb);
        if(is)
            polyneibor{i}(ij(1))=j;
            polyneibor{j}(ij(2))=i;
        end
    end
end

end

