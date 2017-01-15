function [ cagefor4 ] = cagecells( fourcells,ceineibodet )
%CAGECELLS Summary of this function goes here
%   Detailed explanation goes here
% fourcells=[1,7,33,23];
len=size(ceineibodet,1);
cagefor4=cell(len,1);
for i=1:len,   
    for j=1:4,
        cagefor4{i}=union(cagefor4{i},ceineibodet{i,fourcells(j)});      
    end
    cagefor4{i}=setdiff(cagefor4{i},fourcells);
end
end

