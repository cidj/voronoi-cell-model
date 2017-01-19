function [ Poneibor,Poedgelen,va,vb0,vb ] = unitneibors( XY,lengtha,lengthb )
%CELLNEIBORS Summary of this function goes here
%   Detailed explanation goes here

dotnm=length(XY);
XY_ext=ext9(lengtha,lengthb,XY);
% dotnm_ext=length(XY_ext);
% [va,vb]=voronoin(XY_ext);
[va,vb]=voronoiDiagram(delaunayTriangulation(XY_ext));
vb0=dex9(vb,dotnm);

Poedgelen=cell(dotnm,1);
for i=1:dotnm,
    Poedgelen{i}=perimetera( va,vb0{i});
end

Poneibor=cell(dotnm,1);
for i=1:dotnm,
    for j=i+1:dotnm,
        [ is,~,~,ij ]=neiborcpbc9( i,j,vb0,vb,dotnm );
        if(is),
            Poneibor{i}(ij(1))=j;
            Poneibor{j}(ij(2))=i;
        end    
    end
end

% Poneibor_ext=cell(dotnm_ext,1);
% for i=1:dotnm_ext,
%     for j=i+1:dotnm_ext,
%         [is,~,ij]=neiborcp(i,j,vb);
%         if(is),
%             Poneibor_ext{i}(ij(1))=j;
%             Poneibor_ext{j}(ij(2))=i;
%         end    
%     end
% end
% Poneibor=reduceneibor(dex9(Poneibor_ext,dotnm),dotnm);  
end

