function [ va,vb,pArea,pPerimeter] = updatevoro1( XY )
%UPDATEVORO Summary of this function goes here
%   Detailed explanation goes here
dotnm=length(XY);

[va,vb]=voronoin(XY);

pArea=zeros(dotnm,1);
pPerimeter=zeros(dotnm,1);
% polyneibor=cell(dotnm,1);

for i=1:dotnm,
    
    [ pArea(i), pPerimeter(i)] = unitAreaandPerimeter( va,vb{i} );
%     pArea(i)=areab( XY(i,:),va,vb{i});
%     pPerimeter{i}=perimetera( va,vb{i});
%     polyneibor{i}=zeros(length(vb{i}),1);
end

% for i=1:dotnm,
%     for j=i+1:dotnm,
%         [is,pn,ij]=neiborcp(i,j,vb);
%         if(is)
%             polyneibor{i}(ij(1))=j;
%             polyneibor{j}(ij(2))=i;
%         end
%     end
% end

end

