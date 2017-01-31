function [ pArea, pPerimeter ] = AreaandPerimeter( va,vb,dotnm,lengtha,lengthb )
%AREAANDPERIMETER Summary of this function goes here
%   Detailed explanation goes here
pArea=zeros(dotnm,1);
pPerimeter=zeros(dotnm,1);
for i=1:dotnm,
    
    [ pArea(i), pPerimeter(i)] = unitAreaandPerimeter( va,vb{i} ,lengtha,lengthb);
%     pArea(i)=areab( XY(i,:),va,vb{i});
%     pPerimeter{i}=perimetera( va,vb{i});
%     polyneibor{i}=zeros(length(vb{i}),1);
end

end

