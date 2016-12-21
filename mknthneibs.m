function [ neinn ] = mknthneibs( selected,ceineibodet )
%MKNTHNEIBS Summary of this function goes here
%   Detailed explanation goes here
% selected=11;

timen=size(ceineibodet,1);
cellnmd=size(ceineibodet,2);
nn=floor(sqrt(cellnmd)/2);
neinn=cell(timen,nn);

for i=1:timen,
    all=union([],selected);
    neinn{i,1}=selected;
    for j=2:nn,
    thatnew=findneibors(i,neinn{i,j-1}, ceineibodet);
    neinn{i,j}=setdiff(thatnew,all);
    all=union(thatnew,all);
    end
end

end

