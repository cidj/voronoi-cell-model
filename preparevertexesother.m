% function [ theva0,thenvb ] = preparevertexesother( lengtha,lengthb,XY )
%PREPAREVERTEXES Summary of this function goes here
%   Detailed explanation goes here
dotnm=length(XY);
XY_ext=ext9(lengtha,lengthb,XY);
[theva,thevb]=voronoiDiagram(delaunayTriangulation(XY_ext));
thevb0=dex9(thevb,dotnm);


indexes=[];
for i=1:length(thevb0),
    indexes=union(indexes,thevb0{i});
end
theva=round(fallsquare(theva,0,lengtha,0,lengthb),3);
theva0=theva(indexes,:);
theva0=unique(theva0,'rows');

thenvb=cell(length(thevb0),1);
for i=1:length(thevb0),
    thevb0iva=theva(thevb0{i},:);
    [~,thenvb{i}]=ismember(thevb0iva,theva0,'rows');
end

% for i=1:length(thevb0);
%     disp(isequal(theva0(thenvb{i},:),theva(thevb0{i},:)));
% end


% end

